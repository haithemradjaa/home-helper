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
