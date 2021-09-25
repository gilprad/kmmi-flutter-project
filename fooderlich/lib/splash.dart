// import 'dart:async';
// import 'package:flutter/material.dart';
// import 'package:fooderlich/helper/href.dart';
// import 'package:fooderlich/helper/theme.dart';
// import 'package:fooderlich/introduction.dart';

// class SplashScreen extends StatefulWidget {
//   const SplashScreen({Key key}) : super(key: key);

//   @override
//   SplashScreenState createState() => SplashScreenState();
// }

// class SplashScreenState extends State<SplashScreen> {
//   @override
//   void initState() {
//     super.initState();
//     Timer(
//         Duration(seconds: 3), () => Routes.stfReplace(context, Introduction()));
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         body: Center(
//       child: Text(
//         'Fooderlich',
//         style: FooderlichTheme.darkTextTheme.headline1,
//       ),
//     ));
//   }
// }
