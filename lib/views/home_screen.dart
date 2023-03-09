import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_test/providers/auth_provider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Home Screen"),
      ),
      body: Center(
        child: Consumer(
          builder: (context, ref, child) {
            final authState = ref.watch(authControllerProvider);

            return authState.when(
              loading: () => const CircularProgressIndicator(),
              data: (_) => Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text("Home Screen"),
                    Padding(
                      padding: const EdgeInsets.only(top: 10.0),
                      child: ElevatedButton(
                          onPressed: () {
                            ref.read(authControllerProvider.notifier).logout();
                          },
                          child: const Text('Logout')),
                    )
                  ],
                ),
              ),
              error: (error, stack) =>
                  const Text('Oops, something unexpected happened'),
            );
          },
        ),
      ),
    );
  }
}
