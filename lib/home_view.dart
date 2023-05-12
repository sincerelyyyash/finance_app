import 'dart:async';
import 'dart:convert';
import 'dart:ffi';
import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:finance_app/coinPages/axisbank.dart';
import 'package:finance_app/coinPages/hdfcbank.dart';
import 'package:finance_app/coinPages/icicibank.dart';
import 'package:finance_app/coinPages/infosys.dart';
import 'package:finance_app/coinPages/kotak.dart';
import 'package:finance_app/coinPages/reliance.dart';
import 'package:finance_app/coinPages/sbi.dart';
import 'package:finance_app/coinPages/tatasteel.dart';
import 'package:finance_app/flutterfire.dart';
import 'package:finance_app/models/api_methods.dart';
import 'package:finance_app/screens/colorcode.dart';
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
  late int _hdfcPrice = 0;
  late int _minPhdfc;
  late int _maxPhdfc;

  late int _iciciPrice = 0;
  late int _minPicici;
  late int _maxPicici;

  late int _relPrice = 0;
  late int _minPrel;
  late int _maxPrel;

  late int _infoPrice = 0;
  late int _minPinfo;
  late int _maxPinfo;

  late int _axisPrice = 0;
  late int _minPaxis;
  late int _maxPaxis;

  late int _ktkPrice = 0;
  late int _minPktk;
  late int _maxPktk;

  late int _sbiPrice = 0;
  late int _minPsbi;
  late int _maxPsbi;

  late int _tsPrice = 0;
  late int _minPts;
  late int _maxPts;

  Future<DocumentSnapshot<Map<String, dynamic>>> _gethdfcDocument() async {
    return FirebaseFirestore.instance
        .collection('prices')
        .doc('hdfcbank')
        .get();
  }

  Future<DocumentSnapshot<Map<String, dynamic>>> _geticiciDocument() async {
    return FirebaseFirestore.instance
        .collection('prices')
        .doc('icicibank')
        .get();
  }

  Future<DocumentSnapshot<Map<String, dynamic>>> _getrelDocument() async {
    return FirebaseFirestore.instance
        .collection('prices')
        .doc('reliance')
        .get();
  }

  Future<DocumentSnapshot<Map<String, dynamic>>> _getinfoDocument() async {
    return FirebaseFirestore.instance.collection('prices').doc('infosys').get();
  }

  Future<DocumentSnapshot<Map<String, dynamic>>> _getaxisDocument() async {
    return FirebaseFirestore.instance
        .collection('prices')
        .doc('axisbank')
        .get();
  }

  Future<DocumentSnapshot<Map<String, dynamic>>> _getktkDocument() async {
    return FirebaseFirestore.instance.collection('prices').doc('kotak').get();
  }

  Future<DocumentSnapshot<Map<String, dynamic>>> _getsbiDocument() async {
    return FirebaseFirestore.instance.collection('prices').doc('sbi').get();
  }

  Future<DocumentSnapshot<Map<String, dynamic>>> _gettsDocument() async {
    return FirebaseFirestore.instance
        .collection('prices')
        .doc('tatasteel')
        .get();
  }

  @override
  void initState() {
    super.initState();
    createWallet();
    _gethdfcDocument().then((snapshot) {
      final data = snapshot.data()!;
      _minPhdfc = data['minPriceday'] as int;
      _maxPhdfc = data['maxPriceday'] as int;
      _generatehdfcPrice(_minPhdfc, _maxPhdfc);
    });
    _geticiciDocument().then((snapshot) {
      final data = snapshot.data()!;
      _minPicici = data['minPriceday'] as int;
      _maxPicici = data['maxPriceday'] as int;
      _generateiciciPrice(_minPicici, _maxPicici);
    });
    _getrelDocument().then((snapshot) {
      final data = snapshot.data()!;
      _minPrel = data['minPriceday'] as int;
      _maxPrel = data['maxPriceday'] as int;
      _generaterelPrice(_minPrel, _maxPrel);
    });
    _getinfoDocument().then((snapshot) {
      final data = snapshot.data()!;
      _minPinfo = data['minPriceday'] as int;
      _maxPinfo = data['maxPriceday'] as int;
      _generateinfoPrice(_minPinfo, _maxPinfo);
    });
    _getaxisDocument().then((snapshot) {
      final data = snapshot.data()!;
      _minPaxis = data['minPriceday'] as int;
      _maxPaxis = data['maxPriceday'] as int;
      _generateaxisPrice(_minPaxis, _maxPaxis);
    });
    _getktkDocument().then((snapshot) {
      final data = snapshot.data()!;
      _minPktk = data['minPriceday'] as int;
      _maxPktk = data['maxPriceday'] as int;
      _generatektkPrice(_minPktk, _maxPktk);
    });
    _getsbiDocument().then((snapshot) {
      final data = snapshot.data()!;
      _minPsbi = data['minPriceday'] as int;
      _maxPsbi = data['maxPriceday'] as int;
      _generatesbiPrice(_minPsbi, _maxPsbi);
    });
    _gettsDocument().then((snapshot) {
      final data = snapshot.data()!;
      _minPts = data['minPriceday'] as int;
      _maxPts = data['maxPriceday'] as int;
      _generatetsPrice(_minPts, _maxPts);
    });
  }

  void _generatehdfcPrice(int minRange, int maxRange) {
    FirebaseFirestore.instance
        .collection('prices')
        .doc('hdfcbank')
        .update({'price': _hdfcPrice});

    _hdfcPrice = Random().nextInt(maxRange - minRange) + minRange;
    Timer.periodic(Duration(seconds: 3), (timer) {
      setState(() {
        _hdfcPrice = Random().nextInt(maxRange - minRange) + minRange;
        FirebaseFirestore.instance
            .collection('prices')
            .doc('hdfcbank')
            .update({'price': _hdfcPrice});
      });
    });
  }

  void _generateiciciPrice(int minRange, int maxRange) {
    FirebaseFirestore.instance
        .collection('prices')
        .doc('icicibank')
        .update({'price': _iciciPrice});

    _iciciPrice = Random().nextInt(maxRange - minRange) + minRange;
    Timer.periodic(Duration(seconds: 3), (timer) {
      setState(() {
        _iciciPrice = Random().nextInt(maxRange - minRange) + minRange;
        FirebaseFirestore.instance
            .collection('prices')
            .doc('icicibank')
            .update({'price': _iciciPrice});
      });
    });
  }

  void _generaterelPrice(int minRange, int maxRange) {
    FirebaseFirestore.instance
        .collection('prices')
        .doc('reliance')
        .update({'price': _relPrice});

    _relPrice = Random().nextInt(maxRange - minRange) + minRange;
    Timer.periodic(Duration(seconds: 3), (timer) {
      setState(() {
        _relPrice = Random().nextInt(maxRange - minRange) + minRange;
        FirebaseFirestore.instance
            .collection('prices')
            .doc('reliance')
            .update({'price': _relPrice});
      });
    });
  }

  void _generateinfoPrice(int minRange, int maxRange) {
    FirebaseFirestore.instance
        .collection('prices')
        .doc('infosys')
        .update({'price': _infoPrice});

    _infoPrice = Random().nextInt(maxRange - minRange) + minRange;
    Timer.periodic(Duration(seconds: 3), (timer) {
      setState(() {
        _infoPrice = Random().nextInt(maxRange - minRange) + minRange;
        FirebaseFirestore.instance
            .collection('prices')
            .doc('infosys')
            .update({'price': _infoPrice});
      });
    });
  }

  void _generateaxisPrice(int minRange, int maxRange) {
    FirebaseFirestore.instance
        .collection('prices')
        .doc('axisbank')
        .update({'price': _axisPrice});

    _axisPrice = Random().nextInt(maxRange - minRange) + minRange;
    Timer.periodic(Duration(seconds: 3), (timer) {
      setState(() {
        _axisPrice = Random().nextInt(maxRange - minRange) + minRange;
        FirebaseFirestore.instance
            .collection('prices')
            .doc('axisbank')
            .update({'price': _axisPrice});
      });
    });
  }

  void _generatektkPrice(int minRange, int maxRange) {
    FirebaseFirestore.instance
        .collection('prices')
        .doc('kotak')
        .update({'price': _ktkPrice});

    _ktkPrice = Random().nextInt(maxRange - minRange) + minRange;
    Timer.periodic(Duration(seconds: 3), (timer) {
      setState(() {
        _ktkPrice = Random().nextInt(maxRange - minRange) + minRange;
        FirebaseFirestore.instance
            .collection('prices')
            .doc('kotak')
            .update({'price': _ktkPrice});
      });
    });
  }

  void _generatesbiPrice(int minRange, int maxRange) {
    FirebaseFirestore.instance
        .collection('prices')
        .doc('sbi')
        .update({'price': _sbiPrice});

    _sbiPrice = Random().nextInt(maxRange - minRange) + minRange;
    Timer.periodic(Duration(seconds: 3), (timer) {
      setState(() {
        _sbiPrice = Random().nextInt(maxRange - minRange) + minRange;
        FirebaseFirestore.instance
            .collection('prices')
            .doc('sbi')
            .update({'price': _sbiPrice});
      });
    });
  }

  void _generatetsPrice(int minRange, int maxRange) {
    FirebaseFirestore.instance
        .collection('prices')
        .doc('tatasteel')
        .update({'price': _tsPrice});

    _tsPrice = Random().nextInt(maxRange - minRange) + minRange;
    Timer.periodic(Duration(seconds: 3), (timer) {
      setState(() {
        _tsPrice = Random().nextInt(maxRange - minRange) + minRange;
        FirebaseFirestore.instance
            .collection('prices')
            .doc('tatasteel')
            .update({'price': _tsPrice});
      });
    });
  }

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
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      width: 350,
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
                                // Text(
                                //   "My Wallet",
                                //   style: TextStyle(
                                //       color: Colors.black, fontSize: 13),
                                // ),
                                // SizedBox(
                                //   height:
                                //       MediaQuery.of(context).size.height / 100,
                                // ),
                                // Text(
                                //   "Cash Balance",
                                //   style: TextStyle(
                                //       color: Colors.black, fontSize: 18),
                                // ),
                                Container(
                                  width: MediaQuery.of(context).size.width / 3,
                                  child: FittedBox(
                                    child: Text(
                                      "MockMarkets",
                                      style: TextStyle(
                                          color: kPrimaryColor, fontSize: 30),
                                    ),
                                  ),
                                )
                              ]),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
        // Padding(
        //   padding: const EdgeInsets.fromLTRB(8, 10, 200, 8),
        //   child: Text(
        //     "Welcome Back!",
        //     style: TextStyle(color: Colors.black, fontSize: 22),
        //   ),
        // ),
        // Row(
        //   children: [
        //     SizedBox(
        //       height: 20,
        //     ),
        //     Padding(
        //       padding: const EdgeInsets.all(8.0),
        //       child: SizedBox(
        //         height: 180,
        //         width: MediaQuery.of(context).size.width * 0.85,
        //         child:
        //       ),
        //     )
        //   ],
        // ),

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
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
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
                            ],
                          ),
                          // SizedBox(
                          //   width: 30,
                          // ),
                          Align(
                              alignment: Alignment.centerRight,
                              child: Padding(
                                padding:
                                    const EdgeInsets.only(right: 8.0, left: 10),
                                child: SizedBox(
                                  height: 75,
                                  width: 75,
                                  child: Text(
                                    _hdfcPrice.toString(),
                                    style: TextStyle(
                                        fontSize: 19,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.green),
                                  ),
                                ),
                              ))
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
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        // crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
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
                            ],
                          ),
                          // SizedBox(
                          //   width: 30,
                          // ),
                          Align(
                              alignment: Alignment.centerRight,
                              child: Padding(
                                padding:
                                    const EdgeInsets.only(right: 8.0, left: 10),
                                child: SizedBox(
                                  height: 75,
                                  width: 75,
                                  child: Text(
                                    _iciciPrice.toString(),
                                    style: TextStyle(
                                        fontSize: 19,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.green),
                                  ),
                                ),
                              ))
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
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        // crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
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
                            ],
                          ),
                          // SizedBox(
                          //   width: 30,
                          // ),
                          Align(
                              alignment: Alignment.centerRight,
                              child: Padding(
                                padding:
                                    const EdgeInsets.only(right: 8.0, left: 10),
                                child: SizedBox(
                                  height: 75,
                                  width: 75,
                                  child: Text(
                                    _relPrice.toString(),
                                    style: TextStyle(
                                        fontSize: 19,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.green),
                                  ),
                                ),
                              ))
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
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        // crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
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
                            ],
                          ),
                          // SizedBox(
                          //   width: 30,
                          // ),
                          Align(
                              alignment: Alignment.centerRight,
                              child: Padding(
                                padding:
                                    const EdgeInsets.only(right: 8.0, left: 10),
                                child: SizedBox(
                                  height: 75,
                                  width: 75,
                                  child: Text(
                                    _infoPrice.toString(),
                                    style: TextStyle(
                                        fontSize: 19,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.green),
                                  ),
                                ),
                              ))
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
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        // crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
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
                            ],
                          ),
                          // SizedBox(
                          //   width: 30,
                          // ),
                          Align(
                              alignment: Alignment.centerRight,
                              child: Padding(
                                padding:
                                    const EdgeInsets.only(right: 8.0, left: 10),
                                child: SizedBox(
                                  height: 75,
                                  width: 75,
                                  child: Text(
                                    _axisPrice.toString(),
                                    style: TextStyle(
                                        fontSize: 19,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.green),
                                  ),
                                ),
                              ))
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
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        // crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
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
                            ],
                          ),
                          // SizedBox(
                          //   width: 30,
                          // ),
                          Align(
                              alignment: Alignment.centerRight,
                              child: Padding(
                                padding:
                                    const EdgeInsets.only(right: 8.0, left: 10),
                                child: SizedBox(
                                  height: 75,
                                  width: 75,
                                  child: Text(
                                    _ktkPrice.toString(),
                                    style: TextStyle(
                                        fontSize: 19,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.green),
                                  ),
                                ),
                              ))
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
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        // crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
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
                            ],
                          ),
                          // SizedBox(
                          //   width: 30,
                          // ),
                          Align(
                              alignment: Alignment.centerRight,
                              child: Padding(
                                padding:
                                    const EdgeInsets.only(right: 8.0, left: 10),
                                child: SizedBox(
                                  height: 75,
                                  width: 75,
                                  child: Text(
                                    _sbiPrice.toString(),
                                    style: TextStyle(
                                        fontSize: 19,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.green),
                                  ),
                                ),
                              ))
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
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        // crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
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
                            ],
                          ),
                          // SizedBox(
                          //   width: 30,
                          // ),
                          Align(
                              alignment: Alignment.centerRight,
                              child: Padding(
                                padding:
                                    const EdgeInsets.only(right: 8.0, left: 10),
                                child: SizedBox(
                                  height: 75,
                                  width: 75,
                                  child: Text(
                                    _tsPrice.toString(),
                                    style: TextStyle(
                                        fontSize: 19,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.green),
                                  ),
                                ),
                              ))
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
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          // crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
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
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                    Text(
                      coin['symbol'],
                      style: TextStyle(
                          fontSize: 12, color: Colors.black.withOpacity(0.5)),
                    ),
                  ],
                ),
              ],
            ),
            // SizedBox(
            //   width: 30,
            // ),
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
