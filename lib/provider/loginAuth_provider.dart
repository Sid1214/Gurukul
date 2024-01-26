import 'dart:convert';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gurukul/model/storage.dart';
import 'package:http/http.dart' as http;

import 'package:shared_preferences/shared_preferences.dart';

const fastApiUrl = 'https://gurukul-api-prod-si-as.azurewebsites.net';

class AuthState {
  final String accessToken;
  final String password;
  final int institutionID;

  AuthState(this.accessToken, this.password, this.institutionID);

  AuthState copyWith(
      {String? accessToken,
      // String? email,
      String? password,
      int? institutionID}) {
    return AuthState(accessToken ?? this.accessToken, password ?? this.password,
        institutionID ?? this.institutionID);
  }
}

class AuthNotifier extends StateNotifier<AuthState> {
  AuthNotifier() : super(AuthState('', '', 0)) {
    loadState();
  }
  Future<void> loadState() async {
    await loadToken();
    await loadInstitute();
    // await loadEmail();
  }

  Future<void> logOut() async {
    // await removeEmail();
    await removeInstitution();
    await removeToken();
  }

  final String _tokenKey = 'auth_token';

  final String _institute = 'institute_id';

  Future<AuthResult> authenticateUser(String email, String password) async {
    const endPoint = '/Login/token';
    final totalUrl = Uri.parse(fastApiUrl + endPoint);

    final payload = {
      "grant_type": '',
      "username": email,
      'password': password,
      'scope': '',
    };

    try {
      final authResponse = await http.post(
        totalUrl,
        headers: {'Content-Type': 'application/x-www-form-urlencoded'},
        body: payload,
      );

      if (authResponse.statusCode == 200) {
        final accessToken = json.decode(authResponse.body)['access_token'];
        final int institutionID =
            json.decode(authResponse.body)['institution_id'];
        state = AuthState(accessToken, password, institutionID);
        await _saveToken(accessToken);
        await _saveInstitute(institutionID);

        final userStorage = UserStorage();
        await userStorage.saveEmail(email);
        await userStorage
            .saveIsLoggin(accessToken)
            .then((_) {})
            .catchError((error) {
          print('Error saving interpreter id: $error');
        });

        return AuthResult(authResponse.statusCode, error: null);
      } else {
        final errorMessage =
            'Error: ${authResponse.statusCode}, ${authResponse.body}';
        return AuthResult(authResponse.statusCode, error: errorMessage);
      }
    } catch (e) {
      final errorMessage = 'Error: $e';
      return AuthResult(500, error: errorMessage);
    }
  }

  Future<void> _saveToken(String token) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(_tokenKey, token);
  }

  Future<void> _saveInstitute(int instituteId) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setInt(_institute, instituteId);
  }

  Future<void> loadToken() async {
    final prefs = await SharedPreferences.getInstance();
    final token = prefs.getString(_tokenKey);

    if (token != null) {
      // If a token is found, set it in the state
      state = state.copyWith(accessToken: token);
    }
  }

  Future<void> loadInstitute() async {
    final prefs = await SharedPreferences.getInstance();
    final institutionID = prefs.getInt(_institute);

    if (institutionID != null) {
      // If a token is found, set it in the state
      state = state.copyWith(institutionID: institutionID);
    }
  }

  Future<void> removeToken() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove(_tokenKey);
  }

  Future<void> removeInstitution() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove(_institute);
  }
}

class AuthResult {
  final int statusCode;
  final String? error;

  AuthResult(this.statusCode, {this.error});
}

final authNotifierProvider =
    StateNotifierProvider<AuthNotifier, AuthState>((ref) {
  return AuthNotifier();
});
