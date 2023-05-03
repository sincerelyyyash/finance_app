import 'dart:convert';
import 'dart:ffi';

import 'package:finance_app/coinPages/axisbank.dart';
import 'package:finance_app/coinPages/hdfcbank.dart';
import 'package:finance_app/coinPages/icicibank.dart';
import 'package:finance_app/coinPages/infosys.dart';
import 'package:finance_app/coinPages/kotak.dart';
import 'package:finance_app/coinPages/reliance.dart';
import 'package:finance_app/coinPages/sbi.dart';
import 'package:finance_app/coinPages/tatasteel.dart';
import 'package:finance_app/models/api_methods.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:convert/convert.dart';

import 'coinPages/first.dart';
import 'constraints.dart';
import 'models/coins.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(),
        body: SingleChildScrollView(
          child: Column(children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(8, 10, 200, 8),
              child: Text(
                "Welcome Back!",
                style: TextStyle(color: Colors.black, fontSize: 22),
              ),
            ),
            Row(
              children: [
                SizedBox(
                  height: 20,
                ),
                Padding(
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
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.fromLTRB(8, 10, 230, 0),
                              child: Text(
                                "My Wallet",
                                style: TextStyle(
                                    color: Colors.black, fontSize: 13),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.fromLTRB(8, 0, 220, 8),
                              child: Text(
                                "Balance",
                                style: TextStyle(
                                    color: Colors.black, fontSize: 18),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.fromLTRB(8, 0, 220, 8),
                              child: Text(
                                "10,000",
                                style: TextStyle(
                                    color: kPrimaryColor, fontSize: 30),
                              ),
                            )
                          ]),
                    ),
                  ),
                )
              ],
            ),

            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    "Top Stocks",
                    style: TextStyle(fontSize: 18, color: Colors.black),
                  ),
                ),
              ],
            ),
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => HDFCpage()),
                );
              },
              child: Container(
                  child: SizedBox(
                      height: 79,
                      width: MediaQuery.of(context).size.width * 0.94,
                      child: Card(
                        color: Colors.white,
                        child: Padding(
                          padding: const EdgeInsets.all(12.0),
                          child: Row(
                            // crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Column(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: CircleAvatar(
                                      radius: 15.0,
                                      backgroundImage: NetworkImage(
                                          'https://1000logos.net/wp-content/uploads/2021/06/HDFC-Bank-emblem.png'),
                                      backgroundColor: Colors.transparent,
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(
                                width: 08,
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'HDFC Bank',
                                    style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  Text(
                                    'HDBK',
                                    style: TextStyle(
                                        fontSize: 12,
                                        color: Colors.black.withOpacity(0.5)),
                                  ),
                                ],
                              ),
                              SizedBox(
                                width: 30,
                              ),
                              Align(
                                alignment: Alignment.centerRight,
                                child: Padding(
                                  padding: const EdgeInsets.only(
                                      right: 8.0, left: 10),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        'current_price',
                                        style: TextStyle(
                                            fontSize: 12,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      Text(
                                        "price_change_24h",
                                        style: TextStyle(
                                            fontSize: 12,
                                            fontWeight: FontWeight.bold),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ))),
            ),
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => ICICIpage()),
                );
              },
              child: Container(
                  child: SizedBox(
                      height: 79,
                      width: MediaQuery.of(context).size.width * 0.94,
                      child: Card(
                        color: Colors.white,
                        child: Padding(
                          padding: const EdgeInsets.all(12.0),
                          child: Row(
                            // crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Column(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: CircleAvatar(
                                      radius: 15.0,
                                      backgroundImage: NetworkImage(
                                          'https://i.pinimg.com/originals/ff/d5/31/ffd531a6a78464512a97848e14506738.png'),
                                      backgroundColor: Colors.transparent,
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(
                                width: 08,
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'ICICI Bank',
                                    style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  Text(
                                    'ICBK',
                                    style: TextStyle(
                                        fontSize: 12,
                                        color: Colors.black.withOpacity(0.5)),
                                  ),
                                ],
                              ),
                              SizedBox(
                                width: 30,
                              ),
                              Align(
                                alignment: Alignment.centerRight,
                                child: Padding(
                                  padding: const EdgeInsets.only(
                                      right: 8.0, left: 10),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        'current_price',
                                        style: TextStyle(
                                            fontSize: 12,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      Text(
                                        "price_change_24h",
                                        style: TextStyle(
                                            fontSize: 12,
                                            fontWeight: FontWeight.bold),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ))),
            ),
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => RELIANCEpage()),
                );
              },
              child: Container(
                  child: SizedBox(
                      height: 79,
                      width: MediaQuery.of(context).size.width * 0.94,
                      child: Card(
                        color: Colors.white,
                        child: Padding(
                          padding: const EdgeInsets.all(12.0),
                          child: Row(
                            // crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Column(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: CircleAvatar(
                                      radius: 15.0,
                                      backgroundImage: NetworkImage(
                                          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTQSX_QJb8ukAbl7fU1xJPxLznsalLwAuHw8JE4hcPzTw&usqp=CAU&ec=48665701'),
                                      backgroundColor: Colors.transparent,
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(
                                width: 08,
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Reliance',
                                    style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  Text(
                                    'RELI',
                                    style: TextStyle(
                                        fontSize: 12,
                                        color: Colors.black.withOpacity(0.5)),
                                  ),
                                ],
                              ),
                              SizedBox(
                                width: 30,
                              ),
                              Align(
                                alignment: Alignment.centerRight,
                                child: Padding(
                                  padding: const EdgeInsets.only(
                                      right: 8.0, left: 10),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        'current_price',
                                        style: TextStyle(
                                            fontSize: 12,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      Text(
                                        "price_change_24h",
                                        style: TextStyle(
                                            fontSize: 12,
                                            fontWeight: FontWeight.bold),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ))),
            ),
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => INFOSYSpage()),
                );
              },
              child: Container(
                  child: SizedBox(
                      height: 79,
                      width: MediaQuery.of(context).size.width * 0.94,
                      child: Card(
                        color: Colors.white,
                        child: Padding(
                          padding: const EdgeInsets.all(12.0),
                          child: Row(
                            // crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Column(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: CircleAvatar(
                                      radius: 15.0,
                                      backgroundImage: NetworkImage(
                                          'https://static.vecteezy.com/system/resources/previews/020/190/476/original/infosys-logo-infosys-icon-free-free-vector.jpg'),
                                      backgroundColor: Colors.transparent,
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(
                                width: 08,
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Infosys',
                                    style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  Text(
                                    'INFY',
                                    style: TextStyle(
                                        fontSize: 12,
                                        color: Colors.black.withOpacity(0.5)),
                                  ),
                                ],
                              ),
                              SizedBox(
                                width: 30,
                              ),
                              Align(
                                alignment: Alignment.centerRight,
                                child: Padding(
                                  padding: const EdgeInsets.only(
                                      right: 8.0, left: 10),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        'current_price',
                                        style: TextStyle(
                                            fontSize: 12,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      Text(
                                        "price_change_24h",
                                        style: TextStyle(
                                            fontSize: 12,
                                            fontWeight: FontWeight.bold),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ))),
            ),
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => AXISSpage()),
                );
              },
              child: Container(
                  child: SizedBox(
                      height: 79,
                      width: MediaQuery.of(context).size.width * 0.94,
                      child: Card(
                        color: Colors.white,
                        child: Padding(
                          padding: const EdgeInsets.all(12.0),
                          child: Row(
                            // crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Column(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: CircleAvatar(
                                      radius: 15.0,
                                      backgroundImage: NetworkImage(
                                          'https://companieslogo.com/img/orig/AXISBANK.BO-8f59e95b.png?t=1672905040'),
                                      backgroundColor: Colors.transparent,
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(
                                width: 08,
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Axis Bank',
                                    style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  Text(
                                    'ACBK',
                                    style: TextStyle(
                                        fontSize: 12,
                                        color: Colors.black.withOpacity(0.5)),
                                  ),
                                ],
                              ),
                              SizedBox(
                                width: 30,
                              ),
                              Align(
                                alignment: Alignment.centerRight,
                                child: Padding(
                                  padding: const EdgeInsets.only(
                                      right: 8.0, left: 10),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        'current_price',
                                        style: TextStyle(
                                            fontSize: 12,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      Text(
                                        "price_change_24h",
                                        style: TextStyle(
                                            fontSize: 12,
                                            fontWeight: FontWeight.bold),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ))),
            ),
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => KOTAKpage()),
                );
              },
              child: Container(
                  child: SizedBox(
                      height: 79,
                      width: MediaQuery.of(context).size.width * 0.94,
                      child: Card(
                        color: Colors.white,
                        child: Padding(
                          padding: const EdgeInsets.all(12.0),
                          child: Row(
                            // crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Column(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: CircleAvatar(
                                      radius: 15.0,
                                      backgroundImage: NetworkImage(
                                          'https://assets.stickpng.com/images/627ccde01b2e263b45696ab7.png'),
                                      backgroundColor: Colors.transparent,
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(
                                width: 08,
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Kotak Mahindra',
                                    style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  Text(
                                    'KTKM',
                                    style: TextStyle(
                                        fontSize: 12,
                                        color: Colors.black.withOpacity(0.5)),
                                  ),
                                ],
                              ),
                              SizedBox(
                                width: 30,
                              ),
                              Align(
                                alignment: Alignment.centerRight,
                                child: Padding(
                                  padding: const EdgeInsets.only(
                                      right: 8.0, left: 10),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        'current_price',
                                        style: TextStyle(
                                            fontSize: 12,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      Text(
                                        "price_change_24h",
                                        style: TextStyle(
                                            fontSize: 12,
                                            fontWeight: FontWeight.bold),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ))),
            ),
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => SBIpage()),
                );
              },
              child: Container(
                  child: SizedBox(
                      height: 79,
                      width: MediaQuery.of(context).size.width * 0.94,
                      child: Card(
                        color: Colors.white,
                        child: Padding(
                          padding: const EdgeInsets.all(12.0),
                          child: Row(
                            // crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Column(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: CircleAvatar(
                                      radius: 15.0,
                                      backgroundImage: NetworkImage(
                                          'https://images.news18.com/static-bengali/2019/03/213.jpg?im=Resize,width=904,aspect=fit,type=normal'),
                                      backgroundColor: Colors.transparent,
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(
                                width: 08,
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'SBI',
                                    style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  Text(
                                    'SBI',
                                    style: TextStyle(
                                        fontSize: 12,
                                        color: Colors.black.withOpacity(0.5)),
                                  ),
                                ],
                              ),
                              SizedBox(
                                width: 30,
                              ),
                              Align(
                                alignment: Alignment.centerRight,
                                child: Padding(
                                  padding: const EdgeInsets.only(
                                      right: 8.0, left: 10),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        'current_price',
                                        style: TextStyle(
                                            fontSize: 12,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      Text(
                                        "price_change_24h",
                                        style: TextStyle(
                                            fontSize: 12,
                                            fontWeight: FontWeight.bold),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ))),
            ),
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => TATASTEELpage()),
                );
              },
              child: Container(
                  child: SizedBox(
                      height: 79,
                      width: MediaQuery.of(context).size.width * 0.94,
                      child: Card(
                        color: Colors.white,
                        child: Padding(
                          padding: const EdgeInsets.all(12.0),
                          child: Row(
                            // crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Column(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: CircleAvatar(
                                      radius: 15.0,
                                      backgroundImage: NetworkImage(
                                          'https://w7.pngwing.com/pngs/614/66/png-transparent-tata-business-support-services-tata-consultancy-services-tata-group-consultant-business-blue-angle-text.png'),
                                      backgroundColor: Colors.transparent,
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(
                                width: 08,
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Tata Steel',
                                    style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  Text(
                                    'TISC',
                                    style: TextStyle(
                                        fontSize: 12,
                                        color: Colors.black.withOpacity(0.5)),
                                  ),
                                ],
                              ),
                              SizedBox(
                                width: 30,
                              ),
                              Align(
                                alignment: Alignment.centerRight,
                                child: Padding(
                                  padding: const EdgeInsets.only(
                                      right: 8.0, left: 10),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        'current_price',
                                        style: TextStyle(
                                            fontSize: 12,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      Text(
                                        "price_change_24h",
                                        style: TextStyle(
                                            fontSize: 12,
                                            fontWeight: FontWeight.bold),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ))),
            ),

            //
          ]),
        ));
  }
}

//  "${getValues('litecoin')} Rs",

class CoinCard extends StatelessWidget {
  final Map<String, dynamic> coin;

  CoinCard({required this.coin});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white,
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Row(
          // crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: CircleAvatar(
                    radius: 14.0,
                    backgroundImage: NetworkImage(coin['image']),
                    backgroundColor: Colors.transparent,
                  ),
                ),
              ],
            ),
            SizedBox(
              width: 08,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  coin['name'],
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
                Text(
                  coin['symbol'],
                  style: TextStyle(
                      fontSize: 12, color: Colors.black.withOpacity(0.5)),
                ),
              ],
            ),
            SizedBox(
              width: 30,
            ),
            Align(
              alignment: Alignment.centerRight,
              child: Padding(
                padding: const EdgeInsets.only(right: 8.0, left: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      '\$${coin['current_price']}',
                      style:
                          TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
                    ),
                    Text(
                      "${coin['price_change_24h'].toStringAsFixed(3)}%",
                      style:
                          TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
