/// Main Layout for Home Helper Application
///
/// Provides the primary structural layout for the app's main screens,
/// implementing a bottom navigation system and consistent screen organization.
///
/// Key Responsibilities:
/// - Manage primary app navigation
/// - Provide consistent screen layout
/// - Handle bottom navigation state
/// - Organize main app sections
///
/// Navigation Sections:
/// - Home
/// - Services
/// - Bookings
/// - Profile
///
/// Design Principles:
/// - Material Design 3 navigation
/// - Responsive layout
/// - Consistent user experience
/// - Efficient screen transitions
///
/// Layout Features:
/// - Bottom navigation bar
/// - Active section tracking
/// - Smooth screen switching
/// - Persistent navigation state
///
/// Performance Considerations:
/// - Minimal rebuilds
/// - Efficient state management
/// - Lazy loading of screens
///
/// Typical Use Cases:
/// - Main app screen organization
/// - User navigation between primary sections
/// - Maintaining app-wide navigation context
///
/// Navigation Workflow:
/// 1. User selects bottom navigation item
/// 2. Update active section
/// 3. Switch to corresponding screen
///
/// Example Navigation:
/// ```dart
/// BottomNavigationBar(
///   currentIndex: _selectedIndex,
///   onTap: _onItemTapped,
///   items: [
///     BottomNavigationBarItem(icon: Icon(Icons.home)),
///     // Other navigation items
///   ],
/// )
/// ```
///
/// Future Extensibility:
/// - Custom navigation animations
/// - More navigation sections
/// - Advanced navigation logic
/// - Adaptive layouts
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

/// Main layout widget that provides the bottom navigation bar and common layout
/// elements for the main app screens.
class MainLayout extends StatelessWidget {
  const MainLayout({
    super.key,
    required this.child,
  });

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: child,
      bottomNavigationBar: NavigationBar(
        onDestinationSelected: (index) {
          switch (index) {
            case 0:
              context.goNamed('home');
              break;
            case 1:
              context.goNamed('services');
              break;
            case 2:
              context.goNamed('bookings');
              break;
            case 3:
              context.goNamed('profile');
              break;
          }
        },
        selectedIndex: _calculateSelectedIndex(context),
        destinations: const [
          NavigationDestination(
            icon: Icon(Icons.home_outlined),
            selectedIcon: Icon(Icons.home),
            label: 'Home',
          ),
          NavigationDestination(
            icon: Icon(Icons.cleaning_services_outlined),
            selectedIcon: Icon(Icons.cleaning_services),
            label: 'Services',
          ),
          NavigationDestination(
            icon: Icon(Icons.calendar_month_outlined),
            selectedIcon: Icon(Icons.calendar_month),
            label: 'Bookings',
          ),
          NavigationDestination(
            icon: Icon(Icons.person_outline),
            selectedIcon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],
      ),
    );
  }

  int _calculateSelectedIndex(BuildContext context) {
    final String location = GoRouterState.of(context).location;
    if (location.startsWith('/home')) return 0;
    if (location.startsWith('/services')) return 1;
    if (location.startsWith('/bookings')) return 2;
    if (location.startsWith('/profile')) return 3;
    return 0;
  }
}
