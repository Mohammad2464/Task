import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:test_task/resources/theme.dart';
import 'package:test_task/view/splash_screen.dart';
import 'resources/utils.dart';

void main() {
  Utils.configLoading();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Test Task',
      builder: EasyLoading.init(),
      debugShowCheckedModeBanner: false,
      theme: theme(context),
      home: SplashScreen(),
    );
  }
}
