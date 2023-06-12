import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'const/app_colors.dart';
import 'screens/home_screen.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Poke App',
      theme: ThemeData(
        colorScheme:
            ColorScheme.fromSeed(seedColor: AppColors.identityColor.primary),
        useMaterial3: true,
      ),
      home: HomeScreen(),
    );
  }
}
