import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:money_mate/core/mobile_design_system/shared/theme/app_theme.dart';
import 'package:money_mate/feature/auth/presenter/screen/sign_in_screen.dart';
import 'package:money_mate/feature/home/presenter/screen/home_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
        child: const MaterialApp(
          //theme: AppTheme.theme,
          title: 'cupertino APp',
          home: SignInScreen(),
        ));
  }
}
