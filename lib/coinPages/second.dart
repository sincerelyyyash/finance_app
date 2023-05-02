import 'package:finance_app/home_view.dart';
import 'package:flutter/material.dart';
import 'package:finance_app/models/api_methods.dart';

class SecondCoinPage extends StatefulWidget {
  const SecondCoinPage({super.key});

  @override
  State<SecondCoinPage> createState() => _SecondCoinPageState();
}

class _SecondCoinPageState extends State<SecondCoinPage> {
  final Future<List<Map<String, dynamic>>> coinsData = fetchData();
  // @override
  // void initState() {
  //   super.initState();
  //   fetchData();
  // }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<Map<String, dynamic>>(
        // future: coinsData,
        builder: (context, snapshot) {
      if (snapshot.hasData) {
        // access data from the 2nd index
        final coinData = snapshot.data![1];
        return Scaffold(
          appBar: AppBar(),
          body: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 300,
              ),
              Text(
                '\$${coinData['current_price']}',
                style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
              ),
              Text(
                "${coinData['price_change_24h'].toStringAsFixed(3)}%",
                style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
              )
            ],
          ),
        );
      } else if (snapshot.hasError) {
        return Text('Failed to fetch data: ${snapshot.error}');
      } else {
        return CircularProgressIndicator();
      }
    });
  }
}
