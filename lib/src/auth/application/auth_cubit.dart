import 'dart:async';

import 'package:bloc/bloc.dart';

import '../domain/auth_repository_interface.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  late final AuthRepositoryInterface authRepository;

  AuthCubit({required this.authRepository}) : super(AuthState.initial());

  Future<void> isAuthenticated() async {
    final result = await authRepository.isAuthenticated();
    final newState = state.copyWith(
      isAuthenticated: result,
    );
    emit(newState);
  }
}
