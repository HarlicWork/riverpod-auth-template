import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_test/models/login_states.model.dart';
import 'package:riverpod_test/providers/auth_provider.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Login Screen"),
      ),
      body: Container(
        padding: const EdgeInsets.only(top: 20.0),
        height: 300,
        width: double.infinity,
        child: Consumer(
          builder: (context, ref, _) {
            final auth = ref.watch(authControllerProvider);

            return Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextField(
                    controller: _emailController,
                    decoration: const InputDecoration(
                      hintText: "Email",
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextField(
                    controller: _passwordController,
                    obscureText: true,
                    decoration: const InputDecoration(
                      hintText: "Password",
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                ElevatedButton(
                  onPressed: auth == const AsyncData(LoginState.initial())
                      ? () {
                          setState(
                            () {
                              ref.read(authControllerProvider.notifier).login(
                                    _emailController.text,
                                    _passwordController.text,
                                  );
                            },
                          );
                        }
                      : null,
                  child: auth == const AsyncData(LoginState.initial()) ||
                          auth == const AsyncData(LoginState.success())
                      ? const Text("Login")
                      : const SizedBox(
                          width: 20,
                          height: 20,
                          child: CircularProgressIndicator(
                            color: Colors.white,
                          ),
                        ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
