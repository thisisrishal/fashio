// import 'package:flutter/material.dart';

// class MyApp extends StatelessWidget {
//   const MyApp({Key? key}) : super(key: key);

//   // This widget is the root of your application.
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Tab inside body widget',
//       debugShowCheckedModeBanner: false,
//       theme: ThemeData(
//         primarySwatch: Colors.green,
//         visualDensity: VisualDensity.adaptivePlatformDensity,
//       ),
//       home: MyHomePage(),
//     );
//   }
// }

// class MyHomePage extends StatefulWidget {
//   @override
//   _MyHomePageState createState() => _MyHomePageState();
// }

// class _MyHomePageState extends State<MyHomePage> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Tabs Example'),
//       ),
//       body: Container(
//         child: Column(
//             crossAxisAlignment: CrossAxisAlignment.stretch,
//             children: <Widget>[
//               const SizedBox(height: 20.0),
//               const Text('Tabs Inside Body',
//                   textAlign: TextAlign.center, style: TextStyle(fontSize: 22)),
//               DefaultTabController(
//                   length: 8, // length of tabs
//                   initialIndex: 0,
//                   child: Column(

//                       // crossAxisAlignment: CrossAxisAlignment.stretch,
//                       children: <Widget>[
//                         Container(
//                           child: const TabBar(
//                             isScrollable: true,
//                             labelColor: Colors.green,
//                             unselectedLabelColor: Colors.black,
//                             tabs: [
//                               Tab(text: 'Tab 1'),
//                               Tab(text: 'Tab 2'),
//                               Tab(text: 'Tab 3'),
//                               Tab(text: 'Tab 4'),
//                               Tab(text: 'Tab 1'),
//                               Tab(text: 'Tab 2'),
//                               Tab(text: 'Tab 3'),
//                               Tab(text: 'Tab 4'),
//                             ],
//                           ),
//                         ),
//                         Container(
//                             height: 400, //height of TabBarView
//                             decoration: const BoxDecoration(
//                                 border: Border(
//                                     top: BorderSide(
//                                         color: Colors.grey, width: 0.5))),
//                             child: TabBarView(children: <Widget>[
//                               Container(
//                                 child: const Center(
//                                   child: Text('Display Tab 1',
//                                       style: TextStyle(
//                                           fontSize: 22,
//                                           fontWeight: FontWeight.bold)),
//                                 ),
//                               ),
//                               Container(
//                                 child: const Center(
//                                   child: Text('Display Tab 2',
//                                       style: TextStyle(
//                                           fontSize: 22,
//                                           fontWeight: FontWeight.bold)),
//                                 ),
//                               ),
//                               Container(
//                                 child: const Center(
//                                   child: Text('Display Tab 3',
//                                       style: TextStyle(
//                                           fontSize: 22,
//                                           fontWeight: FontWeight.bold)),
//                                 ),
//                               ),
//                               Container(
//                                 child: const Center(
//                                   child: Text('Display Tab 4',
//                                       style: TextStyle(
//                                           fontSize: 22,
//                                           fontWeight: FontWeight.bold)),
//                                 ),
//                               ),
//                               Container(
//                                 child: const Center(
//                                   child: Text('Display Tab 1',
//                                       style: TextStyle(
//                                           fontSize: 22,
//                                           fontWeight: FontWeight.bold)),
//                                 ),
//                               ),
//                               Container(
//                                 child: const Center(
//                                   child: Text('Display Tab 2',
//                                       style: TextStyle(
//                                           fontSize: 22,
//                                           fontWeight: FontWeight.bold)),
//                                 ),
//                               ),
//                               Container(
//                                 child: const Center(
//                                   child: Text('Display Tab 3',
//                                       style: TextStyle(
//                                           fontSize: 22,
//                                           fontWeight: FontWeight.bold)),
//                                 ),
//                               ),
//                               Container(
//                                 child: const Center(
//                                   child: Text('Display Tab 4',
//                                       style: TextStyle(
//                                           fontSize: 22,
//                                           fontWeight: FontWeight.bold)),
//                                 ),
//                               ),
//                             ]))
//                       ])),
//             ]),
//       ),
//     );
//   }
// }
