import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'home_view.dart';
import 'package:sqflite/sqflite.dart';


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

// Future<void> buyStock(String userEmail, String stockName, double price, int quantity) async {
//   final double totalCost = (quantity * price) + 20.0; // including brokerage fee
//   final DocumentReference<Map<String, dynamic>> userWalletDoc =
//       FirebaseFirestore.instance.collection('trades').doc(userEmail).collection('wallet').doc('balance');

//   final DocumentReference<Map<String, dynamic>> stockTradeDoc =
//       FirebaseFirestore.instance.collection('trades').doc(userEmail).collection('trade').doc(stockName);

//   try {
//     // check if user has enough balance in wallet
//     final DocumentSnapshot<Map<String, dynamic>> walletSnapshot = await userWalletDoc.get();
//     final double currentBalance = walletSnapshot.data()!['balance'];
//     if (currentBalance < totalCost) {
//       throw Exception('Insufficient balance in wallet.');
//     }

//     // update user's wallet balance
//     await userWalletDoc.update({'balance': currentBalance - totalCost});

//     // update stock trade details or create new trade
//     final DocumentSnapshot<Map<String, dynamic>> stockTradeSnapshot = await stockTradeDoc.get();
//     if (stockTradeSnapshot.exists) {
//       final Map<String, dynamic> existingTrade = stockTradeSnapshot.data()!;
//       final int updatedQuantity = existingTrade['quantity'] + quantity;
//       final double updatedValue = existingTrade['value'] + (quantity * price);

//       await stockTradeDoc.update({
//         'quantity': updatedQuantity,
//         'value': updatedValue,
//         'last_trade': Timestamp.now(),
//         'last_price': price,
//       });
//     } else {
//       await stockTradeDoc.set({
//         'buy': true,
//         'quantity': quantity,
//         'value': quantity * price,
//         'last_trade': Timestamp.now(),
//         'last_price': price,
//       });
//     }
//   } catch (error) {
//     // handle error here
//     print(error);
//   }
// }

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


Future<void> createWallet(String userEmail) async {
  final DocumentReference<Map<String, dynamic>> userWalletDoc =
      FirebaseFirestore.instance.collection('trades').doc(userEmail).collection('wallet').doc('balance');

  try {
    // create trades collection with user's email as ID
    await FirebaseFirestore.instance.collection('trades').doc(userEmail).set({});

    // create wallet subcollection with initial balance of 20000
    await userWalletDoc.set({'balance': 20000.0});
  } catch (error) {
    // handle error here
    print(error);
  }
}



// Future<void> generateWallet() async {
//   // Get the current user's email
//   final String userEmail = FirebaseAuth.instance.currentUser!.email!;
  
//   // Create the trades collection with the user's email as the ID
//   final CollectionReference<Map<String, dynamic>> tradesCollection =
//       FirebaseFirestore.instance.collection('trades').doc(userEmail).collection('wallet');

//   // Create the balance document with a default balance of 20000
//   await tradesCollection.doc('balance').set({'balance': 20000.0});
// }



// Future<void> buyStock(String userEmail, String stockName, double price, int quantity) async {
//   final double totalCost = (quantity * price) + 20.0; // including brokerage fee

//   // Open the database
//   final Database db = await openDatabase('trades.db');

//   // Create a collection named trades which has a current logged in user's email as id
//   await db.execute('CREATE TABLE IF NOT EXISTS trades (userEmail TEXT PRIMARY KEY)');

//   // Create a subcollection named wallet which has a document balance which has a default balance field set to 20000.
//   await db.execute('CREATE TABLE IF NOT EXISTS wallet (userEmail TEXT PRIMARY KEY, balance REAL DEFAULT 20000)');

//   try {
//     // check if user has enough balance in wallet
//     final List<Map<String, dynamic>> walletRows = await db.query('wallet', where: 'userEmail = ?', whereArgs: [userEmail]);
//     final double currentBalance = walletRows[0]['balance'];
//     if (currentBalance < totalCost) {
//       throw Exception('Insufficient balance in wallet.');
//     }

//     // update user's wallet balance
//     await db.update('wallet', {'balance': currentBalance - totalCost}, where: 'userEmail = ?', whereArgs: [userEmail]);

//     // update stock trade details or create new trade
//     final List<Map<String, dynamic>> stockTradeRows = await db.query('trade', where: 'userEmail = ? AND stockName = ?', whereArgs: [userEmail, stockName]);
//     if (stockTradeRows.isNotEmpty) {
//       final Map<String, dynamic> existingTrade = stockTradeRows[0];
//       final int updatedQuantity = existingTrade['quantity'] + quantity;
//       final double updatedValue = existingTrade['value'] + (quantity * price);

//       await db.update('trade', {
//         'quantity': updatedQuantity,
//         'value': updatedValue,
//         'last_trade': DateTime.now().millisecondsSinceEpoch,
//         'last_price': price,
//       }, where: 'userEmail = ? AND stockName = ?', whereArgs: [userEmail, stockName]);
//     } else {
//       await db.insert('trade', {
//         'userEmail': userEmail,
//         'stockName': stockName,
//         'buy': true,
//         'quantity': quantity,
//         'value': quantity * price,
//         'last_trade': DateTime.now().millisecondsSinceEpoch,
//         'last_price': price,
//       });
//     }
//   } catch (error) {
//     // handle error here
//     print(error);
//   } finally {
//     // Close the database
//     await db.close();
//   }
// }

// // Function to generate a collection named trades which has a current logged in user's email as id
// // and then has a subcollection named wallet which has a document balance which has a default balance field set to 20000.
// // Create the function such that userEmail is fetched directly by using email of the logged in user.
// // Generate the wallet only once else just update when a stock is bought or sold.
// Future<void> generateTradesCollection(String userEmail) async {
//   // Open the database
//   final Database db = await openDatabase('trades.db');

//   // Create a collection named trades which has a current logged in user's email as id
//   await db.execute('CREATE TABLE IF NOT EXISTS trades (userEmail TEXT PRIMARY KEY)');

//   // Check if the user's trades collection exists
//   final List<Map<String, dynamic>> tradesRows = await db.query('trades', where:
  