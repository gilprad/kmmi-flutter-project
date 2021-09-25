// import 'package:flutter/material.dart';
// import 'package:flutter_svg/flutter_svg.dart';
// import 'package:fooderlich/helper/href.dart';
// import 'package:fooderlich/helper/responsive.dart';
// import 'package:fooderlich/home.dart';
// import 'package:google_fonts/google_fonts.dart';
// import 'package:introduction_screen/introduction_screen.dart';

// class Introduction extends StatefulWidget {
//   const Introduction({Key key}) : super(key: key);

//   @override
//   _IntroductionState createState() => _IntroductionState();
// }

// class _IntroductionState extends State<Introduction> {
//   @override
//   Widget build(BuildContext context) {
//     return SafeArea(
//         child: IntroductionScreen(
//       pages: [
//         PageViewModel(
//             title: 'Let\'s make some cake!',
//             body: 'Make it look\'s great too',
//             image: buildImage('assets/1.svg'),
//             decoration: pageDecoration()),
//         PageViewModel(
//             title: 'Some cookies!',
//             body: 'With a lot of choco chips',
//             image: buildImage('assets/2.svg'),
//             decoration: pageDecoration()),
//         PageViewModel(
//             title: 'And some of cupcake!',
//             body: 'Who doesn\'t love cupcake?',
//             image: buildImage('assets/3.svg'),
//             decoration: pageDecoration())
//       ],
//       done: Text('Get started!'),
//       showSkipButton: true,
//       next: Icon(Icons.arrow_forward_ios),
//       dotsDecorator: dotsDecorator(),
//       skip: Text(
//         'Skip',
//         style: TextStyle(fontSize: 18),
//       ),
//       onDone: () => Routes.stfReplace(context, Home()),
//     ));
//   }

//   Widget buildImage(String path) => Center(
//         child: SvgPicture.asset(
//           path,
//           height: displayHeight(context) * 0.3,
//         ),
//       );

//   PageDecoration pageDecoration() => PageDecoration(
//       titleTextStyle:
//           GoogleFonts.poppins(fontSize: 28, fontWeight: FontWeight.w600),
//       bodyTextStyle: TextStyle(fontSize: 20));

//   DotsDecorator dotsDecorator() => DotsDecorator(
//       size: Size(10, 10),
//       activeSize: Size(20, 10),
//       activeColor: Colors.tealAccent,
//       activeShape:
//           RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)));
// }
