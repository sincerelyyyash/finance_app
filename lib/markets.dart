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
import 'package:finance_app/flutterfire.dart';
import 'package:finance_app/screens/colorcode.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'coinPages/first.dart';
import 'coinPages/maruti.dart';
import 'constraints.dart';
import 'models/controller.dart';

class Markets extends StatefulWidget {
  const Markets({super.key});

  @override
  State<Markets> createState() => _MarketsState();
}

class _MarketsState extends State<Markets> {
  final PriceController priceController = Get.put(PriceController());
  final HDFCOController hdfcoController = Get.put(HDFCOController());
  final HDFCController hdfcController = Get.put(HDFCController());
  final ICICIController iciciController = Get.put(ICICIController());
  final RELController relController = Get.put(RELController());
  final INFOController infoController = Get.put(INFOController());
  final AXISController axisController = Get.put(AXISController());
  final KTKController ktkController = Get.put(KTKController());
  final SBIController sbiController = Get.put(SBIController());
  final MRTIController mrtiController = Get.put(MRTIController());
  final TCSController tcsController = Get.put(TCSController());
  final ADANIController adaniController = Get.put(ADANIController());
  final TSController tsController = Get.put(TSController());
  final TECMController tecmController = Get.put(TECMController());
  final TTMController ttmController = Get.put(TTMController());

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
      priceController.generateItcPrice(_minPitc, _maxPitc);
    });
    _gethdfcDocument().then((snapshot) {
      final data = snapshot.data()!;
      _minPhdfc = data['minPriceday'] as int;
      _maxPhdfc = data['maxPriceday'] as int;
      hdfcController.generatehdfcPrice(_minPhdfc, _maxPhdfc);
    });
    _geticiciDocument().then((snapshot) {
      final data = snapshot.data()!;
      _minPicici = data['minPriceday'] as int;
      _maxPicici = data['maxPriceday'] as int;
      iciciController.generateiciciPrice(_minPicici, _maxPicici);
    });
    _gethdfcoDocument().then((snapshot) {
      final data = snapshot.data()!;
      _minPhdfco = data['minPriceday'] as int;
      _maxPhdfco = data['maxPriceday'] as int;
      hdfcoController.generatehdfcoPrice(_minPhdfco, _maxPhdfco);
    });
    _getrelDocument().then((snapshot) {
      final data = snapshot.data()!;
      _minPrel = data['minPriceday'] as int;
      _maxPrel = data['maxPriceday'] as int;
      relController.generaterelPrice(_minPrel, _maxPrel);
    });
    _getinfoDocument().then((snapshot) {
      final data = snapshot.data()!;
      _minPinfo = data['minPriceday'] as int;
      _maxPinfo = data['maxPriceday'] as int;
      infoController.generateinfoPrice(_minPinfo, _maxPinfo);
    });
    _getaxisDocument().then((snapshot) {
      final data = snapshot.data()!;
      _minPaxis = data['minPriceday'] as int;
      _maxPaxis = data['maxPriceday'] as int;
      axisController.generateaxisPrice(_minPaxis, _maxPaxis);
    });
    _getktkDocument().then((snapshot) {
      final data = snapshot.data()!;
      _minPktk = data['minPriceday'] as int;
      _maxPktk = data['maxPriceday'] as int;
      ktkController.generatektkPrice(_minPktk, _maxPktk);
    });
    _getsbiDocument().then((snapshot) {
      final data = snapshot.data()!;
      _minPsbi = data['minPriceday'] as int;
      _maxPsbi = data['maxPriceday'] as int;
      sbiController.generatesbiPrice(_minPsbi, _maxPsbi);
    });
    _getmrtiDocument().then((snapshot) {
      final data = snapshot.data()!;
      _minPmrti = data['minPriceday'] as int;
      _maxPmrti = data['maxPriceday'] as int;
      mrtiController.generatemrtiPrice(_minPmrti, _maxPmrti);
    });
    _gettcsDocument().then((snapshot) {
      final data = snapshot.data()!;
      _minPtcs = data['minPriceday'] as int;
      _maxPtcs = data['maxPriceday'] as int;
      tcsController.generatetcsPrice(_minPtcs, _maxPtcs);
    });
    _getadaniDocument().then((snapshot) {
      final data = snapshot.data()!;
      _minPadani = data['minPriceday'] as int;
      _maxPadani = data['maxPriceday'] as int;
      adaniController.generateadaniPrice(_minPadani, _maxPadani);
    });
    _gettsDocument().then((snapshot) {
      final data = snapshot.data()!;
      _minPts = data['minPriceday'] as int;
      _maxPts = data['maxPriceday'] as int;
      tsController.generatetsPrice(_minPts, _maxPts);
    });
    _gettecmDocument().then((snapshot) {
      final data = snapshot.data()!;
      _minPtecm = data['minPriceday'] as int;
      _maxPtecm = data['maxPriceday'] as int;
      tecmController.generatetecmPrice(_minPtecm, _maxPtecm);
    });
    _getttmDocument().then((snapshot) {
      final data = snapshot.data()!;
      _minPttm = data['minPriceday'] as int;
      _maxPttm = data['maxPriceday'] as int;
      ttmController.generatettmPrice(_minPttm, _maxPttm);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
            child: Column(
      children: [
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
                //   height: 0,
                //   width: double.infinity,
                // ),
              ],
            ),
            Container(
                height: 300,
                width: double.infinity,
                child: Center(
                  child: Padding(
                    padding: const EdgeInsets.all(2.0),
                    child: SizedBox(
                      height: 100,
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
                                SizedBox(
                                  height:
                                      MediaQuery.of(context).size.height / 100,
                                ),
                                Text(
                                  "Indian Markets",
                                  style: TextStyle(
                                      color: Colors.black, fontSize: 25),
                                ),
                              ]),
                        ),
                      ),
                    ),
                  ),
                )),
          ],
        ),
        Padding(
          padding: const EdgeInsets.only(left: 10.0),
          child: Column(children: [
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
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
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
                                            color:
                                                Colors.black.withOpacity(0.5)),
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
                                    padding: const EdgeInsets.only(
                                        right: 8.0, left: 10),
                                    child: SizedBox(
                                      height: 75,
                                      width: 75,
                                      child: Text(
                                        "${priceController.itcPrice}",
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
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
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
                                            color:
                                                Colors.black.withOpacity(0.5)),
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
                                    padding: const EdgeInsets.only(
                                        right: 8.0, left: 10),
                                    child: SizedBox(
                                      height: 75,
                                      width: 75,
                                      child: Text(
                                        '${hdfcController.hdfcPrice}',
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
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
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
                                            color:
                                                Colors.black.withOpacity(0.5)),
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
                                    padding: const EdgeInsets.only(
                                        right: 8.0, left: 10),
                                    child: SizedBox(
                                      height: 75,
                                      width: 75,
                                      child: Text(
                                        '${iciciController.iciciPrice}',
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
                  MaterialPageRoute(builder: (context) => HDFCOpage()),
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
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
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
                                            color:
                                                Colors.black.withOpacity(0.5)),
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
                                    padding: const EdgeInsets.only(
                                        right: 8.0, left: 10),
                                    child: SizedBox(
                                      height: 75,
                                      width: 75,
                                      child: Text(
                                        '${hdfcoController.hdfcoPrice}',
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
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
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
                                            color:
                                                Colors.black.withOpacity(0.5)),
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
                                    padding: const EdgeInsets.only(
                                        right: 8.0, left: 10),
                                    child: SizedBox(
                                      height: 75,
                                      width: 75,
                                      child: Text(
                                        '${relController.relPrice}',
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
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
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
                                            color:
                                                Colors.black.withOpacity(0.5)),
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
                                    padding: const EdgeInsets.only(
                                        right: 8.0, left: 10),
                                    child: SizedBox(
                                      height: 75,
                                      width: 75,
                                      child: Text(
                                        '${infoController.infoPrice}',
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
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
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
                                            color:
                                                Colors.black.withOpacity(0.5)),
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
                                    padding: const EdgeInsets.only(
                                        right: 8.0, left: 10),
                                    child: SizedBox(
                                      height: 75,
                                      width: 75,
                                      child: Text(
                                        '${axisController.axisPrice}',
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
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
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
                                            color:
                                                Colors.black.withOpacity(0.5)),
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
                                    padding: const EdgeInsets.only(
                                        right: 8.0, left: 10),
                                    child: SizedBox(
                                      height: 75,
                                      width: 75,
                                      child: Text(
                                        '${ktkController.ktkPrice}',
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
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
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
                                            color:
                                                Colors.black.withOpacity(0.5)),
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
                                    padding: const EdgeInsets.only(
                                        right: 8.0, left: 10),
                                    child: SizedBox(
                                      height: 75,
                                      width: 75,
                                      child: Text(
                                        '${sbiController.sbiPrice}',
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
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
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
                                            color:
                                                Colors.black.withOpacity(0.5)),
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
                                    padding: const EdgeInsets.only(
                                        right: 8.0, left: 10),
                                    child: SizedBox(
                                      height: 75,
                                      width: 75,
                                      child: Text(
                                        '${mrtiController.mrtiPrice}',
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
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
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
                                            color:
                                                Colors.black.withOpacity(0.5)),
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
                                    padding: const EdgeInsets.only(
                                        right: 8.0, left: 10),
                                    child: SizedBox(
                                      height: 75,
                                      width: 75,
                                      child: Text(
                                        '${tcsController.tcsPrice}',
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
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
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
                                            color:
                                                Colors.black.withOpacity(0.5)),
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
                                    padding: const EdgeInsets.only(
                                        right: 8.0, left: 10),
                                    child: SizedBox(
                                      height: 75,
                                      width: 75,
                                      child: Text(
                                        '${adaniController.adaniPrice}',
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
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
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
                                            color:
                                                Colors.black.withOpacity(0.5)),
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
                                    padding: const EdgeInsets.only(
                                        right: 8.0, left: 10),
                                    child: SizedBox(
                                      height: 75,
                                      width: 75,
                                      child: Text(
                                        '${tsController.tsPrice}',
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
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
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
                                            color:
                                                Colors.black.withOpacity(0.5)),
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
                                    padding: const EdgeInsets.only(
                                        right: 8.0, left: 10),
                                    child: SizedBox(
                                      height: 75,
                                      width: 75,
                                      child: Text(
                                        '${tecmController.tecmPrice}',
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
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
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
                                            color:
                                                Colors.black.withOpacity(0.5)),
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
                                    padding: const EdgeInsets.only(
                                        right: 8.0, left: 10),
                                    child: SizedBox(
                                      height: 75,
                                      width: 75,
                                      child: Text(
                                        '${ttmController.ttmPrice}',
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
          ]),
        ),
      ],
    )));
  }
}
