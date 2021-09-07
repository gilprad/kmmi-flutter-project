class Recipe {
  String label;
  String path;

  int servings;
  List<dynamic> ingredients;

  Recipe(this.label, this.path, this.servings, this.ingredients);

  static List<Recipe> samples = [
    Recipe(
      'Spaghetti and Meatballs',
      'assets/1.jpg',
      4,
      [
        Ingredient(1, 'box', 'Spaghetti'),
        Ingredient(4, '', 'Frozen Meatballs'),
        Ingredient(0.5, 'jar', 'sauce')
      ],
    ),
    Recipe('Grilled Cheese', 'assets/2.jpg', 4,
        [Ingredient(2, 'slice', 'Cheese'), Ingredient(2, 'slice', 'Bread')]),
    Recipe('Taco Salad', 'assets/3.jpg', 1, [
      Ingredient(4, 'oz', 'nachos'),
      Ingredient(3, 'oz', 'taco meat'),
      Ingredient(0.5, 'cup', 'cheese'),
      Ingredient(0.25, 'cup', 'choped tomatoes')
    ]),
    Recipe('Hawaiian Pizza', 'assets/4.jpg', 4, [
      Ingredient(1, 'item', 'pizza'),
      Ingredient(1, 'cup', 'pineapple'),
      Ingredient(8, 'oz', 'ham')
    ]),
    Recipe('Chocolate Chip Cookies', 'assets/5.jpg', 24, [
      Ingredient(4, 'cups', 'flour'),
      Ingredient(2, 'cups', 'sugar'),
      Ingredient(0.5, 'cups', 'chocolate chips')
    ]),
    Recipe(
        'Tomato Soup', 'assets/6.jpg', 2, [Ingredient(1, 'can', 'Tomato soup')])
  ];
}

class Ingredient {
  double quantity;
  String measure;
  String name;

  Ingredient(this.quantity, this.measure, this.name);
}
