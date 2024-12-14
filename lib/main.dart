/// Home Helper Mobile Application - Entry Point
///
/// This is the main entry point for the Home Helper mobile application,
/// responsible for initializing the app, setting up global configurations,
/// and launching the root widget.
///
/// Key Responsibilities:
/// - Initialize Flutter bindings
/// - Configure system UI overlay styles
/// - Set device orientation preferences
/// - Create the root application widget
///
/// App Initialization Steps:
/// 1. Ensure Flutter bindings are initialized
/// 2. Lock device orientation to portrait mode
/// 3. Configure system UI appearance
/// 4. Create and run the root application widget
///
/// Design Principles:
/// - Responsive UI configuration
/// - Consistent system UI appearance
/// - Performance optimization
/// - Platform-specific customization
///
/// Global App Configuration:
/// - Portrait-only orientation
/// - Transparent status bar
/// - Light system navigation bar
///
/// Typical Use Cases:
/// - App startup
/// - Initial configuration
/// - Theme and routing setup
///
/// Example Configurations:
/// ```dart
/// SystemChrome.setPreferredOrientations([
///   DeviceOrientation.portraitUp,
///   DeviceOrientation.portraitDown
/// ]);
/// ```
///
/// Future Extensibility:
/// - Add more global app configurations
/// - Support for dark/light mode switching
/// - Internationalization setup
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:home_helper/core/router/app_router.dart';
import 'package:home_helper/core/theme/app_theme.dart';
import 'package:home_helper/features/auth/data/repositories/auth_repository.dart';
import 'package:home_helper/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:home_helper/features/auth/presentation/bloc/auth_event.dart';

/// The entry point of the Home Helper application.
/// This is where we initialize essential app configurations
/// and launch the root widget.
void main() {
  // Ensure Flutter bindings are initialized before calling native code
  WidgetsFlutterBinding.ensureInitialized();
  
  // Configure the app to only support portrait mode
  // This is common for most mobile apps to ensure consistent UX
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);

  // Customize the system UI overlay style
  // This affects the status bar and navigation bar appearance
  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      // Make status bar transparent and icons dark
      statusBarColor: Colors.transparent,
      statusBarIconBrightness: Brightness.dark,
      
      // Set navigation bar to white with dark icons
      systemNavigationBarColor: Colors.white,
      systemNavigationBarIconBrightness: Brightness.dark,
    ),
  );

  // Launch the app with error handling
  runApp(const HomeHelperApp());
}

/// The root widget of our application.
/// This widget sets up the global configurations and theme
/// for the entire app.
class HomeHelperApp extends StatelessWidget {
  const HomeHelperApp({super.key});

  @override
  Widget build(BuildContext context) {
    return RepositoryProvider(
      create: (context) => AuthRepositoryImpl(),
      child: BlocProvider(
        create: (context) => AuthBloc()..add(const CheckAuthStatus()),
        child: MaterialApp.router(
          // App title shown in recent apps on Android
          title: 'Home Helper',
          
          // Remove the debug banner in development mode
          debugShowCheckedModeBanner: false,
          
          // Configure the global app theme
          theme: AppTheme.lightTheme,
          
          // Configure the app router
          routerConfig: AppRouter.router,
        ),
      ),
    );
  }
}
