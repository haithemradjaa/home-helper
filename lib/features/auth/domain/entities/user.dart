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
