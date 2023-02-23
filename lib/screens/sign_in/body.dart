import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:finance_app/components/default_button.dart';
import 'package:finance_app/constraints.dart';
import 'package:finance_app/size_config.dart';

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
        child: Column(
          children: [
            Text(
              "Welcome Back",
              style: TextStyle(
                  color: Colors.white,
                  fontSize: getProportionateScreenWidth(28),
                  fontWeight: FontWeight.bold),
            ),
            Text(
              "Sign in with your email and password \nor continue with social media",
              textAlign: TextAlign.center,
            ),
            SignForm(),
          ],
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
            SizedBox(height: getProportionateScreenHeight(20)),
            TextFormField(
              obscureText: true,
              style: TextStyle(color: Colors.white),
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
                  labelStyle: TextStyle(color: Colors.white),
                  hintText: "Enter your password",
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
            SizedBox(
              height: getProportionateScreenHeight(20),
            ),
            FormErrors(errors: errors),
            DefaultButton(
                text: "Login",
                press: () {
                  if (_formKey.currentState!.validate()) {
                    _formKey.currentState?.save();
                  }
                }),
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
