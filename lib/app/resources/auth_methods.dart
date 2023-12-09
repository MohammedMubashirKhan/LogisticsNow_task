import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';

class AuthMethods {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  // sign up user
  Future<String> signUpUser({
    required String email,
    required String password,
  }) async {
    log("email: $email", name: "signUpUser");
    log("password: $password", name: "signUpUser");

    String res = "Some error occure";

    try {
      if (email.isNotEmpty || password.isNotEmpty) {
        // user registration
        UserCredential cred = await _auth.createUserWithEmailAndPassword(
            email: email, password: password);
        print(cred.user!.uid);

        res = "success";
      }
    } on FirebaseAuthException catch (err) {
      if (err.code == "invalid-email") {
        res = "The email is badly formated";
      } else if (err.code == "weak-password") {
        res = "6 charecter password is required";
      } else {
        res = "${err.message}";
      }
    } catch (err) {
      res = err.toString();
    }
    return res;
  }

  // logging in user
  Future<String> loginUser({
    required String email,
    required String password,
  }) async {
    log("email: $email", name: "loginUser");
    log("password: $password", name: "loginUser");

    String res = "Some error occure";

    try {
      if (email.isNotEmpty || password.isNotEmpty) {
        await _auth.signInWithEmailAndPassword(
            email: email, password: password);
        res = "success";
      } else {
        res = "Please enter all the fiends";
      }
    } on FirebaseAuthException catch (err) {
      if (err.code == "wrong-password") {
        res = "The password is invalid or the user does not have a password.";
      } else if (err.code == "user-not-found") {
        res =
            "There is no user record corresponding to this identifier. The user may have been deleted.";
      } else if (err.code == "invalid-email") {
        res = "Email adress is not valid.";
      } else if (err.code == "user-disabled") {
        res = "User is currently disabled.";
      }
    } catch (err) {
      res = err.toString();
    }
    return res;
  }
}
