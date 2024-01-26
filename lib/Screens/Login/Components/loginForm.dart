import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gurukul/Screens/Dashboard/dashboardScreen.dart';
import 'package:gurukul/Screens/erroScreen/errorScreen.dart';
import 'package:gurukul/other/constraits.dart';
import 'package:gurukul/provider/loginAuth_provider.dart';

class LoginForm extends ConsumerStatefulWidget {
  const LoginForm({super.key});

  @override
  ConsumerState<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends ConsumerState<LoginForm> {
  final _formKey = GlobalKey<FormState>();
  var _enteredemail = '';
  var _enteredPassword = '';
  bool isloading = false;

  void onClick() async {
    final authNotifier = ref.read(authNotifierProvider.notifier);

    if (_formKey.currentState?.validate() ?? false) {
      _formKey.currentState!.save();

      setState(() => isloading = true);

      try {
        final result = await authNotifier.authenticateUser(
            _enteredemail, _enteredPassword);

        if (result.statusCode == 200) {
          fetchDetailforlogin();
        } else {
          Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => ErrorScreen(
                errorMessage: result.error ?? 'Failed to Authenticate'),
          ));
        }
      } catch (e) {
        print('Error during authentication: $e');
      } finally {
        setState(() {
          isloading = false;
        });
      }
    }
  }

  void fetchDetailforlogin() async {
    Navigator.of(context)
        .push(MaterialPageRoute(builder: (context) => const DashboardScreen()));
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          TextFormField(
            keyboardType: TextInputType.emailAddress,
            textInputAction: TextInputAction.next,
            cursorColor: kPrimaryColor,
            decoration: const InputDecoration(
              hintText: "Your email",
              prefixIcon: Padding(
                padding: EdgeInsets.all(16.0),
                child: Icon(Icons.person),
              ),
            ),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter valid email';
              }
              return null;
            },
            onSaved: (value) {
              _enteredemail = value!;
            },
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: defaultPadding),
            child: TextFormField(
              textInputAction: TextInputAction.done,
              obscureText: true,
              cursorColor: kPrimaryColor,
              decoration: const InputDecoration(
                hintText: "Your password",
                prefixIcon: Padding(
                  padding: EdgeInsets.all(defaultPadding),
                  child: Icon(Icons.lock),
                ),
              ),
              keyboardType: TextInputType.visiblePassword,
              autocorrect: false,
              onSaved: (value) {
                _enteredPassword = value!;
              },
            ),
          ),
          const SizedBox(height: defaultPadding),
          ElevatedButton(
            onPressed: onClick,
            child: isloading == false
                ? Text(
                    "Login".toUpperCase(),
                  )
                : const CircularProgressIndicator(color: Colors.white),
          ),
          TextButton(
              onPressed: () {},
              child: const Text(
                'Forget Password?',
                style: TextStyle(color: kPrimaryColor),
              ))
        ],
      ),
    );
  }
}
