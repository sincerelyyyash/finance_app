// import 'package:flutter/material.dart';

// import 'api_methods.dart';

// class Coinsdata extends StatefulWidget {
//   const Coinsdata({super.key});

//   @override
//   State<Coinsdata> createState() => _CoinsdataState();
// }

// class _CoinsdataState extends State<Coinsdata> {
//   double bitcoin = 0.0;
//   double ethereum = 0.0;
//   double cardano = 0.0;
//   double tether = 0.0;
//   double dogecoin = 0.0;
//   double solana = 0.0;
//   double litecoin = 0.0;
//   double polkadot = 0.0;
//   double tron = 0.0;
//   double chainlink = 0.0;

//   @override
//   void initState() {
//     getValues();
//   }

//   getValues() async {
//     bitcoin = await getPrice("bitcoin");
//     ethereum = await getPrice("ethereum");
//     cardano = await getPrice("cardano");
//     tether = await getPrice("tether");
//     dogecoin = await getPrice("dogecoin");
//     solana = await getPrice("solana");
//     litecoin = await getPrice("litecoin");
//     polkadot = await getPrice("polkadot");
//     tron = await getPrice("tron");
//     chainlink = await getPrice("chainlink");
//     setState(() {});
//   }
//   @override
//   Widget build(BuildContext context) {
// getValues(String id) {
//       if (id == "bitcoin") {
//         return bitcoin;
//       } else if (id == "ethereum") {
//         return ethereum;
//       } else if (id == "cardano") {
//         return cardano;
//       } else if (id == "tether") {
//         return tether;
//       } else if (id == "dogecoin") {
//         return dogecoin;
//       } else if (id == "solana") {
//         return solana;
//       } else if (id == "litecoin") {
//         return litecoin;
//       } else if (id == "polkadot") {
//         return polkadot;
//       } else if (id == "tron") {
//         return tron;
//       } else if (id == "chainlink") {
//         return chainlink;
//       }
//     }

    
//   }
// }

