import 'package:finance_app/screens/sign_in/googleSignIn.dart';
import 'package:flutter/material.dart';
import 'package:finance_app/constraints.dart';
import 'package:finance_app/routes.dart';
import 'package:finance_app/screens/splash/splash_screen.dart';
import 'package:finance_app/theme.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: ((context) => GoogleSignInProvider()),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'CashCoach',
        theme: theme(),
        // home: SplashScreen(),
        initialRoute: SplashScreen.routeName,
        routes: routes,
      ),
    );
  }
}
