import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:riverpod_test/views/home_screen.dart';
import 'package:riverpod_test/views/login_screen.dart';
import 'package:riverpod_test/views/pageNotFound.dart';

final goRouterProvider = Provider<GoRouter>((ref) {
  return GoRouter(
    debugLogDiagnostics: true,
    routes: [
      GoRoute(
        path: '/',
        builder: (context, state) => const LoginScreen(),
      ),
      GoRoute(
        path: '/home',
        builder: (context, state) => const HomeScreen(),
      ),
      GoRoute(
        path: '/pageNotFound',
        builder: (context, state) => const PageNotFound(),
      ),
    ],
  );
});
