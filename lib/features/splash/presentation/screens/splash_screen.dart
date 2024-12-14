/// Splash Screen for Home Helper Application
///
/// Provides the initial loading screen that appears when the app is launched,
/// handling app initialization, asset preloading, and first-time setup.
///
/// Key Responsibilities:
/// - Display app launch animation
/// - Perform initial app configurations
/// - Check authentication status
/// - Prepare app for first interaction
///
/// Initialization Workflow:
/// 1. Show branded splash animation
/// 2. Perform background initializations
/// 3. Check user authentication
/// 4. Navigate to appropriate screen
///
/// Design Principles:
/// - Smooth, engaging launch experience
/// - Minimal loading time
/// - Consistent branding
/// - Performance optimization
///
/// Screen Components:
/// - Animated logo or brand element
/// - Optional loading indicator
/// - Background initialization logic
///
/// Performance Considerations:
/// - Lightweight initialization
/// - Asynchronous operations
/// - Minimal blocking
///
/// Typical Use Cases:
/// - App cold start
/// - First-time app launch
/// - Checking initial app state
///
/// Authentication Flow:
/// - Check if user is already logged in
/// - Determine initial navigation route
/// - Handle first-time user experience
///
/// Example Initialization:
/// ```dart
/// // Typical splash screen logic
/// Future<void> _initializeApp() async {
///   await Future.wait([
///     _preloadResources(),
///     _checkAuthStatus(),
///   ]);
/// }
/// ```
///
/// Future Extensibility:
/// - Advanced caching mechanisms
/// - More complex initialization flows
/// - Internationalization support
/// - Detailed loading progress
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

/// The splash screen that appears when the app is first launched.
/// Handles initialization tasks and provides a smooth entry experience.
class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _fadeAnimation;
  late Animation<double> _scaleAnimation;

  @override
  void initState() {
    super.initState();
    _setupAnimations();
    _handleInitialization();
  }

  void _setupAnimations() {
    _controller = AnimationController(
      duration: const Duration(milliseconds: 1500),
      vsync: this,
    );

    _fadeAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(
        parent: _controller,
        curve: const Interval(0.0, 0.5, curve: Curves.easeIn),
      ),
    );

    _scaleAnimation = Tween<double>(begin: 0.8, end: 1.0).animate(
      CurvedAnimation(
        parent: _controller,
        curve: const Interval(0.0, 0.5, curve: Curves.easeOutBack),
      ),
    );

    _controller.forward();
  }

  Future<void> _handleInitialization() async {
    // Simulate initialization tasks
    await Future.delayed(const Duration(seconds: 2));
    
    // Check if widget is still mounted before navigating
    if (!mounted) return;
    
    // TODO: Check authentication status and navigate accordingly
    context.goNamed('login');
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              theme.colorScheme.primary,
              theme.colorScheme.primaryContainer,
            ],
          ),
        ),
        child: SafeArea(
          child: Center(
            child: AnimatedBuilder(
              animation: _controller,
              builder: (context, child) {
                return FadeTransition(
                  opacity: _fadeAnimation,
                  child: ScaleTransition(
                    scale: _scaleAnimation,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        // App Logo
                        Container(
                          width: 120,
                          height: 120,
                          decoration: BoxDecoration(
                            color: theme.colorScheme.onPrimary,
                            borderRadius: BorderRadius.circular(30),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withOpacity(0.1),
                                blurRadius: 20,
                                offset: const Offset(0, 10),
                              ),
                            ],
                          ),
                          child: Icon(
                            Icons.home_rounded,
                            size: 60,
                            color: theme.colorScheme.primary,
                          ),
                        ),
                        const SizedBox(height: 24),
                        // App Name
                        Text(
                          'Home Helper',
                          style: theme.textTheme.headlineMedium?.copyWith(
                            color: theme.colorScheme.onPrimary,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 8),
                        // App Tagline
                        Text(
                          'Your Home Services Solution',
                          style: theme.textTheme.bodyLarge?.copyWith(
                            color: theme.colorScheme.onPrimary.withOpacity(0.8),
                          ),
                        ),
                        const SizedBox(height: 48),
                        // Loading Indicator
                        SizedBox(
                          width: 24,
                          height: 24,
                          child: CircularProgressIndicator(
                            strokeWidth: 2,
                            valueColor: AlwaysStoppedAnimation<Color>(
                              theme.colorScheme.onPrimary,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
