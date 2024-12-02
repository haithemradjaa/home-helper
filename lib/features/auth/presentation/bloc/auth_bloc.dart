import 'dart:async';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:home_helper/features/auth/domain/entities/user.dart';
import 'package:home_helper/features/auth/presentation/bloc/auth_event.dart';
import 'package:home_helper/features/auth/presentation/bloc/auth_state.dart';

/// BLoC that handles authentication logic and state management
class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc() : super(AuthState.initial) {
    on<CheckAuthStatus>(_onCheckAuthStatus);
    on<SignInRequested>(_onSignInRequested);
    on<RegisterRequested>(_onRegisterRequested);
    on<SignOutRequested>(_onSignOutRequested);
    on<UpdateProfileRequested>(_onUpdateProfileRequested);
    on<AuthStatusChanged>(_onAuthStatusChanged);
  }

  Future<void> _onCheckAuthStatus(
    CheckAuthStatus event,
    Emitter<AuthState> emit,
  ) async {
    emit(AuthState.loading);
    try {
      // TODO: Implement actual auth status check
      // For now, we'll assume the user is not authenticated
      emit(AuthState.unauthenticated);
    } catch (e) {
      emit(AuthState.error(e.toString()));
    }
  }

  Future<void> _onSignInRequested(
    SignInRequested event,
    Emitter<AuthState> emit,
  ) async {
    emit(AuthState.loading);
    try {
      // TODO: Implement actual sign in logic
      // For now, we'll create a mock user
      final user = User(
        id: 'mock_id',
        name: 'John Doe',
        email: event.email,
      );
      emit(AuthState.authenticated(user));
    } catch (e) {
      emit(AuthState.error(e.toString()));
    }
  }

  Future<void> _onRegisterRequested(
    RegisterRequested event,
    Emitter<AuthState> emit,
  ) async {
    emit(AuthState.loading);
    try {
      // TODO: Implement actual registration logic
      // For now, we'll create a mock user
      final user = User(
        id: 'mock_id',
        name: event.name,
        email: event.email,
      );
      emit(AuthState.authenticated(user));
    } catch (e) {
      emit(AuthState.error(e.toString()));
    }
  }

  Future<void> _onSignOutRequested(
    SignOutRequested event,
    Emitter<AuthState> emit,
  ) async {
    emit(AuthState.loading);
    try {
      // TODO: Implement actual sign out logic
      emit(AuthState.unauthenticated);
    } catch (e) {
      emit(AuthState.error(e.toString()));
    }
  }

  Future<void> _onUpdateProfileRequested(
    UpdateProfileRequested event,
    Emitter<AuthState> emit,
  ) async {
    if (state.user == null) return;

    emit(AuthState.loading);
    try {
      // TODO: Implement actual profile update logic
      final updatedUser = User(
        id: state.user!.id,
        name: event.name ?? state.user!.name,
        email: state.user!.email,
        photoUrl: event.photoUrl ?? state.user!.photoUrl,
      );
      emit(AuthState.authenticated(updatedUser));
    } catch (e) {
      emit(AuthState.error(e.toString()));
    }
  }

  Future<void> _onAuthStatusChanged(
    AuthStatusChanged event,
    Emitter<AuthState> emit,
  ) async {
    // TODO: Implement auth status change handling
    // This will be used when we implement real authentication
    add(const CheckAuthStatus());
  }
}
