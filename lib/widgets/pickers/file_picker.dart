import 'dart:io';

import 'package:cle_app/widgets/buttons/buttons.dart';
import 'package:cle_app/widgets/errors.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:open_file/open_file.dart';
import 'package:path_provider/path_provider.dart';

class AppFilePicker extends StatelessWidget {
  const AppFilePicker({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            RRectButton(
              text: "Pick File",
              size: ButtonSize.xsmall,
              onPressed: () async {
                //TODO file extension limiting and extra setup https://github.com/miguelpruivo/flutter_file_picker/wiki/Setup
                final result = await FilePicker.platform.pickFiles(
                  allowMultiple: true,
                );

                if (result == null) return;

                if (result.files.length > 1) {
                  showGeneralError(context);
                  // openFiles(result.files, context);
                } else {
                  final file = result.files.first;
                  openFile(file);
                }

                // print('Name: ${file.name}');
                // print('Bytes: ${file.bytes}');
                // print('Name: ${file.size}');
                // print('Extension: ${file.extension}');
                // print('Path: ${file.path}');

                // final newFile = await saveFilePermanently(file);

                // print('From path: ${file.path}');
                // print('To path: ${newFile.path}');
              },
            ),
            // Visibility(
            //   visible: imagePicked != null,
            //   child: IconButton(
            //     icon: const Icon(Icons.delete),
            //     onPressed: () {},
            //   ),
            // )
          ],
        ),
      ],
    );
  }

  // void openFiles(List<PlatformFile> files, BuildContext context) =>
  //     Navigator.of(context).push(
  //       MaterialPageRoute(
  //         builder: (context) => FilesPage(
  //           files: files,
  //           onOpenedFile: openFile,
  //         ), // FilesPage
  //       ),
  //     );

  Future<File> saveFilePermanently(PlatformFile file) async {
    final appStorage = await getApplicationDocumentsDirectory();
    final newFile = File('${appStorage.path}/${file.name}');

    return File(file.path!).copy(newFile.path);
  }

  void openFile(PlatformFile file) {
    OpenFile.open(file.path!);
  }
}
