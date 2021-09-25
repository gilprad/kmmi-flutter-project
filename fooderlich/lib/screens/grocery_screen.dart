import 'package:flutter/material.dart';
import 'package:fooderlich/api/repository/memory_repository.dart';
import 'empty_grocery_screen.dart';
import 'package:provider/provider.dart';

class GroceryScreen extends StatelessWidget {
  const GroceryScreen({Key key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: buildGroceryScreen(),
    );
  }

  Widget buildGroceryScreen() {
    return Consumer<MemoryRepository>(
      builder: (context, repository, child) {
        List<String> ingredient = repository.getAllGrocery();
        if (ingredient.isNotEmpty) {
          return ListView.separated(
              itemBuilder: (context, index) => CheckboxListTile(
                    value: false,
                    title: Text(ingredient[index]),
                    onChanged: (newValue) {},
                  ),
              separatorBuilder: (context, index) => Divider(),
              itemCount: ingredient.length);
        } else {
          return const EmptyGroceryScreen();
        }
      },
    );
  }
}
