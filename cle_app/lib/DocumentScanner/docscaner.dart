import 'dart:convert';
import 'dart:io';
import 'package:document_scanner_flutter/configs/configs.dart';
import 'package:document_scanner_flutter/document_scanner_flutter.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../data/api/client.dart';
import '../services/authentication.dart';

class Docscanner extends StatefulWidget {
  const Docscanner({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return DocScannerState();
  }
}

class DocScannerState extends State<Docscanner> {
  dynamic entityResult;
  entyGet() async {
    final tokenAuth = await AuthenticationService().getToken();
    entityResult = await ApiClient.create().entity(tokenAuth);
    // `scannedDoc` will be the PDF file generated from scanner
    if (kDebugMode) {
      print(entityResult.body.toString());
    }
    scanPDF(entityResult);
  }

  Future<void> scanPDF(String entity) async {
    try {
      File? scannedDoc = await DocumentScannerFlutter.launchForPdf(context,
          source: ScannerFileSource.CAMERA); // Or ScannerFileSource.GALLERY
      if (scannedDoc != null) {
        final tokenAuth = await AuthenticationService().getToken();
        List<int> imageBytes = scannedDoc.readAsBytesSync();
        if (kDebugMode) {
          print(imageBytes);
        }
        String base64Image = base64Encode(imageBytes);
        var result = await ApiClient.create().sendpdffile({
          "base64file": "data:image/png;base64,$base64Image",
          "description": "upload document for user"
        }, tokenAuth.toString(), entity.toString());
        // `scannedDoc` will be the PDF file generated from scanner
        if (kDebugMode) {
          print(result.body.toString());
        }
      }
    } on PlatformException {
      // 'Failed to get document path or operation cancelled!';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Document Scanner"),
        centerTitle: true,
      ),
      body: Center(
        child: InkWell(
            onTap: () {
              entyGet();
            },
            child: Image.asset(
              'assests/images/Scanner.png',
              height: 60,
              width: 60,
            )),
      ),
    );
  }
}
