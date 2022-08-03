// import 'dart:io';
// import 'package:flutter/foundation.dart';
// import 'package:flutter/material.dart';
// import 'package:document_scanner/document_scanner.dart';
// import 'package:permission_handler/permission_handler.dart';

// class DocApp extends StatefulWidget {
//   const DocApp({Key? key}) : super(key: key);

//   @override
//   DocAppState createState() => DocAppState();
// }

// class DocAppState extends State<DocApp> {
//   File? scannedDocument;
//   Future<PermissionStatus>? cameraPermissionFuture;

//   @override
//   void initState() {
//     cameraPermissionFuture = Permission.camera.request();
//     super.initState();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home: Scaffold(
//           appBar: AppBar(
//             title: const Text('Plugin example app'),
//           ),
//           body: FutureBuilder<PermissionStatus>(
//             future: cameraPermissionFuture,
//             builder: (BuildContext context,
//                 AsyncSnapshot<PermissionStatus> snapshot) {
//               if (snapshot.connectionState == ConnectionState.done) {
//                 if (snapshot.data!.isGranted) {
//                   return Stack(
//                     children: <Widget>[
//                       Column(
//                         children: <Widget>[
//                           Expanded(
//                             child: scannedDocument != null
//                                 ? Image(
//                                     image: FileImage(scannedDocument!),
//                                   )
//                                 : DocumentScanner(
//                                     // documentAnimation: false,
//                                     noGrayScale: true,
//                                     onDocumentScanned:
//                                         (ScannedImage scannedImage) {
//                                       if (kDebugMode) {
//                                         print("document : " +
//                                             scannedImage.croppedImage!);
//                                       }

//                                       setState(() {
//                                         scannedDocument = scannedImage
//                                             .getScannedDocumentAsFile();
//                                         // imageLocation = image;
//                                       });
//                                     },
//                                   ),
//                           ),
//                         ],
//                       ),
//                       scannedDocument != null
//                           ? Positioned(
//                               bottom: 20,
//                               left: 0,
//                               right: 0,
//                               child: ElevatedButton(
//                                   child: const Text("retry"),
//                                   onPressed: () {
//                                     setState(() {
//                                       scannedDocument = null;
//                                     });
//                                   }),
//                             )
//                           : Container(),
//                     ],
//                   );
//                 } else {
//                   return const Center(
//                     child: Text("camera permission denied"),
//                   );
//                 }
//               } else {
//                 return const Center(
//                   child: CircularProgressIndicator(),
//                 );
//               }
//             },
//           )),
//     );
//   }
// }
