import 'dart:convert';
import 'dart:io';

import 'package:cle_app/providers/expence_provider.dart';
import 'package:cle_app/util/config/config.dart';
import 'package:cle_app/widgets/adaptive/adaptive_dialog.dart';
import 'package:cle_app/widgets/widgets.dart';
import 'package:document_scanner_flutter/configs/configs.dart';
import 'package:document_scanner_flutter/document_scanner_flutter.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

import '../../../data/api/client.dart';
import '../../../services/authentication.dart';

class AddExpenseModal extends StatefulWidget {
  const AddExpenseModal({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return AddExpenseModalState();
  }
}

class AddExpenseModalState extends State<AddExpenseModal> {
  bool isloading = false;
  TextEditingController amountcontroller = TextEditingController();
  TextEditingController descontroller = TextEditingController();
  File? scannedPDF;

  String base64Image = "";
  entyGet() async {
    final tokenAuth = await AuthenticationService().getToken();
    final entityResult = await ApiClient.create().entity(tokenAuth);
    // `scannedDoc` will be the PDF file generated from scanner
    if (kDebugMode) {
      print(entityResult.body.toString());
    }
    scanPDF();
  }

  Future<void> scanPDF() async {
    try {
      File? scannedDoc = await DocumentScannerFlutter.launchForPdf(context,
          source: ScannerFileSource.CAMERA);

      if (scannedDoc != null) {
        setState(() {
          scannedPDF = scannedDoc;
        });
        // final tokenAuth = await AuthenticationService().getToken();
        List<int> imageBytes = scannedDoc.readAsBytesSync();
        if (kDebugMode) {
          print(imageBytes);
        }
        base64Image = base64Encode(imageBytes);
        // var result = await ApiClient.create().sendpdffile({
        //   "base64file": "data:image/png;base64,$base64Image",
        //   "description": "upload document for user"
        // }, tokenAuth, 'jobs');
      }
    } on PlatformException {
      // 'Failed to get document path or operation cancelled!';
    }
  }

  @override
  Widget build(BuildContext context) {
    ExpenceProvider expenceManager = context.watch<ExpenceProvider>();
    bool activeKeyBoard =
        MediaQuery.of(context).viewInsets.bottom > 0 ? true : false;
    return WillPopScope(
      onWillPop: () async {
        if (Navigator.canPop(context) &&
            amountcontroller.text.isEmpty &&
            descontroller.text.isEmpty &&
            scannedPDF == null) {
          return true;
        }
        bool closeModal = false;
        await AdaptiveDialog(
                context: context,
                title: 'Info will be lost',
                dismissable: false,
                actions: Platform.isAndroid
                    ? [
                        TextButton(
                            onPressed: () {
                              closeModal = true;
                              Navigator.pop(context);
                            },
                            child: const Text('Yes',
                                style: TextStyle(fontSize: 24))),
                        TextButton(
                            onPressed: () {
                              closeModal = false;
                              Navigator.pop(context);
                            },
                            child: const Text('No',
                                style: TextStyle(fontSize: 24))),
                      ]
                    : [
                        CupertinoDialogAction(
                          child: const Text('Yes'),
                          onPressed: () {
                            closeModal = true;
                            Navigator.pop(context);
                          },
                        ),
                        CupertinoDialogAction(
                          child: const Text('No'),
                          onPressed: () {
                            closeModal = false;
                            Navigator.pop(context);
                          },
                        )
                      ],
                content: 'Are you such you can to discard your expense')
            .showAdaptiveDialog(context);
        return closeModal;
      },
      child: Scaffold(
        extendBodyBehindAppBar: true,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          leading: const SizedBox(),
          actions: [
            IconButton(
                onPressed: () async {
                  if (Navigator.canPop(context) &&
                      amountcontroller.text.isEmpty &&
                      descontroller.text.isEmpty &&
                      scannedPDF == null) {
                    Navigator.pop(context);
                  } else {
                    bool closeModal = false;
                    await AdaptiveDialog(
                            context: context,
                            title: 'Info will be lost',
                            dismissable: false,
                            actions: Platform.isAndroid
                                ? [
                                    TextButton(
                                        onPressed: () {
                                          closeModal = true;
                                          Navigator.pop(context);
                                        },
                                        child: const Text(
                                          'Yes',
                                          style: TextStyle(fontSize: 24),
                                        )),
                                    TextButton(
                                        onPressed: () {
                                          closeModal = false;
                                          Navigator.pop(context);
                                        },
                                        child: const Text('No',
                                            style: TextStyle(fontSize: 24))),
                                  ]
                                : [
                                    CupertinoDialogAction(
                                      child: const Text('Yes'),
                                      onPressed: () {
                                        closeModal = true;
                                        Navigator.pop(context);
                                      },
                                    ),
                                    CupertinoDialogAction(
                                      child: const Text('No'),
                                      onPressed: () {
                                        closeModal = false;
                                        Navigator.pop(context);
                                      },
                                    )
                                  ],
                            content:
                                'Are you such you can to discard your expense')
                        .showAdaptiveDialog(context);
                    if (closeModal) {
                      Navigator.pop(context);
                    }
                  }
                },
                icon: const Icon(
                  Icons.close,
                  color: Palette.black,
                ))
          ],
        ),
        body: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: const Alignment(-.8, -1),
              end: const Alignment(.8, 1),
              // begin: const Alignment(-.4, -1),
              // end: const Alignment(.4, 1),
              stops: activeKeyBoard
                  ? const [.03, .031, .85, .851, 1]
                  : const [.1, .101, .75, .751, 1],
              colors: [
                Palette.red,
                Colors.white,
                Colors.white,
                Colors.black.withOpacity(.1),
                Colors.black.withOpacity(.1)
              ],
            ),
          ),
          child: Center(
            child: SingleChildScrollView(
              child: Form(
                child: Builder(builder: (context) {
                  return Column(
                    children: <Widget>[
                      const Padding(
                          padding: EdgeInsets.symmetric(horizontal: 16),
                          child: Text(
                            'Add New Expense',
                            style: TextStyle(fontSize: 32),
                          )),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16),
                        child: AppTextField(
                          label: 'Amount',
                          textInputType: TextInputType.number,
                          controller: amountcontroller,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16),
                        child: AppTextField(
                          multiLine: true,
                          label: 'Description',
                          controller: descontroller,
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      if (scannedPDF == null)
                        RRectButton(
                          text: 'SCAN',
                          prefix: Icons.document_scanner,
                          onPressed: () async {
                            scanPDF();
                          },
                          fullwidth: false,
                        ),
                      if (scannedPDF != null)
                        Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Stack(
                              alignment: const Alignment(2.2, -2.2),
                              children: [
                                const Icon(
                                  Icons.file_present,
                                  size: 75,
                                ),
                                IconButton(
                                  icon: const CircleAvatar(
                                    backgroundColor: Palette.red,
                                    child: Icon(
                                      Icons.close,
                                      color: Colors.white,
                                    ),
                                  ),
                                  onPressed: () {
                                    setState(() {
                                      scannedPDF = null;
                                    });
                                  },
                                ),
                              ],
                            ),
                            Text(scannedPDF!.path.replaceRange(
                                0, scannedPDF!.parent.path.length + 1, ''))
                          ],
                        ),
                      const SizedBox(
                        height: 10,
                      ),
                      Container(
                        margin: const EdgeInsets.symmetric(horizontal: 16),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            RRectButton(
                              text: 'CANCEL',
                              buttonColor: Palette.darkGrey,
                              onPressed: () async {
                                if (Navigator.canPop(context) &&
                                    amountcontroller.text.isEmpty &&
                                    descontroller.text.isEmpty &&
                                    scannedPDF == null) {
                                  Navigator.pop(context);
                                } else {
                                  bool closeModal = false;
                                  await AdaptiveDialog(
                                          context: context,
                                          title: 'Info will be lost',
                                          dismissable: false,
                                          actions: Platform.isAndroid
                                              ? [
                                                  TextButton(
                                                      onPressed: () {
                                                        closeModal = true;
                                                        Navigator.pop(context);
                                                      },
                                                      child: const Text('Yes',
                                                          style: TextStyle(
                                                              fontSize: 24))),
                                                  TextButton(
                                                      onPressed: () {
                                                        closeModal = false;
                                                        Navigator.pop(context);
                                                      },
                                                      child: const Text('No',
                                                          style: TextStyle(
                                                              fontSize: 24))),
                                                ]
                                              : [
                                                  CupertinoDialogAction(
                                                    child: const Text('Yes'),
                                                    onPressed: () {
                                                      closeModal = true;
                                                      Navigator.pop(context);
                                                    },
                                                  ),
                                                  CupertinoDialogAction(
                                                    child: const Text('No'),
                                                    onPressed: () {
                                                      closeModal = false;
                                                      Navigator.pop(context);
                                                    },
                                                  )
                                                ],
                                          content:
                                              'Are you such you can to discard your expense')
                                      .showAdaptiveDialog(context);
                                  if (closeModal) {
                                    Navigator.pop(context);
                                  }
                                }
                              },
                              width: MediaQuery.of(context).size.width / 2.4,
                            ),
                            RRectButton(
                              text: 'SUBMIT',
                              width: MediaQuery.of(context).size.width / 2.4,
                              onPressed: () async {
                                if (Form.of(context)!.validate()) {
                                  if (scannedPDF != null) {
                                    expenceManager.setLoading(true);

                                    final tokenAuth =
                                        await AuthenticationService()
                                            .getToken();
                                    Map<String, dynamic> data = {
                                      "amount": amountcontroller.text,
                                      "amountgive": amountcontroller.text,
                                      "paymentType": {"id": 6},
                                      "transaction": {"id": 6},
                                      "note": descontroller.text,
                                      "currency": "USD",
                                      "numCheque": "",
                                      "numCarte": "",
                                      "banque": "",
                                      "numFicheBanque": "",
                                      "documents": [
                                        {"base64Image": ""},
                                        {
                                          "pdffile":
                                              "data:application/pdf;base64,${base64Encode(scannedPDF!.readAsBytesSync())}"
                                        }
                                      ]
                                    };
                                    try {
                                      var result = await ApiClient.create()
                                          .addexpensddriver(tokenAuth, data);
                                      expenceManager.setLoading(false);
                                      if (result.isSuccessful &&
                                          result.body['result'] != '') {
                                        await expenceManager.loadExpenseList();
                                        Navigator.pop(context);
                                      }
                                    } catch (e) {
                                      showGeneralError(context);
                                      if (kDebugMode) {
                                        print(e);
                                      }

                                      expenceManager.setLoading(false);
                                    }
                                  } else {
                                    noScan();
                                  }
                                }
                              },
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                    ],
                  );
                }),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
