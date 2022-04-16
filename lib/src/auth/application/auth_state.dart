part of 'auth_cubit.dart';

class AuthState {
  final bool isAuthenticated;
  AuthState({
    required this.isAuthenticated,
  });

  factory AuthState.initial() => AuthState(
        isAuthenticated: false,
      );

  AuthState copyWith({
    bool? isAuthenticated,
  }) {
    return AuthState(
      isAuthenticated: isAuthenticated ?? this.isAuthenticated,
    );
  }

  @override
  String toString() => 'AuthState(isAuthenticated: $isAuthenticated )';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is AuthState && other.isAuthenticated == isAuthenticated;
  }

  @override
  int get hashCode => runtimeType.hashCode ^ isAuthenticated.hashCode;
}
