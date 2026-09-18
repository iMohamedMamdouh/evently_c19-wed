import 'package:flutter/material.dart';

class ProfileItem extends StatelessWidget {
  String text;
  Widget trailing;
  void Function()? onTap;

  ProfileItem({
    super.key,
    required this.text,
    required this.trailing,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(16),
      child: Container(
        height: 60,
        padding: EdgeInsets.symmetric(horizontal: 16),
        decoration: BoxDecoration(
          color: theme.cardColor,
          borderRadius: BorderRadius.circular(16),
        ),
        child: Row(
          children: [
            Expanded(
              child: Text(
                text,
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w500,
                  color: theme.primaryColorLight,
                ),
              ),
            ),
            trailing,
          ],
        ),
      ),
    );
  }
}
