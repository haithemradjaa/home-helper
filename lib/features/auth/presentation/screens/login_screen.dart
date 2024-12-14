/// Login Screen for Home Helper Application
///
/// This screen provides a comprehensive user authentication interface, 
/// implementing secure and user-friendly login functionality.
///
/// Key Responsibilities:
/// - Capture user login credentials
/// - Validate input fields
/// - Handle authentication process
/// - Provide user feedback during login
///
/// Screen Features:
/// - Email and password input fields
/// - Form validation
/// - Password visibility toggle
/// - Loading state management
/// - Error handling
///
/// Design Principles:
/// - Responsive UI design
/// - Material Design 3 compliant
/// - Adaptive theming
/// - Secure input handling
///
/// User Experience Considerations:
/// - Clear error messaging
/// - Intuitive layout
/// - Immediate visual feedback
/// - Prevent multiple submission attempts
///
/// Authentication Flow:
/// 1. User enters credentials
/// 2. Validate input
/// 3. Attempt authentication
/// 4. Navigate or show error
///
/// Typical Use Cases:
/// - User sign-in
/// - Password recovery initiation
/// - First-time app access
///
/// Example Interaction:
/// ```
/// - Enter email: user@example.com
/// - Enter password: ********
/// - Tap login button
/// - Authenticate and navigate to home screen
/// ```
///
/// Future Extensibility:
/// - Social media login integration
/// - Biometric authentication
/// - Advanced password recovery
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:home_helper/shared/widgets/custom_button.dart';
import 'package:home_helper/shared/widgets/custom_text_field.dart';

/// Login screen that handles user authentication.
class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  bool _isLoading = false;
  bool _obscurePassword = true;

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  Future<void> _handleLogin() async {
    if (!_formKey.currentState!.validate()) return;

    setState(() => _isLoading = true);

    try {
      // Simulate login delay
      await Future.delayed(const Duration(seconds: 1));
      
      if (!mounted) return;
      
      // TODO: Implement actual login logic
      context.goNamed('home');
    } catch (e) {
      if (!mounted) return;
      
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(e.toString()),
          backgroundColor: Theme.of(context).colorScheme.error,
        ),
      );
    } finally {
      if (mounted) {
        setState(() => _isLoading = false);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(24),
            child: Form(
              key: _formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  // App Logo
                  Icon(
                    Icons.home_rounded,
                    size: 64,
                    color: theme.colorScheme.primary,
                  ),
                  const SizedBox(height: 24),
                  
                  // Welcome Text
                  Text(
                    'Welcome Back!',
                    style: theme.textTheme.headlineMedium?.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 8),
                  Text(
                    'Sign in to continue',
                    style: theme.textTheme.bodyLarge?.copyWith(
                      color: theme.colorScheme.onSurfaceVariant,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 32),

                  // Email Field
                  CustomTextField(
                    controller: _emailController,
                    label: 'Email',
                    hint: 'Enter your email',
                    prefixIcon: Icons.email_outlined,
                    keyboardType: TextInputType.emailAddress,
                    textInputAction: TextInputAction.next,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter your email';
                      }
                      if (!RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$')
                          .hasMatch(value)) {
                        return 'Please enter a valid email';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 16),

                  // Password Field
                  CustomTextField(
                    controller: _passwordController,
                    label: 'Password',
                    hint: 'Enter your password',
                    prefixIcon: Icons.lock_outline,
                    obscureText: _obscurePassword,
                    textInputAction: TextInputAction.done,
                    suffixIcon: IconButton(
                      icon: Icon(
                        _obscurePassword
                            ? Icons.visibility_outlined
                            : Icons.visibility_off_outlined,
                      ),
                      onPressed: () {
                        setState(() {
                          _obscurePassword = !_obscurePassword;
                        });
                      },
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter your password';
                      }
                      if (value.length < 6) {
                        return 'Password must be at least 6 characters';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 8),

                  // Forgot Password Button
                  Align(
                    alignment: Alignment.centerRight,
                    child: CustomButton(
                      label: 'Forgot Password?',
                      onPressed: () {
                        // TODO: Implement forgot password
                      },
                      type: CustomButtonType.text,
                    ),
                  ),
                  const SizedBox(height: 24),

                  // Login Button
                  CustomButton(
                    label: 'Sign In',
                    onPressed: _handleLogin,
                    isLoading: _isLoading,
                  ),
                  const SizedBox(height: 16),

                  // Register Button
                  CustomButton(
                    label: 'Create Account',
                    onPressed: () => context.goNamed('register'),
                    type: CustomButtonType.secondary,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
