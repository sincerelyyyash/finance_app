import 'dart:async';
import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:finance_app/coinPages/adani.dart';
import 'package:finance_app/coinPages/axisbank.dart';
import 'package:finance_app/coinPages/hdfc.dart';
import 'package:finance_app/coinPages/hdfcbank.dart';
import 'package:finance_app/coinPages/icicibank.dart';
import 'package:finance_app/coinPages/infosys.dart';
import 'package:finance_app/coinPages/itc.dart';
import 'package:finance_app/coinPages/kotak.dart';
import 'package:finance_app/coinPages/reliance.dart';
import 'package:finance_app/coinPages/sbi.dart';
import 'package:finance_app/coinPages/tatamotors.dart';
import 'package:finance_app/coinPages/tatasteel.dart';
import 'package:finance_app/coinPages/tcs.dart';
import 'package:finance_app/coinPages/techmahindra.dart';
import 'package:finance_app/screens/colorcode.dart';
import 'package:flutter/material.dart';

import 'coinPages/first.dart';
import 'coinPages/maruti.dart';
import 'constraints.dart';

class Markets extends StatefulWidget {
  const Markets({super.key});

  @override
  State<Markets> createState() => _MarketsState();
}

class _MarketsState extends State<Markets> {
  late int _itcPrice = 0;
  late int _minPitc;
  late int _maxPitc;

  late int _hdfcPrice = 0;
  late int _minPhdfc;
  late int _maxPhdfc;

  late int _iciciPrice = 0;
  late int _minPicici;
  late int _maxPicici;

  late int _hdfcoPrice = 0;
  late int _minPhdfco;
  late int _maxPhdfco;

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

  late int _mrtiPrice = 0;
  late int _minPmrti;
  late int _maxPmrti;

  late int _tcsPrice = 0;
  late int _minPtcs;
  late int _maxPtcs;

  late int _adaniPrice = 0;
  late int _minPadani;
  late int _maxPadani;

  late int _tsPrice = 0;
  late int _minPts;
  late int _maxPts;

  late int _tecmPrice = 0;
  late int _minPtecm;
  late int _maxPtecm;

  late int _ttmPrice = 0;
  late int _minPttm;
  late int _maxPttm;

  Future<DocumentSnapshot<Map<String, dynamic>>> _getitcDocument() async {
    return FirebaseFirestore.instance.collection('prices').doc('itc').get();
  }

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

  Future<DocumentSnapshot<Map<String, dynamic>>> _gethdfcoDocument() async {
    return FirebaseFirestore.instance.collection('prices').doc('hdfc').get();
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

  Future<DocumentSnapshot<Map<String, dynamic>>> _getmrtiDocument() async {
    return FirebaseFirestore.instance.collection('prices').doc('maruti').get();
  }

  Future<DocumentSnapshot<Map<String, dynamic>>> _gettcsDocument() async {
    return FirebaseFirestore.instance.collection('prices').doc('tcs').get();
  }

  Future<DocumentSnapshot<Map<String, dynamic>>> _getadaniDocument() async {
    return FirebaseFirestore.instance.collection('prices').doc('adani').get();
  }

  Future<DocumentSnapshot<Map<String, dynamic>>> _gettsDocument() async {
    return FirebaseFirestore.instance
        .collection('prices')
        .doc('tatasteel')
        .get();
  }

  Future<DocumentSnapshot<Map<String, dynamic>>> _gettecmDocument() async {
    return FirebaseFirestore.instance
        .collection('prices')
        .doc('techmahindra')
        .get();
  }

  Future<DocumentSnapshot<Map<String, dynamic>>> _getttmDocument() async {
    return FirebaseFirestore.instance
        .collection('prices')
        .doc('tatamotors')
        .get();
  }

  @override
  void initState() {
    super.initState();

    _getitcDocument().then((snapshot) {
      final data = snapshot.data()!;
      _minPitc = data['minPriceday'] as int;
      _maxPitc = data['maxPriceday'] as int;
      _generateitcPrice(_minPitc, _maxPitc);
    });
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
    _gethdfcoDocument().then((snapshot) {
      final data = snapshot.data()!;
      _minPhdfco = data['minPriceday'] as int;
      _maxPhdfco = data['maxPriceday'] as int;
      _generatehdfcoPrice(_minPhdfco, _maxPhdfco);
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
    _getmrtiDocument().then((snapshot) {
      final data = snapshot.data()!;
      _minPmrti = data['minPriceday'] as int;
      _maxPmrti = data['maxPriceday'] as int;
      _generatemrtiPrice(_minPmrti, _maxPmrti);
    });
    _gettcsDocument().then((snapshot) {
      final data = snapshot.data()!;
      _minPtcs = data['minPriceday'] as int;
      _maxPtcs = data['maxPriceday'] as int;
      _generatetcsPrice(_minPtcs, _maxPtcs);
    });
    _getadaniDocument().then((snapshot) {
      final data = snapshot.data()!;
      _minPadani = data['minPriceday'] as int;
      _maxPadani = data['maxPriceday'] as int;
      _generateadaniPrice(_minPadani, _maxPadani);
    });
    _gettsDocument().then((snapshot) {
      final data = snapshot.data()!;
      _minPts = data['minPriceday'] as int;
      _maxPts = data['maxPriceday'] as int;
      _generatetsPrice(_minPts, _maxPts);
    });
    _gettecmDocument().then((snapshot) {
      final data = snapshot.data()!;
      _minPtecm = data['minPriceday'] as int;
      _maxPtecm = data['maxPriceday'] as int;
      _generatetecmPrice(_minPtecm, _maxPtecm);
    });
    _getttmDocument().then((snapshot) {
      final data = snapshot.data()!;
      _minPttm = data['minPriceday'] as int;
      _maxPttm = data['maxPriceday'] as int;
      _generatettmPrice(_minPttm, _maxPttm);
    });
  }

  void _generateitcPrice(int minRange, int maxRange) {
    FirebaseFirestore.instance
        .collection('prices')
        .doc('itc')
        .update({'price': _itcPrice});

    _itcPrice = Random().nextInt(maxRange - minRange) + minRange;
    Timer.periodic(Duration(seconds: 3), (timer) {
      setState(() {
        _itcPrice = Random().nextInt(maxRange - minRange) + minRange;
        FirebaseFirestore.instance
            .collection('prices')
            .doc('itc')
            .update({'price': _itcPrice});
      });
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

  void _generatehdfcoPrice(int minRange, int maxRange) {
    FirebaseFirestore.instance
        .collection('prices')
        .doc('hdfc')
        .update({'price': _hdfcoPrice});

    _hdfcoPrice = Random().nextInt(maxRange - minRange) + minRange;
    Timer.periodic(Duration(seconds: 3), (timer) {
      setState(() {
        _hdfcoPrice = Random().nextInt(maxRange - minRange) + minRange;
        FirebaseFirestore.instance
            .collection('prices')
            .doc('hdfc')
            .update({'price': _hdfcoPrice});
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

  void _generatemrtiPrice(int minRange, int maxRange) {
    FirebaseFirestore.instance
        .collection('prices')
        .doc('maruti')
        .update({'price': _mrtiPrice});

    _mrtiPrice = Random().nextInt(maxRange - minRange) + minRange;
    Timer.periodic(Duration(seconds: 3), (timer) {
      setState(() {
        _mrtiPrice = Random().nextInt(maxRange - minRange) + minRange;
        FirebaseFirestore.instance
            .collection('prices')
            .doc('maruti')
            .update({'price': _mrtiPrice});
      });
    });
  }

  void _generatetcsPrice(int minRange, int maxRange) {
    FirebaseFirestore.instance
        .collection('prices')
        .doc('tcs')
        .update({'price': _tcsPrice});

    _tcsPrice = Random().nextInt(maxRange - minRange) + minRange;
    Timer.periodic(Duration(seconds: 3), (timer) {
      setState(() {
        _tcsPrice = Random().nextInt(maxRange - minRange) + minRange;
        FirebaseFirestore.instance
            .collection('prices')
            .doc('tcs')
            .update({'price': _tcsPrice});
      });
    });
  }

  void _generateadaniPrice(int minRange, int maxRange) {
    FirebaseFirestore.instance
        .collection('prices')
        .doc('adani')
        .update({'price': _adaniPrice});

    _adaniPrice = Random().nextInt(maxRange - minRange) + minRange;
    Timer.periodic(Duration(seconds: 3), (timer) {
      setState(() {
        _adaniPrice = Random().nextInt(maxRange - minRange) + minRange;
        FirebaseFirestore.instance
            .collection('prices')
            .doc('adani')
            .update({'price': _adaniPrice});
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

  void _generatetecmPrice(int minRange, int maxRange) {
    FirebaseFirestore.instance
        .collection('prices')
        .doc('techmahindra')
        .update({'price': _tecmPrice});

    _tecmPrice = Random().nextInt(maxRange - minRange) + minRange;
    Timer.periodic(Duration(seconds: 3), (timer) {
      setState(() {
        _tecmPrice = Random().nextInt(maxRange - minRange) + minRange;
        FirebaseFirestore.instance
            .collection('prices')
            .doc('techmahindra')
            .update({'price': _tecmPrice});
      });
    });
  }

  void _generatettmPrice(int minRange, int maxRange) {
    FirebaseFirestore.instance
        .collection('prices')
        .doc('tatamotors')
        .update({'price': _ttmPrice});

    _ttmPrice = Random().nextInt(maxRange - minRange) + minRange;
    Timer.periodic(Duration(seconds: 3), (timer) {
      setState(() {
        _ttmPrice = Random().nextInt(maxRange - minRange) + minRange;
        FirebaseFirestore.instance
            .collection('prices')
            .doc('tatamotors')
            .update({'price': _ttmPrice});
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
              // Container(
              //   decoration: BoxDecoration(
              //       color: AppUIColor.lightbackgroundColor,
              //       borderRadius: BorderRadius.only(
              //           topRight: Radius.circular(60),
              //           topLeft: Radius.circular(60))),
              //   height: 150,
              //   width: double.infinity,
              // ),
            ],
          ),
          Container(
            height: 180,
            width: double.infinity,
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    height: 100,
                  ),
                  SizedBox(
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
                              // SizedBox(
                              //   height:
                              //       MediaQuery.of(context).size.height / 100,
                              // ),
                              Container(
                                width: MediaQuery.of(context).size.width / 3,
                                child: FittedBox(
                                  child: Text(
                                    "Indian Markets",
                                    style: TextStyle(
                                        color: Colors.black, fontSize: 45),
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
      //   padding: const EdgeInsets.fromLTRB(15, 10, 200, 8),
      //   child: Text(
      //     "Indian Markets",
      //     style: TextStyle(color: Colors.black, fontSize: 22),
      //   ),
      // ),
      // SizedBox(
      //   height: 15,
      // ),
      GestureDetector(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => ITCpage()),
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
                                        'https://static.theprint.in/wp-content/uploads/2023/01/ANI-20230127070054.jpg'),
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
                                  'ITC',
                                  style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold),
                                ),
                                Text(
                                  'ITC',
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
                                  _itcPrice.toString(),
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
            MaterialPageRoute(builder: (context) => const HDFCOpage()),
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
                                        'https://companieslogo.com/img/orig/HDB-bb6241fe.png?t=1633497370'),
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
                                  'HDFC',
                                  style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold),
                                ),
                                Text(
                                  'HDFC',
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
                                  _hdfcoPrice.toString(),
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
            MaterialPageRoute(builder: (context) => const KOTAKpage()),
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
            MaterialPageRoute(builder: (context) => MARUTIpage()),
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
                                        'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTUeG9RSAHORcyJJFR7SiQbTTnUmXRX0p9IaQ2cW3_dvA&usqp=CAU&ec=48665701'),
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
                                  'Maruti Suzuki',
                                  style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold),
                                ),
                                Text(
                                  'MRTI',
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
                                  _mrtiPrice.toString(),
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
            MaterialPageRoute(builder: (context) => TCSpage()),
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
                                        'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQxJfT7hvqjSTSUth09JobIkZP6lg-DXPNH4yqompblow2YDzLeNinVRuiG_tNB7kzkCp59xlY1WNc&usqp=CAU&ec=48665701'),
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
                                  'TCS',
                                  style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold),
                                ),
                                Text(
                                  'TCS',
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
                                  _tcsPrice.toString(),
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
            MaterialPageRoute(builder: (context) => ADANIpage()),
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
                                        'https://media.licdn.com/dms/image/C4D0BAQHWfWqyjHfUdw/company-logo_200_200/0/1627997105708?e=2147483647&v=beta&t=fBOyVHX5QyetBnFlcDk8ivhy0NwxP9BOskdQBHGJ8kw'),
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
                                  'Adani Enterprises',
                                  style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold),
                                ),
                                Text(
                                  'ADEL',
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
                                  _adaniPrice.toString(),
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
      GestureDetector(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => TECHMpage()),
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
                                        'https://download.logo.wine/logo/Tech_Mahindra/Tech_Mahindra-Logo.wine.png'),
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
                                  'Tech Mahindra',
                                  style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold),
                                ),
                                Text(
                                  'TEML',
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
                                  _tecmPrice.toString(),
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
            MaterialPageRoute(builder: (context) => TATAMOTORpage()),
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
                                        'https://w7.pngwing.com/pngs/1018/823/png-transparent-tata-motors-logo-car-tamo-racemo-philippines-car-blue-text-logo.png'),
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
                                  'Tata Motors',
                                  style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold),
                                ),
                                Text(
                                  'TAMO',
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
                                  _ttmPrice.toString(),
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
    ])));
  }
}
