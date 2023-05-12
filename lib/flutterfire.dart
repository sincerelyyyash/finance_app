import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'home_view.dart';

// Sign in Connection with Firebase.
Future<bool> signIn(String email, String password) async {
  try {
    await FirebaseAuth.instance
        .signInWithEmailAndPassword(email: email, password: password);
    return true;
  } catch (e) {
    print(e);
    {
      return false;
    }
  }
}

// Register connection with Firebase.
Future<bool> register(String email, String password, String name) async {
  try {
    await FirebaseAuth.instance
        .createUserWithEmailAndPassword(email: email, password: password);
    await FirebaseAuth.instance.currentUser!.updateDisplayName(name);

    return true;
  } on FirebaseAuthException catch (e) {
    if (e.code == 'weak-password') {
      print('The password provided is too weak.');
    } else if (e.code == 'email-already-in-use') {
      print('The account already exists for that email.');
    }
    return false;
  } catch (e) {
    print(e.toString());
    return false;
  }
}

Future<void> buyStock(String stockName, double price, int quantity) async {
  final User? currentUser = FirebaseAuth.instance.currentUser;
  if (currentUser == null) {
    throw Exception('User not logged in.');
  }

  final String userEmail = currentUser.email!;
  final double totalCost = (quantity * price) + 20.0; // including brokerage fee
  final DocumentReference<Map<String, dynamic>> userWalletDoc =
      FirebaseFirestore.instance
          .collection('trades')
          .doc(userEmail)
          .collection('wallet')
          .doc('balance');

  final DocumentReference<Map<String, dynamic>> stockTradeDoc =
      FirebaseFirestore.instance
          .collection('trades')
          .doc(userEmail)
          .collection('trade')
          .doc(stockName);

  try {
    // check if user has enough balance in wallet
    final DocumentSnapshot<Map<String, dynamic>> walletSnapshot =
        await userWalletDoc.get();
    final double currentBalance = walletSnapshot.data()!['balance'];
    if (currentBalance < totalCost) {
      throw Exception('Insufficient balance in wallet.');
    }

    // update user's wallet balance
    await userWalletDoc.update({'balance': currentBalance - totalCost});

    // update stock trade details or create new trade
    final DocumentSnapshot<Map<String, dynamic>> stockTradeSnapshot =
        await stockTradeDoc.get();
    if (stockTradeSnapshot.exists) {
      final Map<String, dynamic> existingTrade = stockTradeSnapshot.data()!;
      final int updatedQuantity = existingTrade['quantity'] + quantity;
      final double updatedValue = existingTrade['value'] + (quantity * price);

      await stockTradeDoc.update({
        'quantity': updatedQuantity,
        'value': updatedValue,
        'last_trade': Timestamp.now(),
        'last_price': price,
      });
    } else {
      await stockTradeDoc.set({
        'buy': true,
        'quantity': quantity,
        'value': quantity * price,
        'last_trade': Timestamp.now(),
        'last_price': price,
      });
    }
  } catch (error) {
    // handle error here
    print(error);
  }
}

Future<void> createWallet() async {
  final User? currentUser = FirebaseAuth.instance.currentUser;
  if (currentUser == null) {
    throw Exception('User not logged in.');
  }

  final String userEmail = currentUser.email!;
  final DocumentReference<Map<String, dynamic>> userWalletDoc =
      FirebaseFirestore.instance
          .collection('trades')
          .doc(userEmail)
          .collection('wallet')
          .doc('balance');

  try {
    // check if wallet document already exists
    final snapshot = await userWalletDoc.get();
    if (snapshot.exists) {
      return; // do nothing if wallet document already exists
    }

    // create trades collection with user's email as ID
    await FirebaseFirestore.instance
        .collection('trades')
        .doc(userEmail)
        .set({});

    // create wallet subcollection with initial balance of 20000
    await userWalletDoc.set({'balance': 20000.0});
  } catch (error) {
    // handle error here
    print(error);
  }
}





// Future<void> createWallet(String userEmail) async {
//   final DocumentReference<Map<String, dynamic>> userWalletDoc =
//       FirebaseFirestore.instance
//           .collection('trades')
//           .doc(userEmail)
//           .collection('wallet')
//           .doc('balance');

//   try {
//     // create trades collection with user's email as ID
//     await FirebaseFirestore.instance
//         .collection('trades')
//         .doc(userEmail)
//         .set({});

//     // create wallet subcollection with initial balance of 20000
//     await userWalletDoc.set({'balance': 20000.0});
//   } catch (error) {
//     // handle error here
//     print(error);
//   }
// }
