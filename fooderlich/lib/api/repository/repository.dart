import 'package:fooderlich/api/recipe_model.dart';

import '../ingredient.dart';

abstract class Repository {
  Future init();
  void close();

  List<RecipeModel> getAllFavoritedRecipe();
  RecipeModel findFavoritedRecipeByUri(String uri);
  void addRecipeToFavorite(RecipeModel recipe);
  void deleteFavoritedRecipe(RecipeModel recipe);

  List<String> getAllGrocery();
  void addGroceries(List<String> values);
  void deleteGroceries(List<Ingredient> ingredients);
}
