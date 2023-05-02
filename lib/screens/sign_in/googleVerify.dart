import 'package:finance_app/constraints.dart';
import 'package:finance_app/home_view.dart';
import 'package:finance_app/screens/profile.dart';
import 'package:finance_app/screens/root_page.dart';
import 'package:finance_app/screens/sign_in/SignInScreen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

class googleVerify extends StatelessWidget {
  const googleVerify({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => Scaffold(
        body: StreamBuilder(
            stream: FirebaseAuth.instance.authStateChanges(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(
                  child: Center(
                      child: CircularProgressIndicator(color: kPrimaryColor)),
                );
              } else if (snapshot.hasData) {
                return rootpage();
              } else if (snapshot.hasError) {
                print('Something is wrong');
                return SignInScreen();
              } else {
                return SignInScreen();
              }
            }),
      );
}
