import 'package:evently_c19/core/theme/app_colors.dart';
import 'package:evently_c19/core/utils/app_assets.dart';
import 'package:evently_c19/core/widgets/custom_btn.dart';
import 'package:flutter/material.dart';

class OnboardingWidget extends StatelessWidget {
  final String image;
  final String title;
  final String description;
  final int currentPage;
  final String buttonText;
  final VoidCallback onButtonPressed;
  final VoidCallback? onBackPressed;
  final VoidCallback? onSkipPressed;

  const OnboardingWidget({
    super.key,
    required this.image,
    required this.title,
    required this.description,
    required this.currentPage,
    required this.buttonText,
    required this.onButtonPressed,
    this.onBackPressed,
    this.onSkipPressed,
  });

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 14),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  if (onBackPressed != null)
                    IconButton(
                      onPressed: onBackPressed,
                      style: IconButton.styleFrom(
                        backgroundColor: theme.scaffoldBackgroundColor,
                      ),
                      icon: Icon(
                        Icons.arrow_back_ios_new,
                        color: theme.primaryColor,
                        size: 18,
                      ),
                    )
                  else
                    const SizedBox(width: 48),

                  Hero(
                    tag: "logo",
                    child: Image.asset(
                      AppAssets.appLogo,
                      width: 140,
                    ),
                  ),

                  if (onSkipPressed != null)
                    TextButton(
                      onPressed: onSkipPressed,
                      style: TextButton.styleFrom(
                        backgroundColor: theme.scaffoldBackgroundColor,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                      child: Text(
                        "Skip",
                        style: TextStyle(
                          color: theme.primaryColor,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    )
                  else
                    const SizedBox(width: 48),
                ],
              ),

              SizedBox(height: 20),

              Expanded(
                child: Image.asset(
                  image,
                  fit: BoxFit.contain,
                  color: theme.primaryColorLight,
                ),
              ),

              SizedBox(height: 16),

              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: List.generate(
                  3,
                  (index) => AnimatedContainer(
                    duration: Duration(milliseconds: 300),
                    margin: const EdgeInsets.symmetric(horizontal: 3),
                    width: index == currentPage ? 20 : 6,
                    height: 6,
                    decoration: BoxDecoration(
                      color: index == currentPage
                          ? theme.primaryColor
                          : AppColors.grayColor,
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ),
              ),

              SizedBox(height: 16),

              Align(
                alignment: AlignmentDirectional.centerStart,
                child: Text(title, style: theme.textTheme.titleMedium),
              ),

              SizedBox(height: 8),

              Text(
                description,
                style: TextStyle(
                  fontSize: 16,
                  height: 1.4,
                  color: AppColors.grayColor,
                  fontWeight: FontWeight.w400,
                ),
              ),

              SizedBox(height: 16),

              Center(
                child: CustomBtn(text: buttonText, onTap: onButtonPressed),
              ),

              SizedBox(height: 14),
            ],
          ),
        ),
      ),
    );
  }
}
