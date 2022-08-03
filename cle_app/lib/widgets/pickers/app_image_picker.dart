import 'dart:io';
import 'package:cle_app/util/config/config.dart';
import 'package:cle_app/widgets/buttons/buttons.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';

class AppImagePicker extends StatefulWidget {
  final bool enableCrop, showButton;
  final ValueChanged<File?> onSelectedImage;
  const AppImagePicker({
    Key? key,
    this.enableCrop = true,
    this.showButton = false,
    required this.onSelectedImage,
  }) : super(key: key);

  @override
  _AppImagePickerState createState() => _AppImagePickerState();
}

class _AppImagePickerState extends State<AppImagePicker> {
  File? imagePicked;
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (widget.showButton)
              RRectButton(
                fullwidth: false,
                text: imagePicked == null ? 'Upload Image' : 'Change Image',
                size: ButtonSize.xsmall,
                onPressed: () {
                  uploadImage(context);
                },
              ),
          ],
        ),
        Padding(
          padding: const EdgeInsets.fromLTRB(32, 0, 32, 16),
          child: Container(
            child: imagePicked != null
                ? SizedBox(
                    height: 145,
                    child: Stack(
                      alignment: const Alignment(1.1, -1.1),
                      children: [
                        InkWell(
                            onTap: widget.enableCrop ? () => cropImage() : null,
                            child: Container(
                              decoration: BoxDecoration(
                                border: Border.all(color: Colors.grey.shade500),
                                // borderRadius: BorderRadius.circular(8),
                              ),
                              child: Image.file(
                                File(imagePicked!.path),
                                fit: BoxFit.contain,
                              ),
                            )),
                        IconButton(
                          icon: const CircleAvatar(
                            backgroundColor: Palette.red,
                            child: Icon(
                              Icons.close,
                              color: Colors.white,
                            ),
                          ),
                          onPressed: () => clearImage(),
                        ),
                      ],
                    ),
                  )
                : InkWell(
                    onTap: () => uploadImage(context),
                    child: Container(
                      height: 100,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: Colors.grey[200],
                        border: Border.all(color: Colors.grey.shade500),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: const [
                          Text('Upload/Select an Image'),
                          Icon(Icons.upload_outlined)
                        ],
                      ),
                    ),
                  ),
          ),
        ),
      ],
    );
  }

  void uploadImage(BuildContext context) {
    openSourceChoiceModal(context);
  }

  Future pickImage(ImageSource source) async {
    try {
      final image = await ImagePicker().pickImage(source: source);
      if (image == null) return;

      // final dir = await getApplicationDocumentsDirectory();
      // final fileName = basename(image.path);
      final imageTemporary = File(image.path);
      setState(() {
        imagePicked = imageTemporary;
        widget.onSelectedImage(imagePicked);
      });
    } on PlatformException catch (e) {
      if (kDebugMode) {
        print("Failed to pick image: $e");
      }
    } on Exception catch (e) {
      if (kDebugMode) {
        print(e);
      }
    }
    if (imagePicked != null && widget.enableCrop) {
      cropImage();
    }
  }

  void cropImage() async {
    try {
      final newImage = await openCroper(imagePicked!);
      setState(() {
        imagePicked = newImage;
      });
    } on PlatformException catch (e) {
      if (kDebugMode) {
        print("Failed to crop image: $e");
      }
    }
  }

  void clearImage() {
    setState(() {
      imagePicked = null;
      widget.onSelectedImage(imagePicked);
    });
  }

  void switchImageSource(ImageSource imageSource) {
    switch (imageSource) {
      case ImageSource.camera:
        pickImage(ImageSource.camera);
        break;
      case ImageSource.gallery:
        pickImage(ImageSource.gallery);
        break;
      default:
        pickImage(ImageSource.gallery);
        break;
    }
  }

  void openSourceChoiceModal(BuildContext context) {
    if (Platform.isIOS) {
      showIosModal(context);
    } else {
      showAndroidModal(context);
    }
  }

  void showIosModal(BuildContext context) {
    showCupertinoModalPopup(
      context: context,
      builder: (context) => CupertinoActionSheet(
        actions: [
          CupertinoActionSheetAction(
            child: const Text('Camera'),
            onPressed: () {
              Navigator.pop(context);
              switchImageSource(ImageSource.camera);
            },
          ),
          CupertinoActionSheetAction(
            child: const Text('Gallery'),
            onPressed: () {
              Navigator.pop(context);
              switchImageSource(ImageSource.gallery);
            },
          )
        ],
      ),
    );
  }

  void showAndroidModal(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (context) => Column(
        mainAxisSize: MainAxisSize.min,
        children: ListTile.divideTiles(context: context, tiles: [
          ListTile(
            leading: const Icon(Icons.camera_alt),
            title: const Text('Camera'),
            onTap: () {
              Navigator.pop(context);
              switchImageSource(ImageSource.camera);
            },
          ),
          ListTile(
            leading: const Icon(Icons.photo_album),
            title: const Text('Gallery'),
            onTap: () {
              Navigator.pop(context);
              switchImageSource(ImageSource.gallery);
            },
          ),
        ]).toList(),
      ),
    );
  }
}

Future<File> openCroper(File originalImage) async {
  CroppedFile? cropped = (await ImageCropper().cropImage(
    sourcePath: originalImage.path,
    // aspectRatioPresets: [
    //   CropAspectRatioPreset.square,
    //   CropAspectRatioPreset.ratio3x2,
    //   CropAspectRatioPreset.original,
    //   CropAspectRatioPreset.ratio4x3,
    //   CropAspectRatioPreset.ratio16x9
    // ],
    // androidUiSettings:  AndroidUiSettings(
    //     toolbarColor: Palette.red,
    //     hideBottomControls: true,
    //     toolbarWidgetColor: Colors.white,
    //     initAspectRatio: CropAspectRatioPreset.original,
    //     lockAspectRatio: false),
    // iosUiSettings:  IOSUiSettings(
    //   minimumAspectRatio: 1.0,
    // ),
  ));
  File? newfile = cropped != null ? File(cropped.path) : null;
  return newfile ?? originalImage;
}
