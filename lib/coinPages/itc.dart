import 'dart:ffi';
import 'dart:math';
import 'dart:async';
import 'package:finance_app/constraints.dart';
import 'package:finance_app/models/stockprices.dart';
import 'package:flutter/material.dart';

class ITCpage extends StatefulWidget {
  const ITCpage({super.key});

  @override
  State<ITCpage> createState() => _ITCpageState();
}

class _ITCpageState extends State<ITCpage> {
  late int _itcPrice = 0;
  late int itcP = 0;
  int minP = 421;
  int maxP = 427;
  @override
  void initState() {
    super.initState();
    _generateItcPrice(minP, maxP);
  }



  void _generateItcPrice(int minRange, int maxRange) {
    _itcPrice = Random().nextInt(maxRange - minRange) + minRange;
    Timer.periodic(Duration(seconds: 3), (timer) {
      setState(() {
        _itcPrice = Random().nextInt(maxRange - minRange) + minRange;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    itcP = _itcPrice;
    return Scaffold(
        appBar: AppBar(),
        body: SingleChildScrollView(
            child: Column(children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(15, 10, 350, 8),
            child: Column(
              children: [
                Text(
                  "ITC",
                  style: TextStyle(color: Colors.black, fontSize: 26),
                ),
                Text(
                  "ITC",
                  style: TextStyle(
                      color: Colors.black.withOpacity(0.4), fontSize: 22),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 15.0),
                child: Container(
                  decoration:
                      BoxDecoration(borderRadius: BorderRadius.circular(20)),
                  width: 150,
                  child: Card(
                    elevation: 6,
                    color: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(15, 0, 15, 0),
                      child: Text(
                        '₹$_itcPrice',
                        style: TextStyle(color: kPrimaryColor, fontSize: 45),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
          SizedBox(
            height: 20,
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Image.asset(
              'assets/images/graph.png',
              width: MediaQuery.of(context).size.width * 0.90,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(25.0),
            child: Column(
              children: [
                Row(
                  children: [
                    Text(
                      "Day's Range",
                      style: TextStyle(
                          color: Colors.black.withOpacity(0.5), fontSize: 20),
                    ),
                    SizedBox(
                      width: 72,
                    ),
                    Text(
                      "$minP - $maxP",
                      style: TextStyle(
                          color: Colors.black.withOpacity(0.7), fontSize: 20),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Text(
                      "52 week Range",
                      style: TextStyle(
                          color: Colors.black.withOpacity(0.5), fontSize: 20),
                    ),
                    SizedBox(
                      width: 46,
                    ),
                    Text(
                      "249.15 - 428.25",
                      style: TextStyle(
                          color: Colors.black.withOpacity(0.7), fontSize: 20),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Text(
                      "Market Cap",
                      style: TextStyle(
                          color: Colors.black.withOpacity(0.5), fontSize: 20),
                    ),
                    SizedBox(
                      width: 80,
                    ),
                    Text(
                      "5.28 T",
                      style: TextStyle(
                          color: Colors.black.withOpacity(0.7), fontSize: 20),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Text(
                      "Volume",
                      style: TextStyle(
                          color: Colors.black.withOpacity(0.5), fontSize: 20),
                    ),
                    SizedBox(
                      width: 120,
                    ),
                    Text(
                      "10,250,709",
                      style: TextStyle(
                          color: Colors.black.withOpacity(0.7), fontSize: 20),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Text(
                      "Previous Close",
                      style: TextStyle(
                          color: Colors.black.withOpacity(0.5), fontSize: 20),
                    ),
                    SizedBox(
                      width: 55,
                    ),
                    Text(
                      "425.55",
                      style: TextStyle(
                          color: Colors.black.withOpacity(0.7), fontSize: 20),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Text(
                      "Open",
                      style: TextStyle(
                          color: Colors.black.withOpacity(0.5), fontSize: 20),
                    ),
                    SizedBox(
                      width: 142,
                    ),
                    Text(
                      "426.00",
                      style: TextStyle(
                          color: Colors.black.withOpacity(0.7), fontSize: 20),
                    ),
                  ],
                ),
                SizedBox(
                  height: 50,
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width,
                  height: 60,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        padding: EdgeInsets.all(10),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(28)),
                        backgroundColor: Colors.green),
                    onPressed: () async {},
                    child: Text(
                      "BUY",
                      style: TextStyle(fontSize: 20),
                    ),
                  ),
                ),
                SizedBox(
                  height: 15,
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width,
                  height: 60,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        padding: EdgeInsets.all(10),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(28)),
                        backgroundColor: Colors.red.withOpacity(0.9)),
                    onPressed: () async {},
                    child: Text(
                      "SELL",
                      style: TextStyle(fontSize: 20),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ])));
  }
}
