// ignore_for_file: non_constant_identifier_names

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutterproject/data/data_providers/auth_data_provider.dart';
import 'package:flutterproject/data/data_providers/users_data_provider.dart';

import '../data/repositories/auth_repository.dart';
import '../data/repositories/users_repository.dart';
import '../core/auth-api-service.dart';
import '../core/users_api_service.dart';
import '../models/user.dart';

class AuthNotifier extends StateNotifier<AsyncValue<AuthState>> {
  AuthNotifier() : super(const AsyncValue.loading());

  void login({required String username, required String password}) async {
    state = const AsyncValue.loading();
    try {
      final AuthRepository authRepository = AuthRepository(
          AuthApiService() as AuthDataProvider,
          baseUrl: '/signin');
      final token = await authRepository.login(username, password);
      final UsersRepository usersRepository =
          UsersRepository(UsersApiService() as UsersDataProvider);
      final user = await usersRepository.getCurrentUser(token);
      state = AsyncValue.data(
        AuthState.loggedIn(
          user: User(
            id: user.id,
            username: user.username,
            email: user.email,
            joinDate: user.joinDate,
            role: user.role,
            token: token,
          ),
        ),
      );
    } catch (e) {
      state = AsyncValue.error(e, stackTrace: StackTrace.current);
    }
  }

  void register({
    required String username,
    required String email,
    required String password,
    required String confirmPassword,
  }) async {
    state = const AsyncValue.loading();
    try {
      final AuthRepository authRepository =
          AuthRepository(AuthApiService() as AuthDataProvider, baseUrl: '');
      final token = await authRepository.register(
          username, email, password, confirmPassword);
      final UsersRepository usersRepository =
          UsersRepository(UsersApiService() as UsersDataProvider);
      final user = await usersRepository.getCurrentUser(token);
      state = AsyncValue.data(
        AuthState.loggedIn(
          user: User(
            id: user.id,
            username: user.username,
            email: user.email,
            joinDate: user.joinDate,
            role: user.role,
            token: token,
          ),
        ),
      );
    } catch (e) {
      state = AsyncValue.error(e, stackTrace: StackTrace.current);
    }
  }

  void logout() async {
    state = const AsyncValue.loading();
    try {
      final AuthRepository authRepository = AuthRepository(
          AuthApiService() as AuthDataProvider,
          baseUrl: '/logout');
      await authRepository.logout();
      state = AsyncValue.data(AuthState.loggedOut());
    } catch (e) {
      state = AsyncValue.error(e, stackTrace: StackTrace.current);
    }
  }
}

class AuthApiService {}

final authProvider =
    StateNotifierProvider<AuthNotifier, AsyncValue<AuthState>>((ref) {
  return AuthNotifier();
});

class AuthState {
  final User? user;
  final String? error;

  AuthState._({this.user, this.error});

  factory AuthState.initial() {
    return AuthState._();
  }

  factory AuthState.loggedIn({required User user}) {
    return AuthState._(user: user);
  }

  factory AuthState.loggedOut() {
    return AuthState._();
  }

  factory AuthState.error(String error) {
    return AuthState._(error: error);
  }
}
