/// Authentication Events for Home Helper Application
///
/// This file defines a comprehensive set of events that represent user interactions
/// and system triggers related to authentication in the Home Helper application.
///
/// Key Responsibilities:
/// - Define all possible authentication-related events
/// - Provide a type-safe mechanism for describing user actions
/// - Support the BLoC (Business Logic Component) state management pattern
///
/// Event Categories:
/// - User Interactions: SignIn, Register, SignOut
/// - System Events: CheckAuthStatus, AuthStatusChanged
/// - Profile Management: UpdateProfile
///
/// Design Principles:
/// - Immutability: Events are immutable and represent a single action
/// - Type Safety: Strongly typed events prevent runtime errors
/// - Equatable: Enables efficient event comparison and processing
///
/// Event Flow:
/// 1. User performs an action (e.g., login)
/// 2. Corresponding event is created
/// 3. BLoC processes the event
/// 4. State is updated accordingly
///
/// Typical Use Cases:
/// - Handling authentication requests
/// - Tracking user authentication lifecycle
/// - Managing user profile changes
///
/// Example:
/// ```dart
/// // Creating a sign-in event
/// final event = SignInRequested(
///   email: 'user@example.com',
///   password: 'securePassword'
/// );
/// authBloc.add(event);
/// ```
///
/// Future Extensibility:
/// - Easy to add new authentication methods
/// - Support for complex authentication flows
import 'package:equatable/equatable.dart';

/// Base class for all authentication events
abstract class AuthEvent extends Equatable {
  const AuthEvent();

  @override
  List<Object?> get props => [];
}

/// Event to check the current authentication status
class CheckAuthStatus extends AuthEvent {
  const CheckAuthStatus();
}

/// Event to sign in a user with email and password
class SignInRequested extends AuthEvent {
  const SignInRequested({
    required this.email,
    required this.password,
  });

  final String email;
  final String password;

  @override
  List<Object> get props => [email, password];
}

/// Event to register a new user
class RegisterRequested extends AuthEvent {
  const RegisterRequested({
    required this.name,
    required this.email,
    required this.password,
  });

  final String name;
  final String email;
  final String password;

  @override
  List<Object> get props => [name, email, password];
}

/// Event to sign out the current user
class SignOutRequested extends AuthEvent {
  const SignOutRequested();
}

/// Event to update the user's profile
class UpdateProfileRequested extends AuthEvent {
  const UpdateProfileRequested({
    this.name,
    this.photoUrl,
  });

  final String? name;
  final String? photoUrl;

  @override
  List<Object?> get props => [name, photoUrl];
}

/// Event when authentication status changes
class AuthStatusChanged extends AuthEvent {
  const AuthStatusChanged();
}
