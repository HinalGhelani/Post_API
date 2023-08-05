import 'dart:math' as math;
import 'package:flutter/material.dart';
import 'package:practice/controllers/helper.dart';
import 'package:practice/modals/Cart_modals.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    theme: ThemeData(useMaterial3: true),
    routes: {
      '/': (context) => MyApp(),
    },
  ));
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final mobileController = TextEditingController();
  final passwordController = TextEditingController();
  final cCodeController = TextEditingController();

  callLogApi() {
    final service = APIHelper();

    service.fetchData({
      "mobile": mobileController.text,
      "ccode": cCodeController.text,
      "password": passwordController.text,
    }).then((value) {
      if (value.ResponseCode == 200) {
        print("========================");
        print("response code = ${value.ResponseCode}");
        print("response Message = ${value.ResponseMsg}");
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text(
            "Emoji",
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.w600,
            ),
          ),
          backgroundColor: Colors.black,
          elevation: 0.3,
        ),
        resizeToAvoidBottomInset: false,
        backgroundColor: Colors.white,
        body: Padding(
          padding: EdgeInsets.all(10),
          child: Column(
            children: [
              TextFormField(
                keyboardType: TextInputType.phone,
                controller: mobileController,
                decoration: InputDecoration(
                    hintText: "Mobile",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    )),
              ),
              TextFormField(
                controller: passwordController,
                obscureText: false,
                decoration: InputDecoration(
                    hintText: "password",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    )),
              ),
              TextFormField(
                controller: cCodeController,
                keyboardType: TextInputType.phone,
                decoration: InputDecoration(
                    hintText: "Country code",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    )),
              ),
              TextButton(
                onPressed: () {
                 setState(() {
                   callLogApi();
                 });
                },
                child: const Text("Save"),
              ),
              Text(
                  "${mobileController.text}  - ${cCodeController.text} - ${passwordController.text}")
            ],
          ),
        )

        // Padding(
        //   padding: EdgeInsets.all(10),
        //   child: FutureBuilder(
        //     future: APIHelper.apiHelper.fetchData(),
        //     builder: (context, snapshot) {
        //       if (snapshot.hasError) {
        //         return Center(
        //           child: Text("ERROR : ${snapshot.error}"),
        //         );
        //       } else if (snapshot.hasData) {
        //         Jokes? data = snapshot.data;
        //
        //         if (data != null) {
        //           return Column(
        //             children: [
        //               Container(
        //                 width: double.infinity,
        //                 padding: const EdgeInsets.all(10),
        //                 margin: const EdgeInsets.all(10),
        //                 decoration: BoxDecoration(
        //                     borderRadius: BorderRadius.circular(10),
        //                     border: Border.all(color: Colors.black, width: 2),
        //                     color: Colors.white),
        //                 child: Text(
        //                   "${data.punchline}",
        //                   style: const TextStyle(
        //                     fontSize: 15,
        //                     color:Colors.black
        //                     // Color((math.Random().nextDouble() * 0xffffff)
        //                     //         .toInt())
        //                     //     .withOpacity(0.8),
        //                   ),
        //                 ),
        //               ),
        //               const SizedBox(
        //                 height: 20,
        //               ),
        //               GestureDetector(
        //                 onTap: () {
        //                   setState(() {});
        //                 },
        //                 child: Container(
        //                   height: 50,
        //                   width: 150,
        //                   decoration: BoxDecoration(
        //                     color: Colors.black,
        //                     borderRadius: BorderRadius.circular(10),
        //                   ),
        //                   alignment: Alignment.center,
        //                   child: const Text(
        //                     "Change Jokes",
        //                     style: TextStyle(
        //                       fontSize: 15,
        //                       color: Colors.white,
        //                       fontWeight: FontWeight.w600,
        //                     ),
        //                   ),
        //                 ),
        //               )
        //             ],
        //           );
        //         }
        //       }
        //       return CircularProgressIndicator();
        //     },
        //   ),
        // ),
        );
  }
}

// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:get/get_core/src/get_main.dart';
// import 'package:practice/controllers/helper.dart';
//
// import '../modals/Cart_modals.dart';
// import 'package:practice/controllers/Cart_Controller.dart';
//
// void main() {
//   runApp(
//     MaterialApp(
//       theme: ThemeData(useMaterial3: true),
//       debugShowCheckedModeBanner: false,
//       routes: {
//         '/': (context) => const MyApp(),
//       },
//     ),
//   );
// }
//
// class MyApp extends StatefulWidget {
//   const MyApp({super.key});
//
//   @override
//   State<MyApp> createState() => _MyAppState();
// }
//
// class _MyAppState extends State<MyApp> {
//
//   bool isDesending = false;
//
//   @override
//   Widget build(BuildContext context) {
//     CartController cartController = Get.put(CartController());
//
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text(
//           "Get Material App",
//           style: TextStyle(
//             fontSize: 17,
//             fontWeight: FontWeight.w500,
//             color: Colors.white,
//           ),
//         ),
//         backgroundColor: Colors.black,
//         actions: [
//           IconButton(
//             onPressed: () {},
//             icon: const Icon(
//               Icons.filter_alt_rounded,
//               color: Colors.white,
//             ),
//           ),
//         ],
//       ),
//       body: Center(
//         child: Column(
//           children: [
//             Expanded(
//               flex: 1,
//               child: TextButton.icon(
//                 onPressed: () {
//                   setState(() {
//                   isDesending = !isDesending;
//                   print(isDesending);
//                   });
//                 },
//                 icon: const RotatedBox(
//                   quarterTurns: 1,
//                   child: Icon(Icons.compare_arrows),
//                 ),
//                 label: (isDesending == true)
//                     ? Text(
//                   "Assebding",
//                   style: TextStyle(
//                     color: Colors.indigo,
//                   ),
//                 )
//                     : Text(
//                   "Dessending",
//                   style: TextStyle(
//                     color: Colors.indigo,
//                   ),
//                 ),
//               ),
//
//             ),
//             Expanded(
//               flex: 11,
//               child: FutureBuilder(
//                 future: APIHelper.apiHelper.fetchData(),
//                 builder: (context, snapshot) {
//                   if (snapshot.hasError) {
//                     return Center(
//                       child: Text("Error : ${snapshot.error}"),
//                     );
//                   } else if (snapshot.hasData) {
//                     List data = snapshot.data as List;
//                     List<Cart> allProduct = data.map((e) => Cart(data: e)).toList();
//
//                     return ListView.builder(
//                         itemCount: allProduct.length,
//                         itemBuilder: (context, i) {
//                           final sortedItems = isDesending ? allProduct.reversed.toList() : allProduct;
//                           final item = sortedItems[i];
//                           return Card(
//                             elevation: 0.3,
//                             color: Colors.grey.shade200,
//                             child: ListTile(
//                               leading: SizedBox(
//                                 height: 60,
//                                 width: 60,
//                                 child: Image.network(
//                                   "${item.thumbnail}",
//                                   fit: BoxFit.fill,
//                                 ),
//                               ),
//                               title: Text("${item.title}"),
//                               subtitle: Column(
//                                 mainAxisAlignment: MainAxisAlignment.start,
//                                 crossAxisAlignment: CrossAxisAlignment.start,
//                                 children: [
//                                   Text(
//                                     "\$ ${item.price}",
//                                     style: const TextStyle(
//                                       fontWeight: FontWeight.w600,
//                                     ),
//                                   ),
//                                   Text(
//                                     "${item.description}",
//                                     style: TextStyle(
//                                       fontSize: 13,
//                                       color: Colors.grey.shade700,
//                                     ),
//                                   ),
//                                 ],
//                               ),
//                             ),
//                           );
//                         });
//                   }
//                   return const CircularProgressIndicator();
//                 },
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
//
//
// // import 'package:flutter/material.dart';
// // import 'package:intl/intl.dart';
// //
// // void main() {
// //   runApp(
// //     MaterialApp(
// //       theme: ThemeData(
// //         useMaterial3: true,
// //       ),
// //       debugShowCheckedModeBanner: false,
// //       routes: {
// //         '/': (context) => const MyApp(),
// //       },
// //     ),
// //   );
// // }
// //
// // class MyApp extends StatefulWidget {
// //   const MyApp({super.key});
// //
// //   @override
// //   State<MyApp> createState() => _MyAppState();
// // }
// //
// // class _MyAppState extends State<MyApp> with TickerProviderStateMixin {
// //   TabController? tabController;
// //
// //   DateTime now = DateTime.now();
// //
// //   late DateTime fourthBefore;
// //   late DateTime thirdBefore;
// //   late DateTime secondBefore;
// //   late DateTime yesterday;
// //   late DateTime nextDay;
// //   late DateTime secondNext;
// //   late DateTime thirdNext;
// //   late DateTime fourthNext;
// //
// //   @override
// //   void initState() {
// //     super.initState();
// //
// //     tabController = TabController(length: 9, vsync: this);
// //     // date = now.day as DateTime;
// //     fourthBefore = now.subtract(const Duration(days: 4));
// //     thirdBefore = now.subtract(const Duration(days: 3));
// //     secondBefore = now.subtract(const Duration(days: 2));
// //     yesterday = now.subtract(const Duration(days: 1));
// //     nextDay = now.add(const Duration(days: 1));
// //     secondNext = now.add(const Duration(days: 2));
// //     thirdNext = now.add(const Duration(days: 3));
// //     fourthNext = now.add(const Duration(days: 4));
// //
// //     print(yesterday);
// //   }
// //
// //   List l = [
// //     "25-Jul",
// //     "26-Jul",
// //     "Yesterday",
// //     "Today",
// //     "Tomorrow",
// //     "30-Jul",
// //     "31-Jul",
// //   ];
// //
// //   @override
// //   Widget build(BuildContext context) {
// //     return Scaffold(
// //       appBar: AppBar(
// //         title: const Text("Practice App"),
// //         bottom: PreferredSize(
// //           preferredSize: const Size.fromHeight(50),
// //           child: TabBar(
// //             isScrollable: true,
// //             controller: tabController,
// //             onTap: (i) {},
// //             tabs: [
// //               Tab(
// //                 child: Text("${fourthBefore.day - 4} - ${fourthBefore.month}"),
// //               ),
// //               Tab(
// //                 child: Text("${thirdBefore.day - 3} - ${thirdBefore.month}"),
// //               ),
// //               Tab(
// //                 child: Text("${secondBefore.day - 2} - ${secondBefore.month}"),
// //               ),
// //               Tab(
// //                 child: Text("${yesterday.day}-${yesterday.month}"),
// //               ),
// //               Tab(
// //                 child: Text("${now.day} - ${now.month}"),
// //               ),
// //               Tab(
// //                 child: Text("${nextDay.day} - ${nextDay.month}"),
// //               ),
// //               Tab(
// //                 child: Text("${secondNext.day} - ${secondNext.month}"),
// //               ),
// //               Tab(
// //                 child: Text("${thirdNext.day} - ${thirdNext.month}"),
// //               ),
// //               Tab(
// //                 child: Text("${fourthNext.day} - ${fourthNext.month}"),
// //               ),
// //             ],
// //           ),
// //         ),
// //         bottomOpacity: 0.9,
// //       ),
// //       body:  TabBarView(
// //         controller: tabController,
// //         children: const [
// //           Text("1"),
// //           Text("2"),
// //           Text("3"),
// //           Text("4"),
// //           Text("5"),
// //           Text("6"),
// //           Text("7"),
// //           Text("8"),
// //           Text("9"),
// //         ],
// //       ),
// //     );
// //   }
// // }
