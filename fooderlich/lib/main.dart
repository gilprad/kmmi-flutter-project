import 'package:flutter/material.dart';
import 'package:fooderlich/api/repository/memory_repository.dart';
import 'package:fooderlich/helper/theme.dart';
import 'package:fooderlich/home.dart';
import 'package:fooderlich/models/models.dart';
import 'package:provider/provider.dart';

Future<void> main() async {
  runApp(Fooderlich());
}

class Fooderlich extends StatelessWidget {
  const Fooderlich({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = FooderlichTheme.dark();

    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => TabManager(),
        ),
        ChangeNotifierProvider(
          create: (_) => GroceryManager(),
        ),
        ChangeNotifierProvider(
          create: (_) => MemoryRepository(),
        )
      ],
      child: MaterialApp(
        title: 'Fooderlich',
        theme: theme,
        debugShowCheckedModeBanner: false,
        home: Home(),
      ),
    );
  }
}
