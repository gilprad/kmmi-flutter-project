import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:fooderlich/api/recipe.dart';
import 'package:fooderlich/api/recipe_model.dart';
import 'package:fooderlich/api/repository/memory_repository.dart';
import 'package:provider/provider.dart';

class FavoriteScreen extends StatefulWidget {
  const FavoriteScreen({Key key}) : super(key: key);

  @override
  _FavoriteScreenState createState() => _FavoriteScreenState();
}

class _FavoriteScreenState extends State<FavoriteScreen> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 20),
      child: buildRecipeList(),
    );
  }

  Widget buildRecipeList() {
    return Consumer<MemoryRepository>(builder: (context, repository, child) {
      List<RecipeModel> recipeModel = repository.getAllFavoritedRecipe();
      return ListView.builder(
        itemCount: recipeModel.length,
        itemBuilder: (BuildContext context, int index) {
          final Recipe recipe = recipeModel[index].recipe;
          return SizedBox(
            height: 100,
            child: Slidable(
              actionPane: SlidableDrawerActionPane(),
              actionExtentRatio: 0.25,
              child: Card(
                elevation: 1.0,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15)),
                child: Align(
                  alignment: Alignment.center,
                  child: Padding(
                    padding: EdgeInsets.all(8),
                    child: ListTile(
                      leading: CachedNetworkImage(
                        imageUrl: recipe.image,
                        height: 120,
                        width: 60,
                        fit: BoxFit.cover,
                      ),
                      title: Text(recipe.label),
                    ),
                  ),
                ),
              ),
              actions: [
                IconSlideAction(
                  caption: 'Delete',
                  color: Colors.transparent,
                  foregroundColor: Colors.red,
                  iconWidget: const Icon(
                    Icons.delete,
                    color: Colors.white,
                  ),
                  onTap: () => {
                    repository.deleteFavoritedRecipe(recipeModel[index]),
                    repository.deleteGroceries(recipe.ingredients)
                  },
                )
              ],
            ),
          );
        },
      );
    });
  }
}
