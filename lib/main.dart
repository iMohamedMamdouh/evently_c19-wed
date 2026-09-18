import 'package:evently_c19/core/app_provider/app_provider.dart';
import 'package:evently_c19/core/theme/app_theme.dart';
import 'package:evently_c19/firebase_options.dart';
import 'package:evently_c19/modules/splash/splash_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  await GoogleSignIn.instance.initialize();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => AppProvider(),
      builder: (context, child) {
        var provider = Provider.of<AppProvider>(context);
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          themeMode: provider.themeMode,
          theme: AppTheme.light,
          darkTheme: AppTheme.dark,
          title: 'Flutter Demo',
          home: SplashScreen(),
        );
      },
    );
  }
}
