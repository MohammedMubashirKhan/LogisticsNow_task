import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:logisticnow_task/app/resources/auth_methods.dart';
import 'package:logisticnow_task/app/routes/app_pages.dart';

class LoginController extends GetxController {
  TextEditingController emailController = TextEditingController();
  TextEditingController passController = TextEditingController();

  clearTextField() {
    emailController.clear();
    passController.clear();
  }

  /// Sign up a new user
  signUpUser() async {
    String res = await AuthMethods().signUpUser(
      email: emailController.text,
      password: passController.text,
    );

    Get.showSnackbar(
      GetSnackBar(
        title: "signUpUser",
        message: res,
        duration: const Duration(seconds: 5),
      ),
    );

    if (res == 'success') {
      Get.offAllNamed(Routes.WELCOME);
    }
  }

  /// Login a user
  login() async {
    String res = await AuthMethods().loginUser(
      email: emailController.text,
      password: passController.text,
    );

    if (res == 'success') {
      Get.offAllNamed(Routes.HOME);
    }
  }
}
