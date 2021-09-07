import 'package:flutter/material.dart';
import '../api/mock_fooderlich_service.dart';
import '../components/components.dart';

class RecipesScreen extends StatefulWidget {
  RecipesScreen({Key key}) : super(key: key);

  @override
  _RecipesScreenState createState() => _RecipesScreenState();
}

class _RecipesScreenState extends State<RecipesScreen> {
  final exploreService = MockFooderlichService();

  TextEditingController searchBarController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(children: [
        Positioned(
          child: FutureBuilder(
              future: exploreService.getRecipes(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.done) {
                  return RecipesGridView(recipes: snapshot.data);
                } else {
                  return const Center(child: CircularProgressIndicator());
                }
              }),
        ),
      ]),
    );
  }
}
