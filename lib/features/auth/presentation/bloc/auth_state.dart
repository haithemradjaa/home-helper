/// Authentication State Management for Home Helper Application
///
/// This file defines the state representation and management for authentication
/// in the Home Helper application, utilizing the BLoC state management pattern.
///
/// Key Responsibilities:
/// - Represent all possible authentication states
/// - Provide a comprehensive view of the current authentication context
/// - Support type-safe state transitions
///
/// State Lifecycle:
/// - initial: Application startup state
/// - loading: Authentication process in progress
/// - authenticated: User successfully logged in
/// - unauthenticated: No active user session
/// - error: Authentication failure or system error
///
/// Design Principles:
/// - Immutability: States are immutable snapshots
/// - Equatable: Enables efficient state comparison
/// - Comprehensive: Captures full authentication context
///
/// State Composition:
/// - Authentication status
/// - Current user (if authenticated)
/// - Error information (if applicable)
///
/// Typical Use Cases:
/// - Determining UI navigation flow
/// - Controlling access to protected routes
/// - Displaying authentication-related messages
///
/// Example:
/// ```dart
/// // Checking authentication state
/// if (state.status == AuthStatus.authenticated) {
///   navigateToHomeScreen();
/// }
/// ```
///
/// Future Extensibility:
/// - Support for more complex authentication scenarios
/// - Easy integration with different authentication providers
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
