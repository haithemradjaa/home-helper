/// User Entity for Home Helper Application
///
/// This class represents a user in the Home Helper ecosystem, serving as the core
/// domain model for user-related operations. It encapsulates essential user 
/// information and provides an immutable, type-safe representation of a user.
///
/// Key Responsibilities:
/// - Define the structure of user data
/// - Provide a consistent, immutable user representation
/// - Support value-based equality comparisons
/// - Enable easy serialization and deserialization
///
/// Design Principles:
/// - Immutability: Prevents unintended state modifications
/// - Type Safety: Ensures compile-time type checking
/// - Equatable: Allows easy comparison and use in collections
///
/// Typical Use Cases:
/// - Authentication and user management
/// - User profile display
/// - Storing user information across the application
///
/// Example:
/// ```dart
/// final user = User(
///   id: 'unique_id',
///   name: 'John Doe',
///   email: 'john@example.com',
///   photoUrl: 'https://example.com/profile.jpg'
/// );
/// ```
import 'package:equatable/equatable.dart';

/// User entity representing an authenticated user in the system
class User extends Equatable {
  const User({
    required this.id,
    required this.name,
    required this.email,
    this.photoUrl,
  });

  final String id;
  final String name;
  final String email;
  final String? photoUrl;

  @override
  List<Object?> get props => [id, name, email, photoUrl];
}
