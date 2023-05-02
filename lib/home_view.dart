import 'dart:convert';
import 'dart:ffi';

import 'package:finance_app/coinPages/eighth.dart';
import 'package:finance_app/coinPages/fifth.dart';
import 'package:finance_app/coinPages/first.dart';
import 'package:finance_app/coinPages/fourth.dart';
import 'package:finance_app/coinPages/ninth.dart';
import 'package:finance_app/coinPages/second.dart';
import 'package:finance_app/coinPages/seventh.dart';
import 'package:finance_app/coinPages/sixth.dart';
import 'package:finance_app/coinPages/tenth.dart';
import 'package:finance_app/coinPages/third.dart';
import 'package:finance_app/models/api_methods.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:convert/convert.dart';

import 'constraints.dart';
import 'models/coins.dart';

String? stringResponse;
Map? mapResponse;
List? listResponse;

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  final Future<List<Map<String, dynamic>>> coinsData = fetchData();
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
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12.0),
                      ),
                      color: kPrimaryColor,
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.fromLTRB(8, 10, 230, 0),
                              child: Text(
                                "My Wallet",
                                style: TextStyle(
                                    color: Colors.white, fontSize: 13),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.fromLTRB(8, 0, 220, 8),
                              child: Text(
                                "Balance",
                                style: TextStyle(
                                    color: Colors.white, fontSize: 18),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.fromLTRB(8, 0, 220, 8),
                              child: Text(
                                "1000\$",
                                style: TextStyle(
                                    color: Colors.white, fontSize: 30),
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
                    "Popular Coins",
                    style: TextStyle(fontSize: 18, color: Colors.black),
                  ),
                ),
              ],
            ),
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => FirstCoin()),
                );
              },
              child: Container(
                child: FutureBuilder<Map<String, dynamic>>(
                    // future: coinsData,
                    builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    // access data from the 2nd index
                    final coinData = snapshot.data![0];
                    return SizedBox(
                        height: 79,
                        width: MediaQuery.of(context).size.width * 0.88,
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
                                        radius: 14.0,
                                        backgroundImage:
                                            NetworkImage(coinData['image']),
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
                                      coinData['name'],
                                      style: TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    Text(
                                      coinData['symbol'],
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
                                          '\$${coinData['current_price']}',
                                          style: TextStyle(
                                              fontSize: 12,
                                              fontWeight: FontWeight.bold),
                                        ),
                                        Text(
                                          "${coinData['price_change_24h'].toStringAsFixed(3)}%",
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
                        ));
                  } else if (snapshot.hasError) {
                    return Text('Failed to fetch data: ${snapshot.error}');
                  } else {
                    return CircularProgressIndicator();
                  }
                }),
              ),
            ),
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => SecondCoinPage()),
                );
              },
              child: Container(
                child: FutureBuilder<Map<String, dynamic>>(
                    // future: coinsData,
                    builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    // access data from the 2nd index
                    final coinData = snapshot.data![1];
                    return SizedBox(
                        height: 79,
                        width: MediaQuery.of(context).size.width * 0.88,
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
                                        radius: 14.0,
                                        backgroundImage:
                                            NetworkImage(coinData['image']),
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
                                      coinData['name'],
                                      style: TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    Text(
                                      coinData['symbol'],
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
                                          '\$${coinData['current_price']}',
                                          style: TextStyle(
                                              fontSize: 12,
                                              fontWeight: FontWeight.bold),
                                        ),
                                        Text(
                                          "${coinData['price_change_24h'].toStringAsFixed(3)}%",
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
                        ));
                  } else if (snapshot.hasError) {
                    return Text('Failed to fetch data: ${snapshot.error}');
                  } else {
                    return Container();
                  }
                }),
              ),
            ),
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => ThirdCoin()),
                );
              },
              child: Container(
                child: FutureBuilder<Map<String, dynamic>>(
                    // future: coinsData,
                    builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    // access data from the 2nd index
                    final coinData = snapshot.data![2];
                    return SizedBox(
                        height: 79,
                        width: MediaQuery.of(context).size.width * 0.88,
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
                                        radius: 14.0,
                                        backgroundImage:
                                            NetworkImage(coinData['image']),
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
                                      coinData['name'],
                                      style: TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    Text(
                                      coinData['symbol'],
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
                                          '\$${coinData['current_price']}',
                                          style: TextStyle(
                                              fontSize: 12,
                                              fontWeight: FontWeight.bold),
                                        ),
                                        Text(
                                          "${coinData['price_change_24h'].toStringAsFixed(3)}%",
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
                        ));
                  } else if (snapshot.hasError) {
                    return Text('Failed to fetch data: ${snapshot.error}');
                  } else {
                    return Container();
                  }
                }),
              ),
            ),
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => FourthCoin()),
                );
              },
              child: Container(
                child: FutureBuilder<Map<String, dynamic>>(
                    // future: coinsData,
                    builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    // access data from the 2nd index
                    final coinData = snapshot.data![3];
                    return SizedBox(
                        height: 79,
                        width: MediaQuery.of(context).size.width * 0.88,
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
                                        radius: 14.0,
                                        backgroundImage:
                                            NetworkImage(coinData['image']),
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
                                      coinData['name'],
                                      style: TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    Text(
                                      coinData['symbol'],
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
                                          '\$${coinData['current_price']}',
                                          style: TextStyle(
                                              fontSize: 12,
                                              fontWeight: FontWeight.bold),
                                        ),
                                        Text(
                                          "${coinData['price_change_24h'].toStringAsFixed(3)}%",
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
                        ));
                  } else if (snapshot.hasError) {
                    return Text('Failed to fetch data: ${snapshot.error}');
                  } else {
                    return Container();
                  }
                }),
              ),
            ),
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => FifthCoin()),
                );
              },
              child: Container(
                child: FutureBuilder<Map<String, dynamic>>(
                    // future: coinsData,
                    builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    // access data from the 2nd index
                    final coinData = snapshot.data![4];
                    return SizedBox(
                        height: 79,
                        width: MediaQuery.of(context).size.width * 0.88,
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
                                        radius: 14.0,
                                        backgroundImage:
                                            NetworkImage(coinData['image']),
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
                                      coinData['name'],
                                      style: TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    Text(
                                      coinData['symbol'],
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
                                          '\$${coinData['current_price']}',
                                          style: TextStyle(
                                              fontSize: 12,
                                              fontWeight: FontWeight.bold),
                                        ),
                                        Text(
                                          "${coinData['price_change_24h'].toStringAsFixed(3)}%",
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
                        ));
                  } else if (snapshot.hasError) {
                    return Text('Failed to fetch data: ${snapshot.error}');
                  } else {
                    return Container();
                  }
                }),
              ),
            ),
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => SixthCoin()),
                );
              },
              child: Container(
                child: FutureBuilder<Map<String, dynamic>>(
                    // future: coinsData,
                    builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    // access data from the 2nd index
                    final coinData = snapshot.data![5];
                    return SizedBox(
                        height: 79,
                        width: MediaQuery.of(context).size.width * 0.88,
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
                                        radius: 14.0,
                                        backgroundImage:
                                            NetworkImage(coinData['image']),
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
                                      coinData['name'],
                                      style: TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    Text(
                                      coinData['symbol'],
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
                                          '\$${coinData['current_price']}',
                                          style: TextStyle(
                                              fontSize: 12,
                                              fontWeight: FontWeight.bold),
                                        ),
                                        Text(
                                          "${coinData['price_change_24h'].toStringAsFixed(3)}%",
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
                        ));
                  } else if (snapshot.hasError) {
                    return Text('Failed to fetch data: ${snapshot.error}');
                  } else {
                    return Container();
                  }
                }),
              ),
            ),
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => SeventhCoin()),
                );
              },
              child: Container(
                child: FutureBuilder<Map<String, dynamic>>(
                    // future: coinsData,
                    builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    // access data from the 2nd index
                    final coinData = snapshot.data![6];
                    return SizedBox(
                        height: 79,
                        width: MediaQuery.of(context).size.width * 0.88,
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
                                        radius: 14.0,
                                        backgroundImage:
                                            NetworkImage(coinData['image']),
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
                                      coinData['name'],
                                      style: TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    Text(
                                      coinData['symbol'],
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
                                          '\$${coinData['current_price']}',
                                          style: TextStyle(
                                              fontSize: 12,
                                              fontWeight: FontWeight.bold),
                                        ),
                                        Text(
                                          "${coinData['price_change_24h'].toStringAsFixed(3)}%",
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
                        ));
                  } else if (snapshot.hasError) {
                    return Text('Failed to fetch data: ${snapshot.error}');
                  } else {
                    return Container();
                  }
                }),
              ),
            ),
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => EighthCoin()),
                );
              },
              child: Container(
                child: FutureBuilder<Map<String, dynamic>>(
                    // future: coinsData,
                    builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    // access data from the 2nd index
                    final coinData = snapshot.data![7];
                    return SizedBox(
                        height: 79,
                        width: MediaQuery.of(context).size.width * 0.88,
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
                                        radius: 14.0,
                                        backgroundImage:
                                            NetworkImage(coinData['image']),
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
                                      coinData['name'],
                                      style: TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    Text(
                                      coinData['symbol'],
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
                                          '\$${coinData['current_price']}',
                                          style: TextStyle(
                                              fontSize: 12,
                                              fontWeight: FontWeight.bold),
                                        ),
                                        Text(
                                          "${coinData['price_change_24h'].toStringAsFixed(3)}%",
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
                        ));
                  } else if (snapshot.hasError) {
                    return Text('Failed to fetch data: ${snapshot.error}');
                  } else {
                    return Container();
                  }
                }),
              ),
            ),
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => NinthCoin()),
                );
              },
              child: Container(
                child: FutureBuilder<Map<String, dynamic>>(
                    // future: coinsData,
                    builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    // access data from the 2nd index
                    final coinData = snapshot.data![8];
                    return SizedBox(
                        height: 79,
                        width: MediaQuery.of(context).size.width * 0.88,
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
                                        radius: 14.0,
                                        backgroundImage:
                                            NetworkImage(coinData['image']),
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
                                      coinData['name'],
                                      style: TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    Text(
                                      coinData['symbol'],
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
                                          '\$${coinData['current_price']}',
                                          style: TextStyle(
                                              fontSize: 12,
                                              fontWeight: FontWeight.bold),
                                        ),
                                        Text(
                                          "${coinData['price_change_24h'].toStringAsFixed(3)}%",
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
                        ));
                  } else if (snapshot.hasError) {
                    return Text('Failed to fetch data: ${snapshot.error}');
                  } else {
                    return Container();
                  }
                }),
              ),
            ),
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => TenthCoin()),
                );
              },
              child: Container(
                child: FutureBuilder<Map<String, dynamic>>(
                    // future: coinsData,
                    builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    // access data from the 2nd index
                    final coinData = snapshot.data![9];
                    return SizedBox(
                        height: 79,
                        width: MediaQuery.of(context).size.width * 0.88,
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
                                        radius: 14.0,
                                        backgroundImage:
                                            NetworkImage(coinData['image']),
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
                                      coinData['name'],
                                      style: TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    Text(
                                      coinData['symbol'],
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
                                          '\$${coinData['current_price']}',
                                          style: TextStyle(
                                              fontSize: 12,
                                              fontWeight: FontWeight.bold),
                                        ),
                                        Text(
                                          "${coinData['price_change_24h'].toStringAsFixed(3)}%",
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
                        ));
                  } else if (snapshot.hasError) {
                    return Text('Failed to fetch data: ${snapshot.error}');
                  } else {
                    return Container();
                  }
                }),
              ),
            ),
            // Container(
            //   height: 800,
            //   child: FutureBuilder<List<Map<String, dynamic>>>(
            //     future: fetchData(),
            //     builder: (context, snapshot) {
            //       if (snapshot.hasData) {
            //         final coins = snapshot.data!;
            //         return ListView.builder(
            //           itemCount: coins.length,
            //           itemBuilder: (context, index) {
            //             final coin = coins[index];
            //             return SizedBox(
            //                 height: 79,
            //                 width: MediaQuery.of(context).size.width * 0.88,
            //                 child: CoinCard(coin: coin));
            //           },
            //         );
            //       } else if (snapshot.hasError) {
            //         return Text('${snapshot.error}');
            //       } else {
            //         return CircularProgressIndicator();
            //       }
            //     },
            //   ),
            // ),

            // SizedBox( height: 200,width: 200,
            //   child: Card(
            //     color: Colors.white,
            //     child: Column(
            //       children: [
            //         CircleAvatar(
            //                   radius: 15.0,
            //                   backgroundImage: NetworkImage(''),
            //                   backgroundColor: Colors.transparent,
            //                 ),

            //       ],
            //     )
            //   ))
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
