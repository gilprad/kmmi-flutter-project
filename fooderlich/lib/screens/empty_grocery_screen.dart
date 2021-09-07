import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import '../models/models.dart';

class EmptyGroceryScreen extends StatelessWidget {
  const EmptyGroceryScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(30),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            AspectRatio(
              aspectRatio: 1 / 1,
              child: Image.asset('assets/empty_list.png'),
            ),
            SizedBox(
              height: 8,
            ),
            Text(
              'No Groceries',
              style: GoogleFonts.poppins(fontSize: 21),
            ),
            Text(
              'Shopping for ingredients?\n'
              'Tap the + button to write them down!',
              textAlign: TextAlign.center,
            ),
            MaterialButton(
              onPressed: () {
                Provider.of<TabManager>(context, listen: false).goToRecipe();
                print('Ok');
              },
              textColor: Colors.white,
              child: Text('Browse Recipes'),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30)),
              color: Colors.green,
            )
          ],
        ),
      ),
    );
  }
}
