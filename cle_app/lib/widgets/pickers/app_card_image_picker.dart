// import 'dart:async';
// import 'dart:io';
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
// import 'package:image_cropper/image_cropper.dart';
// import 'package:image_picker/image_picker.dart';
// // import 'package:image_picker_for_web/image_picker_for_web.dart';

// class AppCardImagePicker extends StatefulWidget {
//   final bool enableCrop;
//   const AppCardImagePicker({
//     Key? key,
//     this.enableCrop = true,
//   }) : super(key: key);

//   @override
//   _AppCardImagePickerState createState() => _AppCardImagePickerState();
// }

// File? imagePicked;

// class _AppCardImagePickerState extends State<AppCardImagePicker> {
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       child: imagePicked != null
//           ? GestureDetector(
//               onTap: () async {
//                 final tempimagePicked = await Navigator.of(context).push(
//                   HeroDialogRoute(
//                     builder: (context) {
//                       return ImageEditView(
//                         image: imagePicked,
//                       );
//                     },
//                   ),
//                 );
//                 setState(() {
//                   imagePicked = tempimagePicked;
//                 });
//               },
//               child: Card(
//                 shape: RoundedRectangleBorder(
//                     borderRadius: BorderRadius.circular(10)),
//                 elevation: 0,
//                 color: Colors.red[700],
//                 child: Padding(
//                   padding: const EdgeInsets.all(16.0),
//                   child: Row(
//                     mainAxisAlignment: MainAxisAlignment.spaceAround,
//                     children: [
//                       const Icon(
//                         Icons.collections,
//                         color: Colors.white,
//                       ),
//                       Row(
//                         children: [
//                           Text('Uploaded Image',
//                               style: TextStyle(
//                                   color: const Color.fromARGB(255, 255, 227, 68)
//                                       .withOpacity(0.8),
//                                   fontSize: 20,
//                                   letterSpacing: .6)),
//                           Icon(
//                             Icons.edit,
//                             color: const Color.fromARGB(255, 255, 227, 68)
//                                 .withOpacity(0.8),
//                           ),
//                         ],
//                       )
//                     ],
//                   ),
//                 ),
//               ),
//             )
//           : GestureDetector(
//               onTap: () => uploadImage(),
//               child: Card(
//                 shape: RoundedRectangleBorder(
//                     borderRadius: BorderRadius.circular(10)),
//                 elevation: 0,
//                 color: Colors.red[700],
//                 child: Padding(
//                   padding: const EdgeInsets.all(16.0),
//                   child: Row(
//                     mainAxisAlignment: MainAxisAlignment.spaceAround,
//                     children: [
//                       const Text('NO DOCS',
//                           style: TextStyle(
//                               color: Colors.white70,
//                               fontSize: 16,
//                               letterSpacing: .6)),
//                       Row(
//                         children: [
//                           Icon(
//                             Icons.file_upload_outlined,
//                             color: const Color.fromARGB(255, 255, 227, 68)
//                                 .withOpacity(0.8),
//                           ),
//                           Text('Scan a Document',
//                               style: TextStyle(
//                                   color: const Color.fromARGB(255, 255, 227, 68)
//                                       .withOpacity(0.8),
//                                   fontSize: 20,
//                                   letterSpacing: .6)),
//                         ],
//                       )
//                     ],
//                   ),
//                 ),
//               ),
//             ),
//     );
//   }

//   void uploadImage() {
//     openSourceChoiceModal(context);
//   }

//   Future pickImage(ImageSource source) async {
//     try {
//       final image = await ImagePicker().pickImage(source: source);
//       if (image == null) return;

//       final imageTemporary = File(image.path);
//       setState(() {
//         imagePicked = imageTemporary;
//       });
//     } on PlatformException catch (e) {
//       print("Failed to pick image: $e");
//     }
//     if (imagePicked != null && widget.enableCrop) {
//       cropImage();
//     }
//   }

//   void cropImage() async {
//     try {
//       final newImage = await openCroper(imagePicked!);
//       setState(() {
//         imagePicked = newImage;
//       });
//     } on PlatformException catch (e) {
//       print("Failed to crop image: $e");
//     }
//   }

//   void clearImage() {
//     setState(() {
//       imagePicked = null;
//     });
//   }

//   Future<void> switchImageSource(ImageSource imageSource) async {
//     switch (imageSource) {
//       case ImageSource.camera:
//         pickImage(ImageSource.camera);
//         break;
//       case ImageSource.gallery:
//         await pickImage(ImageSource.gallery);
//         break;
//       default:
//         await pickImage(ImageSource.gallery);
//         break;
//     }
//   }

//   void openSourceChoiceModal(BuildContext context) {
//     if (Platform.isIOS) {
//       showIosModal(context);
//     } else {
//       showAndroidModal(context);
//     }
//   }

//   void showIosModal(BuildContext context) {
//     showCupertinoModalPopup(
//       context: context,
//       builder: (context) => CupertinoActionSheet(
//         actions: [
//           CupertinoActionSheetAction(
//             child: const Text('Camera'),
//             onPressed: () {
//               Navigator.pop(context);
//               switchImageSource(ImageSource.camera);
//             },
//           ),
//           CupertinoActionSheetAction(
//             child: const Text('Gallery'),
//             onPressed: () {
//               Navigator.pop(context);
//               switchImageSource(ImageSource.gallery);
//             },
//           )
//         ],
//       ),
//     );
//   }

//   void showAndroidModal(BuildContext context) {
//     showModalBottomSheet(
//       context: context,
//       builder: (context) => Column(
//         mainAxisSize: MainAxisSize.min,
//         children: ListTile.divideTiles(context: context, tiles: [
//           ListTile(
//             leading: const Icon(Icons.camera_alt),
//             title: const Text('Camera'),
//             onTap: () {
//               Navigator.pop(context);
//               switchImageSource(ImageSource.camera);
//             },
//           ),
//           ListTile(
//             leading: const Icon(Icons.photo_album),
//             title: const Text('Gallery'),
//             onTap: () {
//               Navigator.pop(context);
//               switchImageSource(ImageSource.gallery);
//             },
//           ),
//         ]).toList(),
//       ),
//     );
//   }
// }

// Future<File> openCroper(File originalImage) async {
//   File? cropped = (await ImageCropper().cropImage(
//     sourcePath: originalImage.path,
//     // aspectRatioPresets: [
//     //   CropAspectRatioPreset.square,
//     //   CropAspectRatioPreset.ratio3x2,
//     //   CropAspectRatioPreset.original,
//     //   CropAspectRatioPreset.ratio4x3,
//     //   CropAspectRatioPreset.ratio16x9
//     // ],
//     androidUiSettings: AndroidUiSettings(
//         toolbarColor: primaryColor,
//         hideBottomControls: true,
//         toolbarWidgetColor: Colors.white,
//         initAspectRatio: CropAspectRatioPreset.original,
//         lockAspectRatio: false),
//     iosUiSettings: const IOSUiSettings(
//       minimumAspectRatio: 1.0,
//     ),
//   ));
//   return cropped ?? originalImage;
// }
