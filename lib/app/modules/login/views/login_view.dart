import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/login_controller.dart';

class LoginView extends GetView<LoginController> {
  const LoginView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('LoginView'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const TextField(
              keyboardType: TextInputType.emailAddress,
              textAlign: TextAlign.center,
              decoration: InputDecoration(
                hintText: 'Enter Email',
              ),
            ),
            const SizedBox(
              height: 8.0,
            ),
            const TextField(
              obscureText: true,
              textAlign: TextAlign.center,
              decoration: InputDecoration(
                hintText: 'Enter your password',
              ),
            ),
            const SizedBox(
              height: 24.0,
            ),
            ElevatedButton(
              onPressed: () {},
              child: const Text("Log In"),
            ),
            const Text(
              'LoginView is working',
              style: TextStyle(fontSize: 20),
            ),
          ],
        ),
      ),
    );
  }
}
