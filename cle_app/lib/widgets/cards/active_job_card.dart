// import 'package:drive_cle/data/database/database.dart';
// import 'package:drive_cle/data/tables/joined_tables/job_with_details.dart';
// import 'package:drive_cle/services/router.dart';
// import 'package:drive_cle/util/Components/core.dart';
// import 'package:flutter/material.dart';

// class ActiveJobCard extends StatelessWidget {
//   final JobWithDetails job;
//   const ActiveJobCard({Key? key, required this.job}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return GestureDetector(
//       onTap: () => Navigator.pushNamed(context, AppRouter.loadDetailsPage,
//           arguments: job),
//       child: Card(
//         shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
//         color: Colors.red[900],
//         child: Padding(
//             padding: const EdgeInsets.all(16.0),
//             child: Column(
//               children: [
//                 Padding(
//                   padding:
//                       const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
//                   child: Row(
//                     mainAxisAlignment: MainAxisAlignment.start,
//                     children: [
//                       Container(
//                         decoration: BoxDecoration(
//                           borderRadius: BorderRadius.circular(50),
//                           border: Border.all(color: Colors.white, width: 2),
//                         ),
//                         child: CircleAvatar(
//                           backgroundColor: Colors.red[900],
//                           child: const Icon(
//                             Icons.local_shipping,
//                             color: Colors.white,
//                           ),
//                         ),
//                       ),
//                       const HorizontalSpacer(
//                         width: 2,
//                       ),
//                       Column(
//                         crossAxisAlignment: CrossAxisAlignment.start,
//                         children: [
//                           Row(
//                             children: [
//                               Text(
//                                 '${job.pickUpLocation.city}, ${job.pickUpLocation.state}',
//                                 style: const TextStyle(
//                                     color: Colors.white, fontSize: 18),
//                               ),
//                               const Icon(Icons.arrow_forward,
//                                   color: Colors.white),
//                               Text(
//                                 '${job.dropOffLocation.city}, ${job.dropOffLocation.state}',
//                                 style: const TextStyle(
//                                     color: Colors.white, fontSize: 18),
//                               ),
//                             ],
//                           ),
//                           Row(
//                             children: [
//                               Text(
//                                   'Deliver By: ${job.job.dropOffTime.toString()}',
//                                   style: const TextStyle(
//                                       color: Colors.white70,
//                                       fontSize: 16,
//                                       letterSpacing: .6)),
//                             ],
//                           ),
//                         ],
//                       )
//                     ],
//                   ),
//                 ),
//                 InnerActiveCard(
//                   address: job.pickUpLocation,
//                   time: job.job.pickUpTime.toString(),
//                 ),
//                 InnerActiveCard(
//                   isPickUp: false,
//                   address: job.dropOffLocation,
//                   time: job.job.dropOffTime.toString(),
//                 ),
//                 Row(
//                   mainAxisAlignment: MainAxisAlignment.end,
//                   children: [
//                     Transform.translate(
//                       offset: const Offset(19, 20),
//                       child: Card(
//                         shape: const RoundedRectangleBorder(
//                             borderRadius: BorderRadius.only(
//                                 topLeft: Radius.circular(10),
//                                 bottomRight: Radius.circular(10))),
//                         elevation: 0,
//                         color: Colors.red[700]?.withOpacity(.7),
//                         child: Padding(
//                           padding: const EdgeInsets.symmetric(
//                               horizontal: 10, vertical: 5),
//                           child: Row(
//                             children: const [
//                               Text(
//                                 'Details',
//                                 style: TextStyle(
//                                     color: Colors.white, fontSize: 24),
//                               ),
//                               Padding(
//                                 padding: EdgeInsets.only(left: 8),
//                                 child: Icon(
//                                   Icons.arrow_forward_ios,
//                                   color: Colors.white,
//                                   size: 20,
//                                 ),
//                               )
//                             ],
//                           ),
//                         ),
//                       ),
//                     ),
//                   ],
//                 )
//               ],
//             )),
//       ),
//     );
//   }
// }

// class InnerActiveCard extends StatelessWidget {
//   final bool isPickUp;
//   final Address address;
//   final String time;
//   const InnerActiveCard({
//     Key? key,
//     this.isPickUp = true,
//     required this.address,
//     required this.time,
//   }) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: const EdgeInsets.symmetric(vertical: 8),
//       child: Card(
//         elevation: 0,
//         color: Colors.red[800],
//         child: Padding(
//           padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 8),
//           child: Row(
//             children: [
//               Column(
//                 mainAxisAlignment: MainAxisAlignment.start,
//                 children: const [
//                   Icon(
//                     Icons.place,
//                     color: Colors.white,
//                   ),
//                 ],
//               ),
//               Expanded(
//                 child: Column(
//                   children: [
//                     Padding(
//                       padding: const EdgeInsets.symmetric(horizontal: 8),
//                       child: Row(
//                         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                         children: [
//                           Text(isPickUp ? 'Pick Up' : 'Delivery',
//                               style: const TextStyle(
//                                   color: Color.fromARGB(255, 255, 227, 68),
//                                   fontSize: 16,
//                                   letterSpacing: .6)),
//                           Flexible(
//                             child: Text(time,
//                                 style: const TextStyle(
//                                     color: Colors.white60,
//                                     fontSize: 16,
//                                     letterSpacing: .6)),
//                           ),
//                         ],
//                       ),
//                     ),
//                     Padding(
//                       padding: const EdgeInsets.symmetric(horizontal: 8),
//                       child: Row(
//                         mainAxisAlignment: MainAxisAlignment.start,
//                         children: [
//                           Text(address.addressLineOne,
//                               style: const TextStyle(
//                                   color: Colors.white,
//                                   fontSize: 16,
//                                   letterSpacing: .6,
//                                   fontWeight: FontWeight.bold)),
//                         ],
//                       ),
//                     ),
//                     Padding(
//                       padding: const EdgeInsets.symmetric(horizontal: 8),
//                       child: Wrap(
//                         children: [
//                           Row(
//                             mainAxisAlignment: MainAxisAlignment.start,
//                             children: [
//                               Flexible(
//                                 child: Text(
//                                     ' ${address.city}, ${address.state} ${address.zipCode}',
//                                     style: const TextStyle(
//                                         color: Colors.white60,
//                                         fontSize: 14,
//                                         letterSpacing: .6)),
//                               ),
//                             ],
//                           ),
//                         ],
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
