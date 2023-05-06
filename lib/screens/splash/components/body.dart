import 'package:flutter/material.dart';
import 'package:finance_app/constraints.dart';
import 'package:finance_app/screens/sign_in/SignInScreen.dart';
import 'package:finance_app/screens/splash/components/splash_content.dart';
import 'package:finance_app/size_config.dart';

class Body extends StatefulWidget {
  const Body({super.key});

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  late PageController _pageController;
  int _currentPage = 0;
  @override
  void initState() {
    _pageController = PageController(initialPage: 0);
    super.initState();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

// List of splash screen content (Photos & data)
  List<Map<String, String>> splashData = [
    // Content of First Splash Screen.
    {
      "text": "LEARN BEFORE YOU START TO EARN!",
      "image": "assets/images/Splashh01.png",
    },
    // Content of Second Splash Screen.
    {
      "text": "DON'T RISK REAL MONEY WHEN LEARNING.",
      "image": "assets/images/Splashh02.png",
    },
    // Content of Third Splash Screen.
    {
      "text": "TRADE, DON'T GAMBLE.",
      "image": "assets/images/Splashh03.png",
    }
  ];
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SizedBox(
        width: double.infinity,
        child: Column(
          children: <Widget>[
            Expanded(
              flex: 3,
              child: PageView.builder(
                  // page controller for Splash screen
                  controller: _pageController,
                  onPageChanged: (index) {
                    setState(() {
                      _currentPage = index;
                    });
                  },
                  // Image and text of Splash Screen.
                  itemBuilder: (BuildContext context, int index) =>
                      SplashContent(
                        image: '${splashData[index]["image"]}',
                        text: '${splashData[index]['text']}',
                      )),
            ),
            // Design
            Expanded(
                flex: 2,
                child: Padding(
                  padding: EdgeInsets.symmetric(
                      horizontal: getProportionateScreenWidth(20)),
                  child: Column(
                    // Animated Dot widget on Splash Screen.
                    children: <Widget>[
                      Spacer(),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: List.generate(
                          splashData.length,
                          (index) => buildDot(index: index),
                        ),
                      ),
                      Spacer(
                        flex: 3,
                      ),
                      Padding(
                        padding: const EdgeInsets.all(20),
                        child: SizedBox(
                          height: 60,
                          width: MediaQuery.of(context).size.width,
                          // Next Button on splash screen for traversing through next splash screen.
                          // if else condition for splash screen button to convert it into Login button on last
                          // splash screen to get to Sign In Screen.
                          child: ElevatedButton(
                              onPressed: () {
                                if (_currentPage == 2) {
                                  print('Enter');
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              SignInScreen()));
                                } else {
                                  _pageController.nextPage(
                                      duration: Duration(milliseconds: 300),
                                      curve: Curves.ease);
                                }
                              },
                              style: ElevatedButton.styleFrom(
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(28)),
                                  backgroundColor: kPrimaryColor),
                              // Login button for last screen of splash screen.
                              child: (_currentPage == 2)
                                  ? Row(children: [
                                      Center(
                                        child: Padding(
                                          padding: const EdgeInsets.fromLTRB(
                                              115, 0, 40, 0),
                                          child: Text("Continue",
                                              textAlign: TextAlign.center,
                                              style: TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 18)),
                                        ),
                                      ),
                                    ])
                                  // Next button untill last Splash Screen.
                                  : Center(
                                      child: Text(
                                        "Next",
                                        style: TextStyle(
                                            fontSize: 18,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    )),
                        ),
                      )
                    ],
                  ),
                )),
          ],
        ),
      ),
    );
  }

// Animated Dot of the Splash Screen.
  AnimatedContainer buildDot({int? index}) {
    return AnimatedContainer(
        duration: kAnimationDuration,
        margin: EdgeInsets.only(right: 5),
        height: 6,
        width: _currentPage == index ? 20 : 6,
        decoration: BoxDecoration(
          color: _currentPage == index ? kPrimaryColor : Color(0xFFD8D8D8),
          borderRadius: BorderRadius.circular(3),
        ));
  }
}
