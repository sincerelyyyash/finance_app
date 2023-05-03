import 'package:finance_app/coinPages/itc.dart';
import 'package:flutter/material.dart';

import 'coinPages/first.dart';

class Markets extends StatefulWidget {
  const Markets({super.key});

  @override
  State<Markets> createState() => _MarketsState();
}

class _MarketsState extends State<Markets> {
  late int itcP = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(),
        body: SingleChildScrollView(
            child: Column(children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(15, 10, 200, 8),
            child: Text(
              "Indian Markets",
              style: TextStyle(color: Colors.black, fontSize: 22),
            ),
          ),
          SizedBox(
            height: 15,
          ),
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
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      '$itcP',
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
                MaterialPageRoute(builder: (context) => FirstCoin()),
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
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
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
                MaterialPageRoute(builder: (context) => FirstCoin()),
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
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
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
                MaterialPageRoute(builder: (context) => FirstCoin()),
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
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
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
                MaterialPageRoute(builder: (context) => FirstCoin()),
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
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
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
                MaterialPageRoute(builder: (context) => FirstCoin()),
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
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
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
                MaterialPageRoute(builder: (context) => FirstCoin()),
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
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
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
                MaterialPageRoute(builder: (context) => FirstCoin()),
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
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
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
                MaterialPageRoute(builder: (context) => FirstCoin()),
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
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
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
                MaterialPageRoute(builder: (context) => FirstCoin()),
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
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
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
                MaterialPageRoute(builder: (context) => FirstCoin()),
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
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
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
                MaterialPageRoute(builder: (context) => FirstCoin()),
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
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
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
                MaterialPageRoute(builder: (context) => FirstCoin()),
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
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
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
                MaterialPageRoute(builder: (context) => FirstCoin()),
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
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
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
                MaterialPageRoute(builder: (context) => FirstCoin()),
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
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
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
        ])));
  }
}
