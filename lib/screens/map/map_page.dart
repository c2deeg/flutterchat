import 'package:cle_app/screens/map/widgets/map_screen.dart';
import 'package:cle_app/screens/map/widgets/shipment_status_bar.dart';
import 'package:cle_app/util/config/config.dart';
import 'package:flutter/material.dart';

class MapPage extends StatefulWidget {
  const MapPage({Key? key}) : super(key: key);

  @override
  State<MapPage> createState() => _MapPageState();
}

class _MapPageState extends State<MapPage>
    with AutomaticKeepAliveClientMixin<MapPage> {
  @override
  bool get wantKeepAlive => true;
  bool showLoads = true;
  bool isShowingActiveJobsList = true;
  String driverStatus = 'ACTIVE';

  // late Stream<List<JobWithDetails>> activeJobList, avaliableJobList;
  // JobWithDetails? activeJob;
  // late JobDao jobDao;

  @override
  initState() {
    super.initState();
  }

  // Stream<List<JobWithDetails>> watchActiveJobList() {
  //   return jobDao
  //       .watchAllActiveJobswithDetailsbyUserId(SettingsCache().user.user.id);
  // }

  // Future<void> getCurrentActiveJob(JobDao jobDao) async {
  //   var activeJobstate =
  //       await jobDao.getUserActiveJobswithDetails(SettingsCache().user.user.id);
  //   setState(() {
  //     activeJob = activeJobstate;
  //   });
  // }

  // Stream<List<JobWithDetails>> watchAvaliableJobs() {
  //   return jobDao.watchAllAvaliableJobswithDetails();
  // }

  @override
  Widget build(BuildContext context) {
    // final jobDao = context.read<JobDao>();
    // final activeJobList = jobDao
    //     .watchAllActiveJobswithDetailsbyUserId(SettingsCache().user.user.id);
    // final avaliableJobList = jobDao.watchAllAvaliableJobswithDetails();

    // getCurrentActiveJob(jobDao);
    // activeJobList = watchActiveJobList();
    // avaliableJobList = watchAvaliableJobs();
    // getCurrentActiveJob();
    return Scaffold(
      extendBodyBehindAppBar: true,
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
      // floatingActionButton: FloatingActionButton(
      //   shape: const CircleBorder(),
      //   backgroundColor: Palette.red,
      //   tooltip: "Report an Issue",
      //   child: const Icon(
      //     FontAwesomeIcons.triangleExclamation,
      //     color: Colors.white,
      //   ),
      //   onPressed: () {
      //     // Navigator.pushNamed(context, AppRouter.reportPage);
      //   },
      // ),
      body: Stack(
        children: [
          LayoutBuilder(builder: (context, constraints) {
            return SizedBox(
                height: constraints.maxHeight,
                child: const Visibility(visible: true, child: MapScreen()));
          }),
          DraggableScrollableSheet(
              initialChildSize: 0.128,
              maxChildSize: .90,
              minChildSize: 0.128,
              // snap: true,
              // snapSizes: const [0.128, 1],
              builder: ((context, scrollController) {
                return Container(
                  color: Colors.white.withOpacity(.5),
                  child: const Padding(
                    padding: EdgeInsets.fromLTRB(16, 16, 16, 0),
                    child: Text('Placeholder'),
                    // child: isShowingActiveJobsList
                    //     ? ListView(
                    //         controller: scrollController,
                    //         children: [
                    //           _buildActiveJobsList(context, activeJobList),
                    //         ],
                    //       )
                    //     : ListView(
                    //         controller: scrollController,
                    //         children: [
                    //           _buildAvaliableJobsList(
                    //               context, avaliableJobList),
                    //         ],
                    //       ),
                  ),
                );
              })),
          const Align(
            alignment: Alignment.topCenter,
            child: Padding(
              padding: EdgeInsets.all(8.0),
              child: DriverStatusMenuButton(),
            ),
          ),
        ],
      ),
    );
  }

  // StreamBuilder<List<JobWithDetails>> _buildActiveJobsList(
  //     BuildContext context, Stream<List<JobWithDetails>> stream) {
  //   return StreamBuilder(
  //     stream: stream,
  //     builder: (context, AsyncSnapshot<List<JobWithDetails>> snapshot) {
  //       if (snapshot.connectionState == ConnectionState.waiting) {
  //         return const Center(child: CircularProgressIndicator());
  //       }
  //       if (snapshot.hasError) {
  //         return Text('${snapshot.error}');
  //       } else {
  //         final jobs = snapshot.data ?? [];
  //         // if (jobs.isNotEmpty &&
  //         //     jobs.length == 1 &&
  //         //     snapshot.connectionState == ConnectionState.done) {
  //         //   setState(() {});
  //         // }
  //         if (activeJob == null) {
  //           WidgetsBinding.instance!.addPostFrameCallback((_) {
  //             setState(() {
  //               activeJob = jobs.first;
  //             });
  //           });
  //         }
  //         return Column(
  //           children: [
  //             if (ResponsiveWrapper.of(context).isSmallerThan(TABLET))
  //               SizedBox(
  //                 width: 50,
  //                 child: Divider(
  //                   thickness: 5,
  //                   color: Colors.grey.shade800,
  //                 ),
  //               ),
  //             Container(
  //               margin: const EdgeInsets.symmetric(horizontal: 16),
  //               child: Row(
  //                 mainAxisAlignment:
  //                     ResponsiveWrapper.of(context).isSmallerThan(TABLET)
  //                         ? MainAxisAlignment.spaceAround
  //                         : MainAxisAlignment.spaceBetween,
  //                 children: [
  //                   Text(
  //                     'Active Jobs',
  //                     style: headlineSmall(context),
  //                   ),
  //                   IconButton(
  //                       onPressed: () {
  //                         setState(() {
  //                           isShowingActiveJobsList = !isShowingActiveJobsList;
  //                         });
  //                       },
  //                       icon: const Icon(Icons.swap_horizontal_circle_sharp))
  //                 ],
  //               ),
  //             ),
  //             ListView.builder(
  //                 key: UniqueKey(),
  //                 shrinkWrap: true,
  //                 physics: const NeverScrollableScrollPhysics(),
  //                 itemCount: jobs.length,
  //                 itemBuilder: (_, index) {
  //                   final jobItem = jobs[index];
  //                   return ActiveJobCard(job: jobItem);
  //                 }),
  //           ],
  //         );
  //       }
  //     },
  //   );
  // }

  // StreamBuilder<List<JobWithDetails>> _buildAvaliableJobsList(
  //     BuildContext context, Stream<List<JobWithDetails>> stream) {
  //   return StreamBuilder(
  //     stream: stream,
  //     builder: (context, AsyncSnapshot<List<JobWithDetails>> snapshot) {
  //       if (snapshot.connectionState == ConnectionState.waiting) {
  //         return const Center(child: CircularProgressIndicator());
  //       }
  //       if (snapshot.hasError) {
  //         return Text('${snapshot.error}');
  //       } else {
  //         final jobs = snapshot.data ?? [];
  //         return Column(
  //           children: [
  //             if (ResponsiveWrapper.of(context).isSmallerThan(TABLET))
  //               SizedBox(
  //                 width: 50,
  //                 child: Divider(
  //                   thickness: 5,
  //                   color: Colors.grey.shade800,
  //                 ),
  //               ),
  //             Container(
  //               margin: const EdgeInsets.symmetric(horizontal: 16),
  //               child: Row(
  //                 mainAxisAlignment:
  //                     ResponsiveWrapper.of(context).isSmallerThan(TABLET)
  //                         ? MainAxisAlignment.spaceAround
  //                         : MainAxisAlignment.spaceBetween,
  //                 children: [
  //                   Text(
  //                     'Avaliable Jobs',
  //                     style: headlineSmall(context),
  //                   ),
  //                   IconButton(
  //                       onPressed: () {
  //                         setState(() {
  //                           isShowingActiveJobsList = !isShowingActiveJobsList;
  //                         });
  //                       },
  //                       icon: const Icon(Icons.swap_horizontal_circle_sharp))
  //                 ],
  //               ),
  //             ),
  //             ListView.builder(
  //                 key: UniqueKey(),
  //                 shrinkWrap: true,
  //                 physics: const NeverScrollableScrollPhysics(),
  //                 itemCount: jobs.length,
  //                 itemBuilder: (_, index) {
  //                   final jobItem = jobs[index];
  //                   return JobCard(jobWithDetails: jobItem);
  //                 }),
  //           ],
  //         );
  //       }
  //     },
  //   );
  // }
}

class VerticleInfoWindowButton extends StatelessWidget {
  final bool isOpen;
  const VerticleInfoWindowButton({
    Key? key,
    required this.isOpen,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const borderRadius = BorderRadius.only(
        topLeft: Radius.circular(16), topRight: Radius.circular(16));
    var elevation = 5.toDouble();
    const padding = EdgeInsets.fromLTRB(16, 8, 16, 0);
    return isOpen
        ? Tooltip(
            preferBelow: false,
            message: "Expand jobs panel",
            child: Material(
              elevation: elevation,
              borderRadius: borderRadius,
              child: Padding(
                padding: padding,
                child: Icon(Icons.arrow_drop_up, color: Colors.grey[700]),
              ),
            ),
          )
        : Tooltip(
            preferBelow: false,
            message: "Collapse jobs panel",
            child: Material(
              elevation: elevation,
              borderRadius: borderRadius,
              child: Padding(
                padding: padding,
                child: Icon(Icons.arrow_drop_down, color: Colors.grey[700]),
              ),
            ),
          );
  }
}
