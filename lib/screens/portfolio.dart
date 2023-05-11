import 'package:finance_app/constraints.dart';
import 'package:flutter/material.dart';

import 'colorcode.dart';

class PortfolioPage extends StatefulWidget {
  const PortfolioPage({super.key});

  @override
  State<PortfolioPage> createState() => _PortfolioPageState();
}

class _PortfolioPageState extends State<PortfolioPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(children: [
          Stack(
            children: [
              Column(
                children: [
                  Container(
                    color: Color(0xFF624aa1),
                    height: 150,
                    width: double.infinity,
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            height: 50,
                          ),
                        ],
                      ),
                    ),
                  ),
                  Container(
                    decoration: BoxDecoration(
                        color: AppUIColor.lightbackgroundColor,
                        borderRadius: BorderRadius.only(
                            topRight: Radius.circular(60),
                            topLeft: Radius.circular(60))),
                    height: 150,
                    width: double.infinity,
                  ),
                ],
              ),
              Container(
                  height: 300,
                  width: double.infinity,
                  child: Center(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: SizedBox(
                        height: 180,
                        width: MediaQuery.of(context).size.width * 0.85,
                        child: Card(
                          elevation: 4,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12.0),
                          ),
                          color: Colors.white,
                          child: Padding(
                            padding: const EdgeInsets.all(16),
                            child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Networth",
                                    style: TextStyle(
                                        color: Colors.black, fontSize: 13),
                                  ),
                                  SizedBox(
                                    height: MediaQuery.of(context).size.height /
                                        100,
                                  ),
                                  Text(
                                    "Portfolio",
                                    style: TextStyle(
                                        color: Colors.black, fontSize: 18),
                                  ),
                                  Container(
                                    width:
                                        MediaQuery.of(context).size.width / 3,
                                    child: FittedBox(
                                      child: Text(
                                        "20,000",
                                        style: TextStyle(
                                            color: kPrimaryColor, fontSize: 30),
                                      ),
                                    ),
                                  )
                                ]),
                          ),
                        ),
                      ),
                    ),
                  )),
            ],
          ),
          SizedBox(
            height: 60,
            width: MediaQuery.of(context).size.width * 0.85,
            child: Card(
              color: Colors.white,
              elevation: 0,
              child: Column(children: [
                Text(
                  "You do not have any Stocks in your portfolio!",
                  style: TextStyle(color: Colors.black, fontSize: 15),
                )
              ]),
            ),
          )
        ]),
      ),
    );
  }
}
