import 'package:evently_c19/core/utils/app_assets.dart';
import 'package:evently_c19/core/widgets/custom_btn.dart';
import 'package:evently_c19/core/widgets/custom_text_field.dart';
import 'package:flutter/material.dart';

class ForgetPasswordScreen extends StatelessWidget {
  const ForgetPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: theme.scaffoldBackgroundColor,
        elevation: 0,
        centerTitle: true,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(
            Icons.arrow_back_ios_new,
            color: theme.primaryColor,
            size: 18,
          ),
        ),
        title: Text("Forget Password", style: theme.textTheme.titleMedium),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              SizedBox(height: 24),
              Image.asset(
                AppAssets.forgetPasswordImage,
                width: 340,
                color: theme.primaryColorLight,
              ),
              SizedBox(height: 24),
              CustomTextField(
                hint: "Enter your email",
                icon: Icons.email_outlined,
              ),
              SizedBox(height: 24),
              CustomBtn(text: "Reset password", onTap: () {}),
            ],
          ),
        ),
      ),
    );
  }
}
