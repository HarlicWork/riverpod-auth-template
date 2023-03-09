import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_test/providers/auth_provider.dart';

class PageNotFound extends StatelessWidget {
  const PageNotFound({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Page Not Found"),
      ),
      body: Center(
        child: Consumer(builder: (context, ref, child) {
          final auth = ref.watch(authControllerProvider);

          return auth.when(
            loading: () => const CircularProgressIndicator(),
            data: (_) {
              return const SizedBox.shrink();
            },
            error: (error, stack) => Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  error.toString(),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 10.0),
                  child: ElevatedButton(
                      onPressed: () {
                        ref.read(authControllerProvider.notifier).logout();
                      },
                      child: const Text('Logout')),
                ),
              ],
            ),
          );

          // return Column(
          //   mainAxisAlignment: MainAxisAlignment.center,
          //   children: const [
          //     Text('Error!'),
          //   ],
          // );
        }),
      ),
    );
  }
}
