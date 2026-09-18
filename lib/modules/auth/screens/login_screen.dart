import 'package:evently_c19/core/services/auth_service.dart';
import 'package:evently_c19/core/theme/app_colors.dart';
import 'package:evently_c19/core/utils/app_assets.dart';
import 'package:evently_c19/core/widgets/custom_btn.dart';
import 'package:evently_c19/core/widgets/custom_text_field.dart';
import 'package:evently_c19/core/widgets/google_btn.dart';
import 'package:evently_c19/modules/auth/screens/forget_password_screen.dart';
import 'package:evently_c19/modules/auth/screens/register_screen.dart';
import 'package:evently_c19/modules/home/screens/home_screen.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  bool isObscure = true;
  bool isLoading = false;
  bool isGoogleLoading = false;

  void goToHome() {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => const HomeScreen()),
    );
  }

  void showMessage(String message) {
    ScaffoldMessenger.of(
      context,
    ).showSnackBar(SnackBar(content: Text(message)));
  }

  void login() async {
    setState(() {
      isLoading = true;
    });
    try {
      await AuthService.login(
        emailController.text.trim(),
        passwordController.text,
      );
      if (!mounted) return;
      goToHome();
    } catch (e) {
      if (!mounted) return;
      setState(() {
        isLoading = false;
      });
      showMessage(e.toString());
    }
  }

  void loginWithGoogle() async {
    setState(() {
      isGoogleLoading = true;
    });
    try {
      await AuthService.loginWithGoogle();
      if (!mounted) return;
      goToHome();
    } catch (e) {
      if (!mounted) return;
      setState(() {
        isGoogleLoading = false;
      });
      showMessage(e.toString());
    }
  }

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Hero(
                  tag: "logo",
                  child: Image.asset(AppAssets.appLogo, width: 140),
                ),
              ),
              SizedBox(height: 48),
              Text(
                "Login to your account",
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.w600,
                  color: theme.primaryColor,
                ),
              ),
              SizedBox(height: 24),
              CustomTextField(
                hint: "Enter your email",
                icon: Icons.email_outlined,
                controller: emailController,
              ),
              SizedBox(height: 16),
              CustomTextField(
                hint: "Enter your password",
                icon: Icons.lock_outline,
                controller: passwordController,
                isPassword: true,
              ),
              SizedBox(height: 8),
              Align(
                alignment: AlignmentDirectional.centerEnd,
                child: InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const ForgetPasswordScreen(),
                      ),
                    );
                  },
                  child: Text(
                    "Forget Password?",
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      color: theme.primaryColor,
                      decoration: TextDecoration.underline,
                      decorationColor: theme.primaryColor,
                    ),
                  ),
                ),
              ),
              SizedBox(height: 48),
              Center(
                child: CustomBtn(
                  text: "Login",
                  isLoading: isLoading,
                  onTap: login,
                ),
              ),
              SizedBox(height: 48),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Don’t have an account ? ",
                    style: TextStyle(
                      fontSize: 16,
                      color: AppColors.grayColor,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const RegisterScreen(),
                        ),
                      );
                    },
                    child: Text(
                      "Signup",
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        color: theme.primaryColor,
                        decoration: TextDecoration.underline,
                        decorationColor: theme.primaryColor,
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 32),
              Row(
                children: [
                  Expanded(child: Divider(color: AppColors.grayColor)),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8),
                    child: Text(
                      "Or",
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        color: theme.primaryColorLight,
                      ),
                    ),
                  ),
                  Expanded(child: Divider(color: AppColors.grayColor)),
                ],
              ),
              SizedBox(height: 24),
              Center(
                child: GoogleBtn(
                  text: "Login with Google",
                  isLoading: isGoogleLoading,
                  onTap: loginWithGoogle,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
