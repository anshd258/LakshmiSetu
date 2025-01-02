import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthState extends Equatable {
  final bool isLoading;
  final String? errorMessage;
  final User? user;

  const AuthState({
    this.isLoading = false,
    this.errorMessage,
    this.user,
  });

  AuthState copyWith({
    bool? isLoading,
    String? errorMessage,
    User? user,
  }) {
    return AuthState(
      isLoading: isLoading ?? this.isLoading,
      errorMessage: errorMessage,
      user: user ?? this.user,
    );
  }

  @override
  List<Object?> get props => [isLoading, errorMessage, user];
}

class AuthInitial extends AuthState {
  const AuthInitial() : super();
}


class AuthLoading extends AuthState {}

class AuthSuccess extends AuthState {
  final String message;
  const AuthSuccess(this.message);

  @override
  List<Object> get props => [message];
}

class AuthError extends AuthState {
  final String error;
  const AuthError(this.error);

  @override
  List<Object> get props => [error];
}
