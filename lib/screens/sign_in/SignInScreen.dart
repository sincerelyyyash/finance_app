import 'package:flutter/material.dart';
import 'package:finance_app/screens/sign_in/body.dart';
import 'package:firebase_auth/firebase_auth.dart';

class SignInScreen extends StatelessWidget {
  const SignInScreen({super.key});
  static String routeName = "/sign_in";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "Sign In",
          style: TextStyle(color: Colors.white, fontSize: 20),
        ),
      ),
      body: Body(),
    );
  }
}
