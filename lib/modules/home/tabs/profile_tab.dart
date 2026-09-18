import 'package:evently_c19/core/app_provider/app_provider.dart';
import 'package:evently_c19/core/services/auth_service.dart';
import 'package:evently_c19/core/theme/app_colors.dart';
import 'package:evently_c19/core/utils/app_assets.dart';
import 'package:evently_c19/modules/auth/screens/login_screen.dart';
import 'package:evently_c19/modules/home/widgets/profile_item.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ProfileTab extends StatelessWidget {
  const ProfileTab({super.key});

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    var provider = Provider.of<AppProvider>(context);
    var user = FirebaseAuth.instance.currentUser;
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            SizedBox(height: 16),
            CircleAvatar(
              radius: 60,
              backgroundColor: theme.primaryColor,
              backgroundImage: user?.photoURL == null
                  ? null
                  : NetworkImage(user!.photoURL!),
              child: user?.photoURL == null
                  ? Image.asset(AppAssets.route, width: 80)
                  : null,
            ),
            SizedBox(height: 16),
            Text(
              user?.displayName ?? "User",
              style: theme.textTheme.titleMedium,
            ),
            SizedBox(height: 8),
            Text(
              user?.email ?? "",
              style: TextStyle(
                fontSize: 16,
                color: AppColors.grayColor,
                fontWeight: FontWeight.w400,
              ),
            ),
            SizedBox(height: 24),
            ProfileItem(
              text: "Dark mode",
              trailing: Switch(
                value: provider.themeMode == ThemeMode.dark,
                activeTrackColor: theme.primaryColor,
                onChanged: (value) {
                  provider.changeTheme(
                    value ? ThemeMode.dark : ThemeMode.light,
                  );
                },
              ),
            ),
            SizedBox(height: 16),
            ProfileItem(
              text: "Language",
              trailing: Icon(
                Icons.arrow_forward_ios,
                color: theme.primaryColor,
                size: 20,
              ),
            ),
            SizedBox(height: 16),
            ProfileItem(
              text: "Logout",
              trailing: Icon(Icons.logout, color: AppColors.redColor, size: 24),
              onTap: () async {
                await AuthService.logout();
                if (!context.mounted) return;
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => const LoginScreen()),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
