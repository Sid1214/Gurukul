import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class UserStorage {
  final _storage = const FlutterSecureStorage();

  Future<void> saveEmail(String email) async {
    await _storage.write(key: 'email', value: email);
  }

  Future<String?> getEmail() async {
    return await _storage.read(key: 'email');
  }

  Future<void> removeEmail() async {
    await _storage.delete(key: 'email');
  }

  Future<void> saveInterpreterId(String interpreterId) async {
    await _storage.write(key: 'interpreterId', value: interpreterId);
  }

  Future<String?> getInterpreterId() async {
    return await _storage.read(key: 'interpreterId');
  }

  Future<void> removeInterpreterId() async {
    await _storage.delete(key: 'interpreterId');
  }

  Future<void> saveInterpreterName(String interpreterId) async {
    await _storage.write(key: 'interpreterName', value: interpreterId);
  }

  Future<String?> getInterpreterName() async {
    return await _storage.read(key: 'interpreterName');
  }

  Future<void> removeInterpreterName() async {
    await _storage.delete(key: 'interpreterName');
  }

  Future<void> saveInterpreterLocation(String interpreterId) async {
    await _storage.write(key: 'interpreterLocation', value: interpreterId);
  }

  Future<String?> getInterpreterLocation() async {
    return await _storage.read(key: 'interpreterLocation');
  }

  Future<void> removeInterpreterLocation() async {
    await _storage.delete(key: 'interpreterLocation');
  }

  Future<void> saveIsLoggin(String login) async {
    await _storage.write(key: 'isLoggin', value: login);
  }

  Future<String?> getIsLoggin() async {
    return await _storage.read(key: 'isLoggin');
  }

  Future<void> removeIsLoggin() async {
    await _storage.delete(key: 'isLoggin');
  }

  Future<void> signOut() async {
    await removeEmail();
  }
}
