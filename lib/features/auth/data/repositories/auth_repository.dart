import 'package:home_helper/features/auth/domain/entities/user.dart';

/// Repository interface for authentication operations
abstract class AuthRepository {
  /// Get the current authenticated user
  Future<User?> getCurrentUser();

  /// Sign in with email and password
  Future<User> signInWithEmailAndPassword(String email, String password);

  /// Register with email and password
  Future<User> registerWithEmailAndPassword(
    String name,
    String email,
    String password,
  );

  /// Sign out the current user
  Future<void> signOut();

  /// Update user profile
  Future<User> updateProfile({String? name, String? photoUrl});

  /// Check if a user is currently signed in
  Future<bool> isSignedIn();
}

/// Implementation of the authentication repository
class AuthRepositoryImpl implements AuthRepository {
  @override
  Future<User?> getCurrentUser() async {
    // TODO: Implement with actual backend
    return null;
  }

  @override
  Future<bool> isSignedIn() async {
    // TODO: Implement with actual backend
    return false;
  }

  @override
  Future<User> registerWithEmailAndPassword(
    String name,
    String email,
    String password,
  ) async {
    // TODO: Implement with actual backend
    return User(
      id: 'mock_id',
      name: name,
      email: email,
    );
  }

  @override
  Future<User> signInWithEmailAndPassword(String email, String password) async {
    // TODO: Implement with actual backend
    return User(
      id: 'mock_id',
      name: 'John Doe',
      email: email,
    );
  }

  @override
  Future<void> signOut() async {
    // TODO: Implement with actual backend
  }

  @override
  Future<User> updateProfile({String? name, String? photoUrl}) async {
    // TODO: Implement with actual backend
    throw UnimplementedError();
  }
}
