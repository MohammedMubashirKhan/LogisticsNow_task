import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:logisticnow_task/app/routes/app_pages.dart';
import '../controllers/login_controller.dart';

class WelcomeScreen extends GetView<LoginController> {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            ElevatedButton(
              onPressed: () {
                Get.toNamed(Routes.LOGIN);
              },
              child: const Text("Log In"),
            ),
            ElevatedButton(
              onPressed: () {
                Get.toNamed(Routes.REGISTER);
              },
              child: const Text("Register"),
            ),
          ],
        ),
      ),
    );
  }
}
