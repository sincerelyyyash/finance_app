// import 'package:finance_app/constraints.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:firebase_storage/firebase_storage.dart';
// import 'package:flutter/material.dart';
// import 'package:image_picker/image_picker.dart';
// import 'dart:io';

// class ProfileScreen extends StatefulWidget {
//   const ProfileScreen({super.key});

//   @override
//   State<ProfileScreen> createState() => _ProfileScreenState();
// }

// class _ProfileScreenState extends State<ProfileScreen> {
//   String imageUrl = " ";
//   void pickUploadImage() async {
//     final image = await ImagePicker().pickImage(
//         source: ImageSource.gallery,
//         maxWidth: 512,
//         maxHeight: 512,
//         imageQuality: 75);

//     Reference ref = FirebaseStorage.instance.ref().child('profilepic.jpg');
//     await ref.putFile(File(image!.path));
//     ref.getDownloadURL().then((value) {
//       print(value);
//       setState(() {
//         imageUrl = value;
//       });
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text(
//           "Profile",
//           style: TextStyle(
//             fontSize: 20,
//             color: Colors.white,
//           ),
//         ),
//         elevation: 0,
//         centerTitle: true,
//       ),
//       body: SingleChildScrollView(
//           child: Container(
//         padding: EdgeInsets.only(top: 20),
//         child: Column(
//           children: [
//             ElevatedButton(
//               onPressed: () {
//                 pickUploadImage();
//               },
//               style: ButtonStyle(
//                   shape: MaterialStateProperty.all(CircleBorder()),
//                   padding: MaterialStateProperty.all(EdgeInsets.all(2)),
//                   backgroundColor: MaterialStateProperty.all(kPrimaryColor)),
//               child: Center(
//                   child: imageUrl == " "
//                       ? Icon(
//                           Icons.person,
//                           size: 100,
//                           color: Colors.white,
//                         )
//                       : CircleAvatar(
//                           radius: 85.0,
//                           backgroundImage: NetworkImage(imageUrl),
//                           backgroundColor: Colors.transparent,
//                         )),
//             ),
//             Padding(
//               padding: const EdgeInsets.only(top: 8),
//               child: Text(
//                 FirebaseAuth.instance.currentUser!.displayName.toString(),
//                 style: TextStyle(
//                     color: Colors.white,
//                     fontSize: 20,
//                     fontWeight: FontWeight.w600),
//               ),
//             ),
//             Text(
//               FirebaseAuth.instance.currentUser!.email.toString(),
//               style: TextStyle(
//                   color: Colors.grey,
//                   fontSize: 18,
//                   fontStyle: FontStyle.italic),
//             ),
//             Row(
//               children: [
//                 Padding(
//                   padding: const EdgeInsets.all(12.0),
//                   child: Text(
//                     "Current Networth:",
//                     textAlign: TextAlign.start,
//                     style: TextStyle(fontSize: 18),
//                   ),
//                 ),
//               ],
//             )
//           ],
//         ),
//       )),
//     );
//   }
// }
