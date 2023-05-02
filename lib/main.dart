import 'package:finance_app/home_view.dart';
import 'package:finance_app/screens/root_page.dart';
import 'package:finance_app/screens/sign_in/googleSignIn.dart';
import 'package:flutter/material.dart';
import 'package:finance_app/constraints.dart';
import 'package:finance_app/routes.dart';
import 'package:finance_app/screens/splash/splash_screen.dart';
import 'package:finance_app/theme.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:provider/provider.dart';

import 'firebase_options.dart';

void main() async {
 WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    name: 'Finance-App',
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(MyApp());

}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool login = false;
  checkLogin() {
    FirebaseAuth.instance.authStateChanges().listen((User? user) {
      if (user == null) {
        if (mounted) {
          setState(() {
            login = false;
          });
        }
      } else {
        if (mounted) {
          setState(() {
            login = true;
          });
        }
      }
    });
  }
  @override
  void initState() {
    super.initState();
    checkLogin();
  }
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: ((context) => GoogleSignInProvider()),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Mock Markets',
        theme: theme(),
        // home: SplashScreen(),
        home:login? rootpage(): SplashScreen(),
        routes: routes,
      ),
    );
  }
}
