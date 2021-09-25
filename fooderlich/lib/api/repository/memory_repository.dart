import 'package:flutter/foundation.dart';
import 'package:fooderlich/api/ingredient.dart';
import 'package:fooderlich/api/recipe_model.dart';
import 'package:fooderlich/api/repository/repository.dart';

class MemoryRepository extends Repository with ChangeNotifier {
  List<RecipeModel> _favoritedRecipes = [];
  List<String> _groceries = [];
  List<Ingredient> _ingredient = <Ingredient>[];

  @override
  void addGroceries(List<String> values) {
    _groceries.addAll(values);
    notifyListeners();
  }

  @override
  void addRecipeToFavorite(RecipeModel recipe) {
    _favoritedRecipes.add(recipe);
    notifyListeners();
  }

  @override
  void deleteFavoritedRecipe(RecipeModel recipe) {
    _favoritedRecipes.remove(recipe);
    notifyListeners();
  }

  @override
  void deleteGroceries(List<Ingredient> ingredients) {
    _ingredient.removeWhere((ingredient) => ingredients.contains(ingredient));
    notifyListeners();
  }

  @override
  List<RecipeModel> getAllFavoritedRecipe() {
    return _favoritedRecipes;
  }

  @override
  List<String> getAllGrocery() {
    return _groceries;
  }

  @override
  void close() {}

  @override
  Future init() async {
    return Future.value(null);
  }

  @override
  RecipeModel findFavoritedRecipeByUri(String uri) {
    return _favoritedRecipes.firstWhere((element) => element.recipe.uri == uri);
  }
}
