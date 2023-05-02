import 'package:finance_app/flutterfire.dart';
import 'package:finance_app/screens/root_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../constraints.dart';
import '../../home_view.dart';
import '../../size_config.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  // Text Controller for Email And Password.
  TextEditingController _emailField = TextEditingController();
  TextEditingController _passwordField = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          // Appbar Title for the page.
          title: Text(
            "Sign Up",
            style: TextStyle(color: Colors.black, fontSize: 20),
          ),
        ),
        body: Column(children: [
          SizedBox(height: getProportionateScreenHeight(20)),
          Text(
            'Please enter your details to register.',
            textAlign: TextAlign.center,
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(20, 20, 20, 0),
            child: TextFormField(
              // Keyboard type declaration for @ button on keyboard.
              keyboardType: TextInputType.emailAddress,
              style: TextStyle(color: Colors.black),
              // Text Controller for email.
              controller: _emailField,
              decoration: InputDecoration(
                  // Label on Email input Dialog Box
                  labelText: "Email",
                  floatingLabelBehavior: FloatingLabelBehavior.always,
                  suffixIcon: Padding(
                    padding: EdgeInsets.fromLTRB(
                        0,
                        getProportionateScreenWidth(20),
                        getProportionateScreenWidth(20),
                        getProportionateScreenWidth(20)),
                    child: SvgPicture.asset(
                      // Suffix logo for mail.
                      "assets/icons/Mail.svg",
                      height: getProportionateScreenWidth(18),
                    ),
                  ),
                  contentPadding:
                      EdgeInsets.symmetric(horizontal: 42, vertical: 20),
                  labelStyle: TextStyle(color: Colors.black),
                  hintText: "Enter your Email",
                  hintStyle: TextStyle(color: Colors.black),
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
          SizedBox(height: getProportionateScreenHeight(20)),
          Padding(
            padding: const EdgeInsets.fromLTRB(20, 0, 20, 10),
            child: TextFormField(
              obscureText: true,
              style: TextStyle(color: Colors.black),
              controller: _passwordField,
              decoration: InputDecoration(
                  labelText: "Password",
                  floatingLabelBehavior: FloatingLabelBehavior.always,
                  suffixIcon: Padding(
                    padding: EdgeInsets.fromLTRB(
                        0,
                        getProportionateScreenWidth(20),
                        getProportionateScreenWidth(20),
                        getProportionateScreenWidth(20)),
                    child: SvgPicture.asset(
                      "assets/icons/Lock.svg",
                      height: getProportionateScreenWidth(18),
                    ),
                  ),
                  contentPadding:
                      EdgeInsets.symmetric(horizontal: 42, vertical: 20),
                  labelStyle: TextStyle(color: Colors.black),
                  hintText: "Enter your password",
                  hintStyle: TextStyle(color: Colors.black),
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
            padding: const EdgeInsets.all(20),
            child: SizedBox(
              width: MediaQuery.of(context).size.width,
              height: 50,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                    padding: EdgeInsets.all(10),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(28)),
                    backgroundColor: kPrimaryColor),
                onPressed: () async {
                  bool shouldNavigate =
                      await register(_emailField.text, _passwordField.text);
                  if (shouldNavigate) {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => rootpage(),
                        ));
                  }
                },
                child: Text(
                  "Register",
                  style: TextStyle(fontSize: 18),
                ),
              ),
            ),
          ),
        ]));
  }
}
