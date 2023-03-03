import 'package:finance_app/constraints.dart';
import 'package:finance_app/size_config.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class ForgotPassword extends StatefulWidget {
  const ForgotPassword({super.key});

  @override
  State<ForgotPassword> createState() => _ForgotPasswordState();
}

class _ForgotPasswordState extends State<ForgotPassword> {
  TextEditingController _emailField = TextEditingController();

  @override
  void dispose() {
    _emailField.dispose();
    super.dispose();
  }

  Future passwordReset() async {
    try {
      await FirebaseAuth.instance
          .sendPasswordResetEmail(email: _emailField.text.trim());
      showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              content: Text("Password reset link sent! Check your email"),
            );
          });
    } on FirebaseAuthException catch (e) {
      print(e);
      showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              content: Text(e.message.toString()),
            );
          });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "Forgot Password?",
          style: TextStyle(color: Colors.white, fontSize: 20),
        ),
      ),
      body: Column(
        children: [
          Text(
            'Enter your Email \nWe will send you a password reset link.',
            textAlign: TextAlign.center,
          ),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: TextFormField(
              keyboardType: TextInputType.emailAddress,
              style: TextStyle(color: Colors.white),
              controller: _emailField,
              decoration: InputDecoration(
                  labelText: "Email",
                  floatingLabelBehavior: FloatingLabelBehavior.always,
                  suffixIcon: Padding(
                    padding: EdgeInsets.fromLTRB(
                        0,
                        getProportionateScreenWidth(20),
                        getProportionateScreenWidth(20),
                        getProportionateScreenWidth(20)),
                    child: SvgPicture.asset(
                      "assets/icons/Mail.svg",
                      height: getProportionateScreenWidth(18),
                    ),
                  ),
                  contentPadding:
                      EdgeInsets.symmetric(horizontal: 42, vertical: 20),
                  labelStyle: TextStyle(color: Colors.white),
                  hintText: "Enter your Email",
                  hintStyle: TextStyle(color: Colors.white),
                  enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(28),
                      borderSide: BorderSide(color: kTextColor),
                      gapPadding: 10),
                  focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(28),
                      borderSide: BorderSide(color: kTextColor),
                      gapPadding: 10)),
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(20.0, 0, 20, 20),
            child: SizedBox(
              width: MediaQuery.of(context).size.width,
              height: 50,
              child: ElevatedButton(
                onPressed: passwordReset,
                style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(28)),
                    backgroundColor: kPrimaryColor),
                child: const Text(
                  "Reset Password",
                  style: TextStyle(fontSize: 18, color: Colors.white),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
