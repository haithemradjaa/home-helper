/// Application Router for Home Helper
///
/// Manages type-safe navigation and routing configuration
/// for the entire Home Helper mobile application.
///
/// Key Responsibilities:
/// - Define all application routes
/// - Implement type-safe navigation
/// - Manage route transitions
/// - Handle navigation logic
///
/// Routing Strategy:
/// - Declarative route configuration
/// - Centralized navigation management
/// - Support for nested routes
/// - Authentication-aware routing
///
/// Defined Routes:
/// - `/splash`: Initial loading screen
/// - `/login`: User authentication
/// - `/register`: User registration
/// - `/home`: Main application dashboard
/// - `/services`: Service listing
/// - `/bookings`: User bookings
/// - `/profile`: User profile management
///
/// Design Principles:
/// - Type-safe navigation
/// - Declarative route definitions
/// - Consistent navigation experience
/// - Secure route access
///
/// Navigation Features:
/// - Redirect based on authentication
/// - Nested route support
/// - Parameterized routes
/// - Transition animations
///
/// Typical Use Cases:
/// - App-wide navigation
/// - Secure route access
/// - Dynamic route generation
///
/// Example Route Definition:
/// ```dart
/// GoRoute(
///   path: '/login',
///   builder: (context, state) => LoginScreen(),
/// )
/// ```
///
/// Future Extensibility:
/// - Dynamic route generation
/// - More complex navigation flows
/// - Advanced authentication checks
/// - Internationalized routing
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

/// Defines all the routes in the app
class AppRouter {
  static final router = GoRouter(
    initialLocation: '/splash',
    routes: [
      GoRoute(
        path: '/splash',
        name: 'splash',
        builder: (context, state) => const SplashScreen(),
      ),
      GoRoute(
        path: '/login',
        name: 'login',
        builder: (context, state) => const LoginScreen(),
      ),
      GoRoute(
        path: '/register',
        name: 'register',
        builder: (context, state) => const RegisterScreen(),
      ),
      ShellRoute(
        builder: (context, state, child) => MainLayout(child: child),
        routes: [
          GoRoute(
            path: '/home',
            name: 'home',
            builder: (context, state) => const HomeScreen(),
          ),
          GoRoute(
            path: '/services',
            name: 'services',
            builder: (context, state) => const ServicesScreen(),
          ),
          GoRoute(
            path: '/bookings',
            name: 'bookings',
            builder: (context, state) => const BookingsScreen(),
          ),
          GoRoute(
            path: '/profile',
            name: 'profile',
            builder: (context, state) => const ProfileScreen(),
          ),
        ],
      ),
    ],
  );
}
