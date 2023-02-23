import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import 'package:finance_app/size_config.dart';
import 'components/body.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});
  static String routeName = "/splash";

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      body: Body(),
    );
  }
}
