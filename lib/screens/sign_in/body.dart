import 'dart:ffi';

import 'package:finance_app/screens/root_page.dart';
import 'package:finance_app/screens/sign_in/SignUp.dart';
import 'package:finance_app/screens/sign_in/googleVerify.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import 'package:finance_app/constraints.dart';
import 'package:finance_app/size_config.dart';
import 'package:finance_app/screens/sign_in/googleSignIn.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:provider/provider.dart';
import 'package:finance_app/screens/sign_in/googleVerify.dart';
import '../../flutterfire.dart';
import '../../home_view.dart';
import 'package:finance_app/screens/sign_in/forgotPassword.dart';

class Body extends StatelessWidget {
  const Body({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: SizedBox(
      width: double.infinity,
      child: Padding(
        padding:
            EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(20)),
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: 40,
              ),
              Text(
                "Welcome Back",
                style: TextStyle(
                    color: Colors.black,
                    fontSize: getProportionateScreenWidth(28),
                    fontWeight: FontWeight.bold),
              ),
              Text(
                "Sign in with your email and password",
                textAlign: TextAlign.center,
              ),
              SizedBox(
                height: getProportionateScreenHeight(40),
              ),
              SignForm(),
            ],
          ),
        ),
      ),
    ));
  }
}

class SignForm extends StatefulWidget {
  const SignForm({super.key});

  @override
  State<SignForm> createState() => _SignFormState();
}

class _SignFormState extends State<SignForm> {
  TextEditingController _emailField = TextEditingController();
  TextEditingController _passwordField = TextEditingController();

  final _formKey = GlobalKey<FormState>();
  final List<String> errors = [];
  @override
  Widget build(BuildContext context) {
    return Form(
        key: _formKey,
        child: Column(
          children: [
            TextFormField(
              keyboardType: TextInputType.emailAddress,
              validator: (value) {
                if (value!.isEmpty) {
                  setState(() {
                    errors.add("Please enter your email.");
                  });
                }
                return null;
              },
              style: TextStyle(color: Colors.black),
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
            SizedBox(height: getProportionateScreenHeight(20)),
            TextFormField(
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
            SizedBox(
              height: getProportionateScreenHeight(5),
            ),
            FormErrors(errors: errors),
            SizedBox(height: getProportionateScreenHeight(10)),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                GestureDetector(
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) {
                      return ForgotPassword();
                    }));
                  },
                  child: Text(
                    "Forgot Password?",
                    style: TextStyle(
                        color: kTextColor, fontWeight: FontWeight.bold),
                  ),
                )
              ],
            ),
            SizedBox(height: getProportionateScreenHeight(10)),
            SizedBox(
              width: MediaQuery.of(context).size.width,
              height: 60,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                    padding: EdgeInsets.all(10),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(28)),
                    backgroundColor: kPrimaryColor),
                onPressed: () async {
                  bool shouldNavigate =
                      await signIn(_emailField.text, _passwordField.text);
                  if (shouldNavigate) {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => rootpage(),
                        ));
                  }
                },
                child: Text(
                  "Login",
                  style: TextStyle(fontSize: 20),
                ),
              ),
            ),
            SizedBox(height: getProportionateScreenHeight(10)),
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 65),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("Don't have an account? "),
                      GestureDetector(
                        onTap: () {
                          Navigator.push(context,
                              MaterialPageRoute(builder: (context) {
                            return SignUpScreen();
                          }));
                        },
                        child: Text(
                          "Sign Up",
                          style: TextStyle(
                              fontSize: 15,
                              color: kPrimaryColor,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
            SizedBox(height: getProportionateScreenHeight(20)),
            Divider(
              color: Colors.grey, //color of divider
              height: 5, //height spacing of divider
              thickness: 3, //thickness of divier line
              indent: 25, //spacing at the start of divider
              endIndent: 25, //spacing at the end of divider
            ),
            SizedBox(height: getProportionateScreenHeight(20)),
            SizedBox(
              width: MediaQuery.of(context).size.width,
              height: 50,
              child: ElevatedButton.icon(
                icon: SvgPicture.asset("assets/icons/google.svg"),
                style: ElevatedButton.styleFrom(
                    padding: EdgeInsets.all(5),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(28)),
                    backgroundColor: Colors.white.withOpacity(0.4)),
                onPressed: () async {
                  final provider =
                      Provider.of<GoogleSignInProvider>(context, listen: false);
                  provider.googleLogin();
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => googleVerify()));
                },
                label: Text(
                  "Sign in with Google",
                  style: TextStyle(fontSize: 18, color: Colors.black),
                ),
              ),
            ),
          ],
        ));
  }
}

class FormErrors extends StatelessWidget {
  const FormErrors({
    Key? key,
    required this.errors,
  }) : super(key: key);

  final List<String> errors;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: List.generate(
          errors.length, (index) => formErrorText(error: errors[index])),
    );
  }

  Row formErrorText({required String error}) {
    return Row(
      children: [
        SvgPicture.asset(
          "assets/icons/Error.svg",
          height: getProportionateScreenHeight(14),
          width: getProportionateScreenWidth(14),
        ),
        SizedBox(
          width: getProportionateScreenWidth(10),
        ),
        Text(error),
      ],
    );
  }
}
