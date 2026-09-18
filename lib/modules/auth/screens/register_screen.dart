import 'package:evently_c19/core/services/auth_service.dart';
import 'package:evently_c19/core/theme/app_colors.dart';
import 'package:evently_c19/core/utils/app_assets.dart';
import 'package:evently_c19/core/widgets/custom_btn.dart';
import 'package:evently_c19/core/widgets/custom_text_field.dart';
import 'package:evently_c19/core/widgets/google_btn.dart';
import 'package:evently_c19/modules/home/screens/home_screen.dart';
import 'package:flutter/material.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();
  bool isObscure = true;
  bool isConfirmObscure = true;
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

  void register() async {
    if (passwordController.text != confirmPasswordController.text) {
      showMessage("Password does not match");
      return;
    }
    setState(() {
      isLoading = true;
    });
    try {
      await AuthService.register(
        nameController.text.trim(),
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

  void signUpWithGoogle() async {
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
              SizedBox(height: 24),
              Text("Create your account", style: theme.textTheme.titleMedium),
              SizedBox(height: 16),
              CustomTextField(
                hint: "Enter your name",
                icon: Icons.person_outline,
                controller: nameController,
              ),
              SizedBox(height: 16),
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
                // isObscure: isObscure,
                // onEyeTap: () {
                //   setState(() {
                //     isObscure = !isObscure;
                //   });
                // },
              ),
              SizedBox(height: 16),
              CustomTextField(
                hint: "Confirm your password",
                icon: Icons.lock_outline,
                controller: confirmPasswordController,
                isPassword: true,
                // isObscure: isConfirmObscure,
                // onEyeTap: () {
                //   setState(() {
                //     isConfirmObscure = !isConfirmObscure;
                //   });
                // },
              ),
              SizedBox(height: 24),
              Center(
                child: CustomBtn(
                  text: "Sign up",
                  isLoading: isLoading,
                  onTap: register,
                ),
              ),
              SizedBox(height: 16),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Already have an account? ",
                    style: TextStyle(
                      fontSize: 16,
                      color: AppColors.grayColor,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Text(
                      "Login",
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
              SizedBox(height: 16),
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
              SizedBox(height: 16),
              Center(
                child: GoogleBtn(
                  text: "Sign up with Google",
                  isLoading: isGoogleLoading,
                  onTap: signUpWithGoogle,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
