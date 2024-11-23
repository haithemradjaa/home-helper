import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

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
    return MaterialApp(
      // App title shown in recent apps on Android
      title: 'Home Helper',
      
      // Remove the debug banner in development mode
      debugShowCheckedModeBanner: false,
      
      // Configure the global app theme
      theme: ThemeData(
        // Use Material 3 design system
        useMaterial3: true,
        
        // Generate color scheme from a seed color
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFF4CAF50), // Primary green color
          brightness: Brightness.light,
        ),
        
        // Use Poppins as our default font
        fontFamily: 'Poppins',
        
        // Configure global text theme
        textTheme: const TextTheme(
          displayLarge: TextStyle(
            fontSize: 32,
            fontWeight: FontWeight.bold,
            letterSpacing: -1.0,
          ),
          bodyLarge: TextStyle(
            fontSize: 16,
            letterSpacing: 0.5,
          ),
        ),
        
        // Configure global button theme
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            minimumSize: const Size(double.infinity, 48),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
          ),
        ),
      ),
      
      // Temporary home widget - will be replaced with proper navigation
      home: const Scaffold(
        body: Center(
          child: Text(
            'Welcome to Home Helper',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}
