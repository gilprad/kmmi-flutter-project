import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:fooderlich/api/dio.dart';
import 'package:fooderlich/api/recipe_model.dart';
import 'package:fooderlich/models/models.dart';
import 'package:fooderlich/models/search_manager.dart';
import 'package:fooderlich/screens/explore_screen.dart';
import 'package:fooderlich/screens/recipe_screen.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'screens/grocery_screen.dart';

class Home extends StatefulWidget {
  const Home({Key key}) : super(key: key);
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  // Future<List<RecipeModel>> getData() async {
  //   List<RecipeModel> results = [];
  //   Response response =
  //       await DioClient.callApi("https://api.edamam.com/api/recipes/v2", {
  //     "app_id": "e1f7a262",
  //     "app_key": "89c83ac9688ebca6ae26d791c475725d",
  //     "type": "public",
  //     "q": keyword
  //   });
  //   if (response.data != null) {
  //     var responseJson = jsonDecode(jsonEncode(response.data));
  //     results = RecipeModel.fromListDynamic(responseJson['hits']);
  //   }

  //   return results;
  // }

  Future<SharedPreferences> pref = SharedPreferences.getInstance();

  static List<Widget> pages = <Widget>[
    ExploreScreen(),
    RecipesScreen(),
    const GroceryScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    // 1
    return Consumer<TabManager>(
      builder: (context, tabManager, child) {
        return Scaffold(
          resizeToAvoidBottomInset: false,
          appBar: AppBar(
            actions: [
              IconButton(
                  onPressed: () {
                    pref.then((pref) {
                      final searchData =
                          pref.getStringList('search').toList() ?? [];
                      showSearch(
                        context: context,
                        delegate:
                            SearchData(searchData: searchData, pref: pref),
                      );
                    });
                  },
                  icon: const Icon(Icons.search))
            ],
            title: Text(
              'Fooderlich',
              style: Theme.of(context).textTheme.headline6,
            ),
          ),
          body: IndexedStack(index: tabManager.selectedTab, children: pages),
          bottomNavigationBar: BottomNavigationBar(
            selectedItemColor:
                Theme.of(context).textSelectionTheme.selectionColor,
            currentIndex: tabManager.selectedTab,
            onTap: (index) {
              tabManager.goToTab(index);
            },
            items: <BottomNavigationBarItem>[
              const BottomNavigationBarItem(
                icon: Icon(Icons.explore),
                label: 'Explore',
              ),
              const BottomNavigationBarItem(
                icon: Icon(Icons.book),
                label: 'Recipes',
              ),
              const BottomNavigationBarItem(
                icon: Icon(Icons.list),
                label: 'To Buy',
              ),
            ],
          ),
        );
      },
    );
  }
}

class SearchData extends SearchDelegate<String> with ChangeNotifier {
  List<String> searchData;
  SharedPreferences pref;

  SearchData({this.searchData, this.pref});

  @override
  String get searchFieldLabel => 'Search recipe';

  Future<List<RecipeModel>> getData(query) async {
    List<RecipeModel> results = [];
    Response response =
        await DioClient.callApi("https://api.edamam.com/api/recipes/v2", {
      "app_id": "e1f7a262",
      "app_key": "89c83ac9688ebca6ae26d791c475725d",
      "type": "public",
      "q": query
    });
    if (response.data != null) {
      var responseJson = jsonDecode(jsonEncode(response.data));
      results = RecipeModel.fromListDynamic(responseJson['hits']);
    }
    return results;
  }

  void addSearch() {
    if (query.isNotEmpty) {
      searchData.add(query);
      pref.setStringList('search', searchData);
    }
  }

  // void removeSearch(int index) {
  //   data.removeAt(index);
  //   pref.setStringList('search', data);
  // }

  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
          onPressed: () {
            query = '';
          },
          icon: Icon(Icons.clear))
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
        onPressed: () {
          close(context, null);
        },
        icon: AnimatedIcon(
          icon: AnimatedIcons.menu_arrow,
          progress: transitionAnimation,
        ));
  }

  @override
  Widget buildResults(BuildContext context) {
    return FutureBuilder<List<RecipeModel>>(
        future: getData(query),
        builder: (ctx, snapshot) {
          if (snapshot.hasData) {
            return ListView.separated(
              separatorBuilder: (context, index) => Divider(),
              itemCount: snapshot.data.length,
              itemBuilder: (context, index) => ListTile(
                leading: Image.network(snapshot.data[index].recipe.image),
                title: Text(snapshot.data[index].recipe.label),
                onTap: () {},
              ),
            );
          } else if (snapshot.hasError) {
            return Text(snapshot.data.toString());
          }
          return Center(child: CircularProgressIndicator());
        });
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    return ListView.builder(
        itemCount: searchData.length > 10 ? 10 : searchData.length,
        itemBuilder: (context, index) => ListTile(
              onTap: () {
                query = searchData[index];
                showResults(context);
              },
              title: Text(searchData[index]),
              leading: Icon(Icons.history),
              trailing: IconButton(
                icon: Icon(Icons.clear),
                onPressed: () {},
              ),
            ));
  }
}
