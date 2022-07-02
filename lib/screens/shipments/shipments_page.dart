import 'package:flutter/material.dart';

class ShipmentsPage extends StatefulWidget {
  const ShipmentsPage({Key? key}) : super(key: key);

  @override
  State<ShipmentsPage> createState() => _ShipmentsPageState();
}

class _ShipmentsPageState extends State<ShipmentsPage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 2,
        child: Scaffold(
          body: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
                child: Container(
                  constraints: const BoxConstraints(maxWidth: 500),
                  decoration: BoxDecoration(
                      color: Colors.grey[300],
                      borderRadius: BorderRadius.circular(50)),
                  child: Padding(
                    padding:
                        const EdgeInsets.symmetric(vertical: 10, horizontal: 0),
                    child: TabBar(
                        onTap: (i) {
                          setState(() {});
                        },
                        unselectedLabelColor: Colors.red[900],
                        indicatorSize: TabBarIndicatorSize.label,
                        indicator: BoxDecoration(
                            borderRadius: BorderRadius.circular(50),
                            color: Colors.red[900]),
                        tabs: [
                          Tab(
                            child: Container(
                              constraints: const BoxConstraints(minWidth: 300),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(50),
                              ),
                              child: const Align(
                                alignment: Alignment.center,
                                child: Text(
                                  "Current",
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      letterSpacing: 1),
                                ),
                              ),
                            ),
                          ),
                          Tab(
                            child: Container(
                              // constraints: const BoxConstraints(maxWidth: 300),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(50),
                              ),
                              child: const Align(
                                alignment: Alignment.center,
                                child: Text(
                                  "History",
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      letterSpacing: 1),
                                ),
                              ),
                            ),
                          ),
                        ]),
                  ),
                ),
              ),
              const Expanded(
                child: TabBarView(children: [
                  Center(
                    child: Text('Current'),
                  ),
                  Center(
                    child: Text('History'),
                  ),
                  // JobsAvaliable(
                  //   jobDao: dao,
                  // ),
                  // JobHistory(
                  //   jobDao: dao,
                  // ),
                ]),
              ),
            ],
          ),
        ));
  }
}

// class JobsAvaliable extends StatefulWidget {
//   final JobDao jobDao;
//   const JobsAvaliable({
//     Key? key,
//     required this.jobDao,
//   }) : super(key: key);

//   @override
//   State<JobsAvaliable> createState() => _JobsAvaliableState();
// }

// class _JobsAvaliableState extends State<JobsAvaliable> {
//   Future<List<JobWithDetails>> loadJobList() async {
//     return await widget.jobDao.getAllJobswithDetails();
//   }

//   @override
//   void initState() {
//     if (mounted) {
//       setState(() {});
//     }
//     super.initState();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return FutureBuilder(
//       future: loadJobList(),
//       builder: (context, AsyncSnapshot<List<JobWithDetails>> snapshot) {
//         if (snapshot.connectionState == ConnectionState.waiting) {
//           return const CircularProgressIndicator();
//         }
//         if (snapshot.hasError) {
//           return Text('${snapshot.error}');
//         } else {
//           final jobs = snapshot.data ?? [];
//           return ListView.builder(
//               shrinkWrap: true,
//               itemCount: jobs.length,
//               itemBuilder: (_, index) {
//                 final jobItem = jobs[index];

//                 return JobCard(jobWithDetails: jobItem);
//               });
//         }
//       },
//     );
//   }
// }

// class JobHistory extends StatefulWidget {
//   final JobDao jobDao;
//   const JobHistory({
//     Key? key,
//     required this.jobDao,
//   }) : super(key: key);

//   @override
//   State<JobHistory> createState() => _JobHistoryState();
// }

// class _JobHistoryState extends State<JobHistory> {
//   late Future<List<JobWithDetails>> futureJobs;

//   @override
//   void initState() {
//     super.initState();
//     if (mounted) {
//       setState(() {});
//     }
//   }

//   Future<List<JobWithDetails>> loadJobHistory() async {
//     return await widget.jobDao.getAllPreviousJobswithDetails();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return FutureBuilder(
//       future: loadJobHistory(),
//       builder: (context, AsyncSnapshot<List<JobWithDetails>> snapshot) {
//         if (snapshot.hasData) {
//           if (snapshot.data!.isNotEmpty) {
//             final jobs = snapshot.data;
//             return ListView.builder(
//                 shrinkWrap: true,
//                 itemCount: jobs?.length,
//                 itemBuilder: (_, index) {
//                   final jobItem = jobs![index];

//                   return JobCard(jobWithDetails: jobItem);
//                 });
//           } else {
//             return const Center(child: Text('Empty'));
//           }
//         } else {
//           return const Center(child: CircularProgressIndicator());
//         }
//       },
//     );
//   }
// }
