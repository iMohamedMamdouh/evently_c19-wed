import 'package:evently_c19/core/utils/app_assets.dart';
import 'package:evently_c19/modules/auth/screens/login_screen.dart';
import 'package:evently_c19/modules/start/screens/fourth_screen.dart';
import 'package:evently_c19/modules/start/widgets/on_boarding_widget.dart';
import 'package:flutter/material.dart';

class ThirdScreen extends StatelessWidget {
  const ThirdScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return OnboardingWidget(
      image: AppAssets.thirdImage,
      title: 'Effortless Event Planning',
      description:
          'Take the hassle out of organizing events with our all-in-one planning tools. From setting up invites and managing RSVPs to scheduling reminders and coordinating details, we’ve got you covered. Plan with ease and focus on what matters – creating an unforgettable experience for you and your guests.',
      currentPage: 1,
      buttonText: 'Next',

      onButtonPressed: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const FourthScreen()),
        );
      },

      onBackPressed: () {
        Navigator.pop(context);
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
