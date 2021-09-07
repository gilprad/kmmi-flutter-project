import 'package:flutter/material.dart';
import 'package:fooderlich/components/circle_image.dart';
import 'package:fooderlich/helper/theme.dart';
import 'package:like_button/like_button.dart';

class AuthorCard extends StatefulWidget {
  final String authorName;
  final String title;
  final ImageProvider imageProvider;

  const AuthorCard({
    Key key,
    this.authorName,
    this.title,
    this.imageProvider,
  }) : super(key: key);

  @override
  _AuthorCardState createState() => _AuthorCardState();
}

class _AuthorCardState extends State<AuthorCard> {
  bool fav = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              CircleImage(
                imageProvider: widget.imageProvider,
                imageRadius: 28,
              ),
              SizedBox(
                width: 8,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.authorName,
                    style: FooderlichTheme.lightTextTheme.headline2,
                  ),
                  Text(
                    widget.title,
                    style: FooderlichTheme.lightTextTheme.headline3,
                  )
                ],
              ),
              SizedBox(
                width: 20,
              ),
              LikeButton()
              // IconButton(
              //   icon: fav ? Icon(Icons.favorite) : Icon(Icons.favorite_border),
              //   iconSize: 30,
              //   color: fav ? Colors.pink : Colors.grey[400],
              //   onPressed: () {
              //     setState(() {
              //       fav = !fav;
              //       if (fav == true) {
              //         const snackBar =
              //             SnackBar(content: Text('Added to favorite'));
              //         ScaffoldMessenger.of(context).showSnackBar(snackBar);
              //       } else if (!fav) {
              //         const snackBar =
              //             SnackBar(content: Text('Removed from favorite'));
              //         ScaffoldMessenger.of(context).showSnackBar(snackBar);
              //       }
              //     });
              //   },
              // )
            ],
          )
        ],
      ),
    );
  }
}
