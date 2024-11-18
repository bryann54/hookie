import 'package:flutter/material.dart';
import 'package:hookee/core/constants/animated_bg.dart';
import 'package:hookee/core/constants/colors.dart';
import 'package:hookee/core/constants/string.dart';

import 'package:hookee/features/authentication/presentation/widgets/email_input_row.dart';
import 'package:hookee/features/authentication/presentation/widgets/phone_input_row.dart';
import 'package:hookee/features/authentication/presentation/widgets/signup_button.dart';
import 'package:hookee/features/home/data/models/user_model.dart';
import 'package:hookee/features/home/presentation/widgets/bottom_nav.dart';

class SignupScreen extends StatefulWidget {
  final User user;
  const SignupScreen({super.key, required this.user});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  String? _activeInputField;
  bool _isLoading = false;
  String? _errorMessage;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 2000),
      vsync: this,
    )..repeat(reverse: true);
  }

  @override
  void dispose() {
    _controller.dispose();
    _emailController.dispose();
    _phoneController.dispose();
    super.dispose();
  }

  void _toggleInputField(String field) {
    setState(() {
      _activeInputField = (_activeInputField == field) ? null : field;
      _errorMessage = null;
    });
  }

  Future<void> _handleSignup() async {
    if (!_formKey.currentState!.validate()) {
      return;
    }

    setState(() {
      _isLoading = true;
      _errorMessage = null;
    });

    try {
      // final String identifier = _activeInputField == 'email'
      //     ? _emailController.text
      //     : _phoneController.text;

      // final userData = {
      //   'identifier': identifier,
      //   'signupMethod': _activeInputField,
      //   'timestamp': DateTime.now().toIso8601String(),
      // };

      // final UserModel user = await AuthService.signUp(userData);

      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Signup successful!'),
            backgroundColor: Colors.green,
          ),
        );

        await Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => BottomNav(user: widget.user,),
          ),
        );
      }
    } catch (e) {
      setState(() => _errorMessage = e.toString());

      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(_errorMessage ?? 'An error occurred'),
            backgroundColor: Colors.red,
          ),
        );
      }
    } finally {
      if (mounted) {
        setState(() => _isLoading = false);
      }
    }
  }

  Future<void> _handleSocialSignup(String provider) async {
    setState(() {
      _isLoading = true;
      _errorMessage = null;
    });

    try {
      // final UserModel user = await AuthService.socialSignIn(provider);

      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Successfully signed in with $provider'),
            backgroundColor: Colors.green,
          ),
        );

        await Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) =>  BottomNav(
              user: widget.user,
            ),
          ),
        );
      }
    } catch (e) {
      setState(() => _errorMessage = e.toString());

      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(_errorMessage ?? 'An error occurred'),
            backgroundColor: Colors.red,
          ),
        );
      }
    } finally {
      if (mounted) {
        setState(() => _isLoading = false);
      }
    }
  }

  Widget _buildInputOption({
    required String title,
    required String field,
    required bool isActive,
    bool isPrimary = true,
  }) {
    return GestureDetector(
      onTap: () => _toggleInputField(field),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        padding: const EdgeInsets.symmetric(horizontal: 15),
        height: 60,
        width: double.infinity,
        decoration: BoxDecoration(
          color: isActive
              ? (isPrimary ? Colors.pink.shade200 : Colors.white)
              : (isPrimary ? Colors.pink : Colors.pink.shade200),
          border: !isPrimary ? Border.all(color: Colors.pinkAccent) : null,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Center(
          child: Text(
            title,
            style: TextStyle(
              color: isActive && !isPrimary ? Colors.grey : Colors.white,
              fontSize: 17,
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildSocialButton({
    required String title,
    required Widget icon,
    required VoidCallback onTap,
    required bool isDarkMode,
  }) {
    return Expanded(
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          height: 56.0,
          decoration: BoxDecoration(
            border: Border.all(color: Colors.grey.shade300),
            borderRadius: BorderRadius.circular(12.0),
            color: Colors.white24,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              icon,
              const SizedBox(width: 10.0),
              Text(
                title,
                style: TextStyle(
                  fontSize: 16.0,
                  fontWeight: FontWeight.w500,
                  color:
                      isDarkMode ? AppColors.cardColor : Colors.grey.shade700,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildDivider() {
    return Expanded(
      child: Container(
        height: 1,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.grey.shade200, Colors.grey.shade400],
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDarkMode = theme.brightness == Brightness.dark;

    return Scaffold(
      body: Stack(
        children: [
          AnimatedBackground(controller: _controller),
          Center(
            child: SingleChildScrollView(
              child: SafeArea(
                child: Form(
                  key: _formKey,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const SizedBox(height: 40),
                        // Text(
                        //   hookie,
                        //   style: TextStyle(
                        //     fontFamily: 'Dancing Script',
                        //     fontSize: 27,
                        //     fontWeight: FontWeight.bold,
                        //     foreground: Paint()
                        //       ..style = PaintingStyle.fill
                        //       ..strokeWidth = 3
                        //       ..color = Colors.pink.shade200.withOpacity(0.9),
                        //   ),
                        // ),
                        const SizedBox(height: 50),
                        Text(
                          signup_text,
                          style: TextStyle(
                            fontFamily: 'Dancing Script',
                            fontSize: 30,
                            fontWeight: FontWeight.bold,
                            foreground: Paint()
                              ..style = PaintingStyle.fill
                              ..strokeWidth = 3
                              ..color =
                                  isDarkMode ? AppColors.cardColor : Colors.black,
                          ),
                        ),
                        const SizedBox(height: 20),
                        _buildInputOption(
                          title: email_option,
                          field: 'email',
                          isActive: _activeInputField == 'email',
                        ),
                        AnimatedSize(
                          duration: const Duration(milliseconds: 300),
                          child: _activeInputField == 'email'
                              ? EmailInputRow(controller: _emailController)
                              : const SizedBox.shrink(),
                        ),
                        const SizedBox(height: 15),
                        _buildInputOption(
                          title: phone_option,
                          field: 'phone',
                          isActive: _activeInputField == 'phone',
                          isPrimary: false,
                        ),
                        AnimatedSize(
                          duration: const Duration(milliseconds: 300),
                          child: _activeInputField == 'phone'
                              ? PhoneInputRow(controller: _phoneController)
                              : const SizedBox.shrink(),
                        ),
                        if (_errorMessage != null)
                          Padding(
                            padding: const EdgeInsets.only(top: 8.0),
                            child: Text(
                              _errorMessage!,
                              style: const TextStyle(
                                color: Colors.red,
                                fontSize: 14,
                              ),
                            ),
                          ),
                        const SizedBox(height: 40),
                        SignUpButton(
                          isDarkMode: isDarkMode,
                          isLoading: _isLoading,
                          onPressed:
                              _activeInputField != null ? _handleSignup : null,
                        ),
                        const SizedBox(height: 40),
                        Row(
                          children: [
                            _buildDivider(),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 12.0),
                              child: Text(
                                'Or Signup With',
                                style: TextStyle(
                                  fontSize: 15,
                                  color: Colors.grey.shade600,
                                  letterSpacing: 0.5,
                                ),
                              ),
                            ),
                            _buildDivider(),
                          ],
                        ),
                        const SizedBox(height: 20),
                        Row(
                          children: [
                            _buildSocialButton(
                              title: 'Google',
                              icon: SizedBox(
                                height: 40,
                                width: 40,
                                child: Image.asset('assets/google.webp'),
                              ),
                              onTap: () => _handleSocialSignup('google'),
                              isDarkMode: isDarkMode,
                            ),
                            const SizedBox(width: 16),
                            _buildSocialButton(
                              title: 'Facebook',
                              icon: Icon(
                                Icons.facebook_sharp,
                                size: 30,
                                color: Colors.blue.shade400,
                              ),
                              onTap: () => _handleSocialSignup('facebook'),
                              isDarkMode: isDarkMode,
                            ),
                          ],
                        ),
                        const SizedBox(height: 20),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
