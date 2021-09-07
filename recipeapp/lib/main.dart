import 'package:flutter/material.dart';
import 'package:recipeapp/detail.dart';
import 'package:recipeapp/recipe.dart';
import 'package:recipeapp/responsive.dart';
import 'package:recipeapp/textstyle.dart';

void main() {
  runApp(RecipeApp());
}

class RecipeApp extends StatelessWidget {
  const RecipeApp({Key? key}) : super(key: key);
  static const MaterialColor white = MaterialColor(0xFFFFFFFF, <int, Color>{
    50: Color(0xFFFFFFFF),
    100: Color(0xFFFFFFFF),
    200: Color(0xFFFFFFFF),
    300: Color(0xFFFFFFFF),
    400: Color(0xFFFFFFFF),
    500: Color(0xFFFFFFFF),
    600: Color(0xFFFFFFFF),
    700: Color(0xFFFFFFFF),
    800: Color(0xFFFFFFFF),
    900: Color(0xFFFFFFFF),
  });

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Recipe Calculator',
      theme: ThemeData(
        primarySwatch: white,
      ),
      home: MyHomePage(
        title: 'Recipe Calculator',
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: CustomTextStyle(
          data: '${widget.title}',
          color: Colors.black,
          size: 24,
          weight: FontWeight.w500,
        ),
      ),
      body: SafeArea(
          child: ListView.builder(
        itemCount: Recipe.samples.length,
        itemBuilder: (BuildContext context, int index) {
          return GestureDetector(
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return RecipeDetail(recipe: Recipe.samples[index]);
              }));
            },
            child: buildRecipeCard(Recipe.samples[index], context),
          );
        },
      )),
    );
  }
}

Widget buildRecipeCard(Recipe recipe, BuildContext context) {
  return Container(
      width: displayWidth(context) * 0.75,
      height: displayHeight(context) * 0.4,
      margin: EdgeInsets.symmetric(vertical: 20, horizontal: 15),
      child: Stack(
        children: [
          Positioned(
              left: 15,
              bottom: 20,
              child: CustomTextStyle(
                data: '${recipe.label}',
                size: 24,
                weight: FontWeight.bold,
                color: Colors.white,
              ))
        ],
      ),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(20)),
          image: DecorationImage(
            image: AssetImage('${recipe.path}'),
            fit: BoxFit.cover,
          )));
}
