import 'package:equatable/equatable.dart';
import 'package:home_helper/features/auth/domain/entities/user.dart';

/// Represents the different states of authentication in the app
enum AuthStatus {
  /// Initial state when the app starts
  initial,

  /// Loading state during authentication operations
  loading,

  /// User is authenticated
  authenticated,

  /// User is not authenticated
  unauthenticated,

  /// An error occurred during authentication
  error,
}

/// Authentication state class that holds the current auth status and user data
class AuthState extends Equatable {
  const AuthState({
    this.status = AuthStatus.initial,
    this.user,
    this.errorMessage,
  });

  final AuthStatus status;
  final User? user;
  final String? errorMessage;

  @override
  List<Object?> get props => [status, user, errorMessage];

  AuthState copyWith({
    AuthStatus? status,
    User? user,
    String? errorMessage,
  }) {
    return AuthState(
      status: status ?? this.status,
      user: user ?? this.user,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }

  /// Initial state when the app starts
  static const initial = AuthState();

  /// Loading state during authentication operations
  static const loading = AuthState(status: AuthStatus.loading);

  /// Creates an authenticated state with the given user
  static AuthState authenticated(User user) => AuthState(
        status: AuthStatus.authenticated,
        user: user,
      );

  /// Unauthenticated state when no user is logged in
  static const unauthenticated = AuthState(
    status: AuthStatus.unauthenticated,
  );

  /// Creates an error state with the given error message
  static AuthState error(String message) => AuthState(
        status: AuthStatus.error,
        errorMessage: message,
      );
}
