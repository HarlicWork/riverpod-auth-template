import 'dart:async';

import 'package:riverpod_test/models/login_states.model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_test/providers/router_provider.dart';
import 'package:riverpod_test/repositories/auth_repository.dart';

final authControllerProvider =
    AutoDisposeAsyncNotifierProvider<AuthProviderController, LoginState>(
        AuthProviderController.new);

class AuthProviderController extends AutoDisposeAsyncNotifier<LoginState> {
  @override
  Future<LoginState> build() async {
    return const LoginState.initial();
  }

  Future<void> login(
    String email,
    String password,
  ) async {
    final authRepository = ref.read(authRepositoryProvider);

    state = const AsyncLoading();

    state = await AsyncValue.guard<LoginState>(
      () => authRepository.login(email, password),
    );

    if (state.hasError == false) {
      ref.read(goRouterProvider).go('/home');
    } else {
      state = const AsyncValue.error("Login Failed", StackTrace.empty);
      ref.read(goRouterProvider).go('/pageNotFound');
    }
  }

  Future<void> logout() async {
    state = const AsyncValue.data(LoginState.initial());
    ref.read(goRouterProvider).go('/');
  }
}
