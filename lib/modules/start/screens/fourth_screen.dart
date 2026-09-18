import 'package:evently_c19/core/utils/app_assets.dart';
import 'package:evently_c19/modules/auth/screens/login_screen.dart';
import 'package:evently_c19/modules/start/widgets/on_boarding_widget.dart';
import 'package:flutter/material.dart';

class FourthScreen extends StatelessWidget {
  const FourthScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return OnboardingWidget(
      image: AppAssets.fourthImage,
      title: 'Connect with Friends & Share Moments',
      description:
          'Make every event memorable by sharing the experience with others. Our platform lets you invite friends, keep everyone in the loop, and celebrate moments together. Capture and share the excitement with your network, so you can relive the highlights and cherish the memories.',
      currentPage: 2,
      buttonText: 'Get started',

      onButtonPressed: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const LoginScreen()),
        );
      },

      onBackPressed: () {
        Navigator.pop(context);
      },
    );
  }
}
