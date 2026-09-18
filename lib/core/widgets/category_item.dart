import 'package:evently_c19/core/theme/app_colors.dart';
import 'package:flutter/material.dart';

class CategoryItem extends StatelessWidget {
  String text;
  IconData icon;
  bool isSelected;
  void Function()? onTap;

  CategoryItem({
    super.key,
    required this.text,
    required this.icon,
    required this.isSelected,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(24),
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        decoration: BoxDecoration(
          color: isSelected ? theme.primaryColor : theme.cardColor,
          border: Border.all(color: AppColors.grayColor, width: 0.5),
          borderRadius: BorderRadius.circular(24),
        ),
        child: Row(
          children: [
            Icon(
              icon,
              size: 22,
              color: isSelected ? Colors.white : theme.primaryColor,
            ),
            SizedBox(width: 8),
            Text(
              text,
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w500,
                color: isSelected ? Colors.white : theme.primaryColorLight,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
