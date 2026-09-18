import 'package:flutter/material.dart';

import '../theme/app_colors.dart';
import '../utils/app_assets.dart';

class GoogleBtn extends StatelessWidget {
  String text;
  void Function()? onTap;
  bool isLoading;

  GoogleBtn({
    super.key,
    required this.text,
    required this.onTap,
    this.isLoading = false,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: isLoading ? null : onTap,
      borderRadius: BorderRadius.circular(16),
      child: Container(
        width: 343,
        height: 56,
        padding: EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(color: AppColors.grayColor, width: 0.5),
          borderRadius: BorderRadius.circular(16),
        ),
        child: isLoading
            ? Center(
                child: SizedBox(
                  height: 24,
                  width: 24,
                  child: CircularProgressIndicator(
                    color: AppColors.lightPrimaryColor,
                    strokeWidth: 1,
                  ),
                ),
              )
            : Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(AppAssets.googleIcon, width: 24),
                  SizedBox(width: 8),
                  Text(
                    text,
                    style: TextStyle(
                      color: AppColors.lightPrimaryColor,
                      fontSize: 20,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
      ),
    );
  }
}
