import 'package:evently_c19/core/utils/app_assets.dart';
import 'package:evently_c19/modules/auth/screens/login_screen.dart';
import 'package:evently_c19/modules/start/screens/third_screen.dart';
import 'package:evently_c19/modules/start/widgets/on_boarding_widget.dart';
import 'package:flutter/material.dart';

class SecondScreen extends StatelessWidget {
  const SecondScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return OnboardingWidget(
      image: AppAssets.secondImage,
      title: 'Find Events That Inspire You',
      description:
          'Dive into a world of events crafted to fit your unique interests. Whether you’re into live music, art workshops, professional networking, or simply discovering new experiences, we have something for everyone. Our curated recommendations will help you explore, connect, and make the most of every opportunity around you.',
      currentPage: 0,
      buttonText: 'Next',

      onButtonPressed: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const ThirdScreen()),
        );
      },

      onSkipPressed: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const LoginScreen()),
        );
      },
    );
  }
}
