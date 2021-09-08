import 'package:flutter/material.dart';
import 'package:fooderlich/models/models.dart';
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
                      final data =
                          pref.getStringList('search').reversed.toList() ?? [];
                      showSearch(
                          context: context,
                          delegate: SearchData(data: data, pref: pref));
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

class SearchData extends SearchDelegate<String> {
  List<String> data;
  SharedPreferences pref;

  SearchData({this.data, this.pref});

  void addSearch() {
    if (query.isNotEmpty) {
      data.add(query);
      pref.setStringList('search', data);
    }
  }

  void removeSearch(int index) {
    data.removeAt(index);
    pref.setStringList('search', data);
  }

  void refreshSearch() {
    data = pref.getStringList('search');
  }

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
    addSearch();
    return Container();
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    return ListView.builder(
        itemCount: data.length > 10 ? 10 : data.length,
        itemBuilder: (context, index) => ListTile(
              title: Text(data[index]),
              leading: Icon(Icons.history),
              trailing: IconButton(
                icon: Icon(Icons.clear),
                onPressed: () {
                  removeSearch(index);
                },
              ),
            ));
  }
}
