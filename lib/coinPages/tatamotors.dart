import 'dart:ffi';
import 'dart:math';
import 'dart:async';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:finance_app/constraints.dart';
import 'package:finance_app/models/stockprices.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:syncfusion_flutter_charts/sparkcharts.dart';
import 'package:intl/intl.dart';

class TATAMOTORpage extends StatefulWidget {
  const TATAMOTORpage({super.key});

  @override
  State<TATAMOTORpage> createState() => _TATAMOTORpageState();
}

class _TATAMOTORpageState extends State<TATAMOTORpage> {
  late int _itcPrice = 0;
  late int _minP;
  late int _maxP;
  late int _prevClose;
  late int _currentPrice;
  late String percent;
  late Color _priceColor;
  late List<AxisChartData> _chartData;
  late TrackballBehavior _trackballBehavior;

  Future<DocumentSnapshot<Map<String, dynamic>>> _getaxisDocument() async {
    return FirebaseFirestore.instance
        .collection('prices')
        .doc('tatamotors')
        .get();
  }

  @override
  void initState() {
    super.initState();
    _priceColor = Colors.black;
    percent = '0';
    _chartData = getChartData();
    _trackballBehavior = TrackballBehavior(
        enable: true, activationMode: ActivationMode.singleTap);
    _getaxisDocument().then((snapshot) {
      final data = snapshot.data()!;
      _minP = data['minPriceday'] as int;
      _maxP = data['maxPriceday'] as int;
      _prevClose = data['prevClose'] as int;
      _currentPrice = data['price'] as int;
      _generateaxisPrice(_minP, _maxP);
      // stockpriceColor(_currentPrice, _prevClose);

      Timer timer = Timer.periodic(Duration(seconds: 2), (timer) {
        percentChange(_itcPrice, _prevClose);
      });
    });
  }

  // void stockpriceColor(int cprice, int pprice) {
  //   if (cprice > pprice) {
  //     _priceColor = Colors.green;
  //   } else {
  //     _priceColor = Colors.red;
  //   }
  // }

  void percentChange(int cprice, int pprice) {
    if (cprice > pprice) {
      percent = '+${cprice - pprice}';
      _priceColor = Colors.green;
    } else {
      percent = '-${cprice - pprice}';
      _priceColor = Colors.red;
    }
  }

  void _generateaxisPrice(int minRange, int maxRange) {
    FirebaseFirestore.instance
        .collection('prices')
        .doc('tatamotors')
        .update({'price': _itcPrice});

    _itcPrice = Random().nextInt(maxRange - minRange) + minRange;
    Timer.periodic(Duration(seconds: 3), (timer) {
      setState(() {
        _itcPrice = Random().nextInt(maxRange - minRange) + minRange;
        FirebaseFirestore.instance
            .collection('prices')
            .doc('tatamotors')
            .update({'price': _itcPrice});
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(),
        body: SingleChildScrollView(
            child: Column(children: [
          SizedBox(
            height: 10,
          ),
          Row(
            children: [
              Container(
                decoration:
                    BoxDecoration(borderRadius: BorderRadius.circular(20)),
                width: MediaQuery.of(context).size.width,
                height: 450,
                child: Card(
                    elevation: 0,
                    color: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(
                                height: 20,
                              ),
                              Row(
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
                                  Text(
                                    "Tata Motors",
                                    style: TextStyle(
                                        color: Colors.black, fontSize: 26),
                                  ),
                                ],
                              ),

                              Text(
                                "TAMO",
                                style: TextStyle(
                                    color: Colors.black.withOpacity(0.4),
                                    fontSize: 22),
                              ),
                              Row(
                                children: [
                                  Padding(
                                    padding:
                                        const EdgeInsets.fromLTRB(0, 0, 15, 0),
                                    child: Text(
                                      '₹$_itcPrice',
                                      style: TextStyle(
                                          color: Colors.black, fontSize: 45),
                                    ),
                                  ),
                                  Padding(
                                    padding:
                                        const EdgeInsets.fromLTRB(0, 0, 15, 0),
                                    child: Text(
                                      '(${percent.toString()})',
                                      style: TextStyle(
                                          color: _priceColor, fontSize: 30),
                                    ),
                                  )
                                ],
                              ),
                              SizedBox(
                                height: 20,
                              ),
                              // Padding(
                              //   padding: const EdgeInsets.all(8.0),
                              //   child: Image.asset(
                              //     'assets/images/graph.png',
                              //     width:
                              //         MediaQuery.of(context).size.width * 0.90,
                              //   ),
                              // ),
                              SizedBox(
                                height: 240,
                                child: SfCartesianChart(
                                    // title: ChartTitle(text: 'AAPL - 2016'),
                                    // legend: Legend(isVisible: true),
                                    trackballBehavior: _trackballBehavior,
                                    series: <CandleSeries>[
                                      CandleSeries<AxisChartData, DateTime>(
                                          dataSource: _chartData,
                                          name: 'AKBK',
                                          xValueMapper:
                                              (AxisChartData sales, _) =>
                                                  sales.x,
                                          lowValueMapper:
                                              (AxisChartData sales, _) =>
                                                  sales.low,
                                          highValueMapper:
                                              (AxisChartData sales, _) =>
                                                  sales.high,
                                          openValueMapper:
                                              (AxisChartData sales, _) =>
                                                  sales.open,
                                          closeValueMapper:
                                              (AxisChartData sales, _) =>
                                                  sales.close)
                                    ],
                                    primaryXAxis: DateTimeAxis(
                                        dateFormat: DateFormat.MMM(),
                                        majorGridLines:
                                            MajorGridLines(width: 0)),
                                    primaryYAxis: NumericAxis(
                                      minimum: 70,
                                      maximum: 130,
                                      interval: 10,
                                      // numberFormat: NumberFormat(
                                      //     decimalDigits: 0)),
                                    )),
                              )
                            ],
                          ),
                        ),
                      ],
                    )),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(25.0),
            child: Column(
              children: [
                SizedBox(
                  height: 175,
                  child: StreamBuilder<DocumentSnapshot>(
                    stream: FirebaseFirestore.instance
                        .collection('prices')
                        .doc('tatamotors')
                        .snapshots(),
                    builder: (context, snapshot) {
                      if (!snapshot.hasData) {
                        return CircularProgressIndicator();
                      }
                      Map<String, dynamic>? data =
                          snapshot.data!.data() as Map<String, dynamic>?;

                      String openPrice = data?['open']?.toString() ?? '';
                      String prevClosePrice =
                          data?['prevClose']?.toString() ?? '';
                      String volume = data?['volume']?.toString() ?? '';
                      String minpricewk = data?['minpricewk']?.toString() ?? '';
                      String minPriceday =
                          data?['minPriceday']?.toString() ?? '';
                      String maxpricewk = data?['maxpricewk']?.toString() ?? '';
                      String maxPriceday =
                          data?['maxPriceday']?.toString() ?? '';
                      String marketCap = data?['markCap']?.toString() ?? '';

                      return ListView(children: [
                        Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "Day's Range",
                                  style: TextStyle(
                                      color: Colors.black.withOpacity(0.5),
                                      fontSize: 20),
                                ),
                                // SizedBox(
                                //   width: 72,
                                // ),
                                Text(
                                  "${minPriceday} - ${maxPriceday}",
                                  style: TextStyle(
                                      color: Colors.black.withOpacity(0.7),
                                      fontSize: 20),
                                ),
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "52 week Range",
                                  style: TextStyle(
                                      color: Colors.black.withOpacity(0.5),
                                      fontSize: 20),
                                ),
                                // SizedBox(
                                //   width: 46,
                                // ),
                                Text(
                                  "${minpricewk} - ${maxpricewk}",
                                  style: TextStyle(
                                      color: Colors.black.withOpacity(0.7),
                                      fontSize: 20),
                                ),
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "Market Cap",
                                  style: TextStyle(
                                      color: Colors.black.withOpacity(0.5),
                                      fontSize: 20),
                                ),
                                // SizedBox(
                                //   width: 80,
                                // ),
                                Text(
                                  "${marketCap}",
                                  style: TextStyle(
                                      color: Colors.black.withOpacity(0.7),
                                      fontSize: 20),
                                ),
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "Volume",
                                  style: TextStyle(
                                      color: Colors.black.withOpacity(0.5),
                                      fontSize: 20),
                                ),
                                // SizedBox(
                                //   width: 120,
                                // ),
                                Text(
                                  // "17,513,884",
                                  '${volume}',
                                  style: TextStyle(
                                      color: Colors.black.withOpacity(0.7),
                                      fontSize: 20),
                                ),
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "Previous Close",
                                  style: TextStyle(
                                      color: Colors.black.withOpacity(0.5),
                                      fontSize: 20),
                                ),
                                // SizedBox(
                                //   width: 55,
                                // ),
                                Text(
                                  "$prevClosePrice",
                                  style: TextStyle(
                                      color: Colors.black.withOpacity(0.7),
                                      fontSize: 20),
                                ),
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "Open",
                                  style: TextStyle(
                                      color: Colors.black.withOpacity(0.5),
                                      fontSize: 20),
                                ),
                                // SizedBox(
                                //   width: 142,
                                // ),
                                Text(
                                  "$openPrice",
                                  style: TextStyle(
                                      color: Colors.black.withOpacity(0.7),
                                      fontSize: 20),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ]);
                    },
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Row(
                  children: [
                    SizedBox(
                      width: 180,
                      height: 60,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            padding: EdgeInsets.all(10),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(15)),
                            backgroundColor: Colors.green),
                        onPressed: () async {
                          buyBottomSheet(context);
                        },
                        child: Text(
                          "BUY",
                          style: TextStyle(fontSize: 20),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 4,
                    ),
                    SizedBox(
                      width: 180,
                      height: 60,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            padding: EdgeInsets.all(10),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(15)),
                            backgroundColor: Colors.red.withOpacity(0.9)),
                        onPressed: () async {
                          sellBottomSheet(context);
                        },
                        child: Text(
                          "SELL",
                          style: TextStyle(fontSize: 20),
                        ),
                      ),
                    )
                  ],
                ),
              ],
            ),
          ),
        ])));
  }

  List<AxisChartData> getChartData() {
    return <AxisChartData>[
      AxisChartData(
          x: DateTime(2016, 01, 11),
          open: 98.97,
          high: 101.19,
          low: 95.36,
          close: 97.13),
      AxisChartData(
          x: DateTime(2016, 01, 18),
          open: 98.41,
          high: 101.46,
          low: 93.42,
          close: 101.42),
      AxisChartData(
          x: DateTime(2016, 01, 25),
          open: 101.52,
          high: 101.53,
          low: 92.39,
          close: 97.34),
      AxisChartData(
          x: DateTime(2016, 02, 01),
          open: 96.47,
          high: 97.33,
          low: 93.69,
          close: 94.02),
      AxisChartData(
          x: DateTime(2016, 02, 08),
          open: 93.13,
          high: 96.35,
          low: 92.59,
          close: 93.99),
      AxisChartData(
          x: DateTime(2016, 02, 15),
          open: 91.02,
          high: 94.89,
          low: 90.61,
          close: 92.04),
      AxisChartData(
          x: DateTime(2016, 02, 22),
          open: 96.31,
          high: 98.0237,
          low: 98.0237,
          close: 96.31),
      AxisChartData(
          x: DateTime(2016, 02, 29),
          open: 99.86,
          high: 106.75,
          low: 99.65,
          close: 106.01),
      AxisChartData(
          x: DateTime(2016, 03, 07),
          open: 102.39,
          high: 102.83,
          low: 100.15,
          close: 102.26),
      AxisChartData(
          x: DateTime(2016, 03, 14),
          open: 101.91,
          high: 106.5,
          low: 101.78,
          close: 105.92),
      AxisChartData(
          x: DateTime(2016, 03, 21),
          open: 105.93,
          high: 107.65,
          low: 104.89,
          close: 105.67),
      AxisChartData(
          x: DateTime(2016, 03, 28),
          open: 106,
          high: 110.42,
          low: 104.88,
          close: 109.99),
      AxisChartData(
          x: DateTime(2016, 04, 04),
          open: 110.42,
          high: 112.19,
          low: 108.121,
          close: 108.66),
      AxisChartData(
          x: DateTime(2016, 04, 11),
          open: 108.97,
          high: 112.39,
          low: 108.66,
          close: 109.85),
      AxisChartData(
          x: DateTime(2016, 04, 18),
          open: 108.89,
          high: 108.95,
          low: 104.62,
          close: 105.68),
      AxisChartData(
          x: DateTime(2016, 04, 25),
          open: 105,
          high: 105.65,
          low: 92.51,
          close: 93.74),
      AxisChartData(
          x: DateTime(2016, 05, 02),
          open: 93.965,
          high: 95.9,
          low: 91.85,
          close: 92.72),
      AxisChartData(
          x: DateTime(2016, 05, 09),
          open: 93,
          high: 93.77,
          low: 89.47,
          close: 90.52),
      AxisChartData(
          x: DateTime(2016, 05, 16),
          open: 92.39,
          high: 95.43,
          low: 91.65,
          close: 95.22),
      AxisChartData(
          x: DateTime(2016, 05, 23),
          open: 95.87,
          high: 100.73,
          low: 95.67,
          close: 100.35),
      AxisChartData(
          x: DateTime(2016, 05, 30),
          open: 99.6,
          high: 100.4,
          low: 96.63,
          close: 97.92),
      AxisChartData(
          x: DateTime(2016, 06, 06),
          open: 97.99,
          high: 101.89,
          low: 97.55,
          close: 98.83),
      AxisChartData(
          x: DateTime(2016, 06, 13),
          open: 98.69,
          high: 99.12,
          low: 95.3,
          close: 95.33),
      AxisChartData(
          x: DateTime(2016, 06, 20),
          open: 96,
          high: 96.89,
          low: 92.65,
          close: 93.4),
      AxisChartData(
          x: DateTime(2016, 06, 27),
          open: 93,
          high: 96.465,
          low: 91.5,
          close: 95.89),
      AxisChartData(
          x: DateTime(2016, 07, 04),
          open: 95.39,
          high: 96.89,
          low: 94.37,
          close: 96.68),
      AxisChartData(
          x: DateTime(2016, 07, 11),
          open: 96.75,
          high: 99.3,
          low: 96.73,
          close: 98.78),
      AxisChartData(
          x: DateTime(2016, 07, 18),
          open: 98.7,
          high: 101,
          low: 98.31,
          close: 98.66),
      AxisChartData(
          x: DateTime(2016, 07, 25),
          open: 98.25,
          high: 104.55,
          low: 96.42,
          close: 104.21),
      AxisChartData(
          x: DateTime(2016, 08, 01),
          open: 104.41,
          high: 107.65,
          low: 104,
          close: 107.48),
      AxisChartData(
          x: DateTime(2016, 08, 08),
          open: 107.52,
          high: 108.94,
          low: 107.16,
          close: 108.18),
      AxisChartData(
          x: DateTime(2016, 08, 15),
          open: 108.14,
          high: 110.23,
          low: 108.08,
          close: 109.36),
      AxisChartData(
          x: DateTime(2016, 08, 22),
          open: 108.86,
          high: 109.32,
          low: 106.31,
          close: 106.94),
      AxisChartData(
          x: DateTime(2016, 08, 29),
          open: 106.62,
          high: 108,
          low: 105.5,
          close: 107.73),
      AxisChartData(
          x: DateTime(2016, 09, 05),
          open: 107.9,
          high: 108.76,
          low: 103.13,
          close: 103.13),
      AxisChartData(
          x: DateTime(2016, 09, 12),
          open: 102.65,
          high: 116.13,
          low: 102.53,
          close: 114.92),
      AxisChartData(
          x: DateTime(2016, 09, 19),
          open: 115.19,
          high: 116.18,
          low: 111.55,
          close: 112.71),
      AxisChartData(
          x: DateTime(2016, 09, 26),
          open: 111.64,
          high: 114.64,
          low: 111.55,
          close: 113.05),
      AxisChartData(
          x: DateTime(2016, 10, 03),
          open: 112.71,
          high: 114.56,
          low: 112.28,
          close: 114.06),
      AxisChartData(
          x: DateTime(2016, 10, 10),
          open: 115.02,
          high: 118.69,
          low: 114.72,
          close: 117.63),
      AxisChartData(
          x: DateTime(2016, 10, 17),
          open: 117.33,
          high: 118.21,
          low: 113.8,
          close: 116.6),
      AxisChartData(
          x: DateTime(2016, 10, 24),
          open: 117.1,
          high: 118.36,
          low: 113.31,
          close: 113.72),
      AxisChartData(
          x: DateTime(2016, 10, 31),
          open: 113.65,
          high: 114.23,
          low: 108.11,
          close: 108.84),
      AxisChartData(
          x: DateTime(2016, 11, 07),
          open: 110.08,
          high: 111.72,
          low: 105.83,
          close: 108.43),
      AxisChartData(
          x: DateTime(2016, 11, 14),
          open: 107.71,
          high: 110.54,
          low: 104.08,
          close: 110.06),
      AxisChartData(
          x: DateTime(2016, 11, 21),
          open: 114.12,
          high: 115.42,
          low: 115.42,
          close: 114.12),
      AxisChartData(
          x: DateTime(2016, 11, 28),
          open: 111.43,
          high: 112.465,
          low: 108.85,
          close: 109.9),
      AxisChartData(
          x: DateTime(2016, 12, 05),
          open: 110,
          high: 114.7,
          low: 108.25,
          close: 113.95),
      AxisChartData(
          x: DateTime(2016, 12, 12),
          open: 113.29,
          high: 116.73,
          low: 112.49,
          close: 115.97),
      AxisChartData(
          x: DateTime(2016, 12, 19),
          open: 115.8,
          high: 117.5,
          low: 115.59,
          close: 116.52),
      AxisChartData(
          x: DateTime(2016, 12, 26),
          open: 116.52,
          high: 118.0166,
          low: 115.43,
          close: 115.82),
    ];
  }
}

class AxisChartData {
  AxisChartData({
    this.x,
    this.open,
    this.close,
    this.low,
    this.high,
  });

  final DateTime? x;
  final num? open;
  final num? close;
  final num? low;
  final num? high;
}

void buyBottomSheet(context) {
  int ttmqty = 0;
  final quantityController = TextEditingController();

  showModalBottomSheet(
      context: context,
      builder: (BuildContext bc) {
        return Container(
            height: MediaQuery.of(context).size.height * .30,
            child: Column(
              children: [
                Row(
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
                    Text(
                      "Buy Tata Motors",
                      style: TextStyle(color: Colors.black, fontSize: 26),
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(20, 20, 20, 0),
                  child: TextFormField(
                    // Keyboard type declaration for @ button on keyboard.
                    keyboardType: TextInputType.number,
                    style: TextStyle(color: Colors.black),
                    // Text Controller for email.
                    controller: quantityController,
                    decoration: InputDecoration(
                        // Label on Email input Dialog Box
                        labelText: "Enter Quantity",
                        floatingLabelBehavior: FloatingLabelBehavior.always,
                        suffixIcon: Padding(
                          padding: EdgeInsets.fromLTRB(0, 20, 20, 20),
                        ),
                        contentPadding:
                            EdgeInsets.symmetric(horizontal: 42, vertical: 20),
                        labelStyle: TextStyle(color: Colors.black),
                        hintText: "Quantity",
                        hintStyle: TextStyle(color: Colors.black),
                        enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(28),
                            borderSide: BorderSide(color: kTextColor),
                            gapPadding: 10),
                        focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(28),
                            borderSide: BorderSide(color: kTextColor),
                            gapPadding: 10)),
                  ),
                ),
                SizedBox(
                  height: 25,
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.85,
                  height: 60,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        padding: EdgeInsets.all(10),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15)),
                        backgroundColor: Colors.green.withOpacity(0.9)),
                    onPressed: () async {
                      ttmqty = int.parse(quantityController.text);
                      TtmQ.setInt(TtmQ.ttmqty + ttmqty);
                      quantityController.clear();
                      Navigator.pop(context);
                      ScaffoldMessenger.of(context).showSnackBar(snackBar);
                    },
                    child: Text(
                      "BUY",
                      style: TextStyle(fontSize: 20),
                    ),
                  ),
                )
              ],
            ));
      });
}

void sellBottomSheet(context) {
  int ttmqty = 0;
  final quantityController = TextEditingController();
  showModalBottomSheet(
      context: context,
      builder: (BuildContext bc) {
        return Container(
            height: MediaQuery.of(context).size.height * .30,
            child: Column(
              children: [
                Row(
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
                    Text(
                      "Sell Tata Motors",
                      style: TextStyle(color: Colors.black, fontSize: 26),
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(20, 20, 20, 0),
                  child: TextFormField(
                    // Keyboard type declaration for @ button on keyboard.
                    keyboardType: TextInputType.number,
                    style: TextStyle(color: Colors.black),
                    // Text Controller for email.
                    controller: quantityController,
                    decoration: InputDecoration(
                        // Label on Email input Dialog Box
                        labelText: "Enter Quantity",
                        floatingLabelBehavior: FloatingLabelBehavior.always,
                        suffixIcon: Padding(
                          padding: EdgeInsets.fromLTRB(0, 20, 20, 20),
                        ),
                        contentPadding:
                            EdgeInsets.symmetric(horizontal: 42, vertical: 20),
                        labelStyle: TextStyle(color: Colors.black),
                        hintText: "Quantity",
                        hintStyle: TextStyle(color: Colors.black),
                        enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(28),
                            borderSide: BorderSide(color: kTextColor),
                            gapPadding: 10),
                        focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(28),
                            borderSide: BorderSide(color: kTextColor),
                            gapPadding: 10)),
                  ),
                ),
                SizedBox(
                  height: 25,
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.85,
                  height: 60,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        padding: EdgeInsets.all(10),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15)),
                        backgroundColor: Colors.red.withOpacity(0.9)),
                    onPressed: () async {
                      ttmqty = int.parse(quantityController.text);
                      if (TtmQ.getInt() >= ttmqty) {
                        TtmQ.setInt(TtmQ.ttmqty - ttmqty);
                        quantityController.clear();
                        Navigator.pop(context);
                        ScaffoldMessenger.of(context).showSnackBar(snackBar);
                      } else {
                        quantityController.clear();
                        Navigator.pop(context);
                        ScaffoldMessenger.of(context)
                            .showSnackBar(snackBarFail);
                      }
                    },
                    child: Text(
                      "SELL",
                      style: TextStyle(fontSize: 20),
                    ),
                  ),
                )
              ],
            ));
      });
}

final snackBar = SnackBar(
  content: Text(
    'Order Successful',
    style: TextStyle(color: Colors.white),
  ),
);
final snackBarFail = SnackBar(
  content: Text(
    'Order Failed',
    style: TextStyle(color: Colors.white),
  ),
);

class TtmQ {
  static int ttmqty = 0;

  static void setInt(int newValue) {
    ttmqty = newValue;
  }

  static int getInt() {
    return ttmqty;
  }
}
