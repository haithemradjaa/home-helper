import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:home_helper/core/router/app_router.dart';
import 'package:home_helper/core/theme/app_theme.dart';

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
    return MaterialApp.router(
      // App title shown in recent apps on Android
      title: 'Home Helper',
      
      // Remove the debug banner in development mode
      debugShowCheckedModeBanner: false,
      
      // Configure the global app theme
      theme: AppTheme.lightTheme,
      
      // Configure the app router
      routerConfig: AppRouter.router,
    );
  }
}
