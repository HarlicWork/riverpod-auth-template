import 'package:riverpod_test/models/login_response.model.dart';
import 'package:riverpod_test/models/login_states.model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

abstract class AuthRepository {
  Future<LoginState> login(String email, String password);
}

class AuthRepositoryImpl implements AuthRepository {
  @override
  Future<LoginState> login(String email, String password) async {
    await Future.delayed(const Duration(seconds: 2));
    const response =
        LoginResponse(token: '12345abcd', message: "Login Success");

    if (response == null) {
      return const LoginState.error("Login Failed");
    }

    return const LoginState.success();
  }
}

final authRepositoryProvider = Provider<AuthRepository>((ref) {
  return AuthRepositoryImpl();
});
