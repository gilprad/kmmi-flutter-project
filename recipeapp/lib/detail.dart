import 'package:flutter/material.dart';
import 'package:recipeapp/responsive.dart';
import 'package:recipeapp/textstyle.dart';
import 'recipe.dart';

class RecipeDetail extends StatefulWidget {
  final Recipe recipe;
  const RecipeDetail({Key? key, required this.recipe}) : super(key: key);

  @override
  _RecipeDetailState createState() => _RecipeDetailState();
}

class _RecipeDetailState extends State<RecipeDetail> {
  int _sliderVal = 1;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: CustomTextStyle(
              data: '${widget.recipe.label}',
              size: 24,
              weight: FontWeight.w500)),
      body: SafeArea(
          child: Column(
        children: [
          Container(
            width: displayWidth(context) * 0.9,
            height: displayHeight(context) * 0.4,
            margin: EdgeInsets.symmetric(vertical: 15),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                image: DecorationImage(
                    image: AssetImage(widget.recipe.path), fit: BoxFit.cover)),
          ),
          SizedBox(
            height: 4,
          ),
          CustomTextStyle(
              data: '${widget.recipe.label}',
              size: 20,
              weight: FontWeight.w400),
          SizedBox(
            height: 5,
          ),
          Expanded(
              child: ListView.builder(
            padding: EdgeInsets.all(8),
            itemCount: widget.recipe.ingredients.length,
            itemBuilder: (BuildContext context, int index) {
              final ingredient = widget.recipe.ingredients[index];
              return CustomTextStyle(
                  data:
                      '${ingredient.quantity * _sliderVal} ${ingredient.measure} ${ingredient.name}',
                  size: 18,
                  weight: FontWeight.w300);
            },
          )),
          Slider(
            min: 1,
            max: 10,
            divisions: 10,
            label: '${_sliderVal * widget.recipe.servings} servings',
            value: _sliderVal.toDouble(),
            onChanged: (newValue) {
              setState(() {
                _sliderVal = newValue.round();
              });
            },
            activeColor: Colors.blueAccent,
            inactiveColor: Colors.black,
          )
        ],
      )),
    );
  }
}
