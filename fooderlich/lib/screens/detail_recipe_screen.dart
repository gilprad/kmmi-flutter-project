import 'package:flutter/material.dart';
import 'package:fooderlich/api/recipe_model.dart';
import 'package:fooderlich/api/repository/memory_repository.dart';
import 'package:fooderlich/helper/responsive.dart';
import 'package:provider/provider.dart';

class DetailRecipeScreen extends StatefulWidget {
  const DetailRecipeScreen({Key key, this.recipeModel}) : super(key: key);
  final RecipeModel recipeModel;

  @override
  _DetailRecipeScreenState createState() => _DetailRecipeScreenState();
}

class _DetailRecipeScreenState extends State<DetailRecipeScreen> {
  bool isFavorite = false;
  @override
  Widget build(BuildContext context) {
    final MemoryRepository repository = Provider.of<MemoryRepository>(context);
    return Scaffold(
      body: SafeArea(
          child: Padding(
        padding: EdgeInsets.symmetric(vertical: 10),
        child: Column(
          children: [
            SizedBox(
              height: 10,
            ),
            Container(
                width: displayHeight(context) * 0.3,
                height: displayHeight(context) * 0.3,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    image: DecorationImage(
                        image: NetworkImage(widget.recipeModel.recipe.image),
                        fit: BoxFit.cover))),
            SizedBox(
              height: 20,
            ),
            Text(widget.recipeModel.recipe.label),
            SizedBox(
              height: 20,
            ),
            Text(
              widget.recipeModel.recipe.getCaloriesInfo(),
            ),
            SizedBox(height: 10),
            Center(
                child: ElevatedButton.icon(
                    style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20))),
                    onPressed: () {
                      setState(() {
                        isFavorite = !isFavorite;
                      });
                      repository.addRecipeToFavorite(widget.recipeModel);
                      repository.addGroceries(
                          widget.recipeModel.recipe.ingredientLines);
                      Navigator.pop(context);
                    },
                    icon: isFavorite
                        ? Icon(
                            Icons.favorite,
                            color: Colors.pink,
                          )
                        : Icon(Icons.favorite_border_outlined),
                    label: Text("Add to Favorite")))
          ],
        ),
      )),
    );
  }
}
