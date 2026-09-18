import 'package:animate_do/animate_do.dart';
import 'package:evently_c19/core/utils/app_assets.dart';
import 'package:evently_c19/modules/start/screens/start_screen.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              child: ZoomIn(
                duration: Duration(
                  seconds: 2
                ),
                child: Center(
                  child: Hero(
                      tag: "logo",
                      child: Image.asset(AppAssets.appLogo, width: 309)),
                ),
              ),
            ),

            FadeInUp(
              onFinish: (direction) {
                Future.delayed(Duration(seconds: 1),() {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return StartScreen();
                  },));
                },);
              },
                delay: Duration(seconds: 2),
                child: Image.asset(AppAssets.routeLogo, width: 214)),
          ],
        ),
      ),
    );
  }
}
