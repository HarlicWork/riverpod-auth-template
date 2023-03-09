import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_test/providers/auth_provider.dart';

class PageNotFound extends StatelessWidget {
  const PageNotFound({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Consumer(builder: (context, ref, child) {
          final auth = ref.watch(authControllerProvider);

          return auth.when(
            loading: () => const CircularProgressIndicator(),
            data: (data) {
              final message = data.toString();

              return Text(message);
            },
            error: (error, stack) => Text(
              error.toString(),
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
