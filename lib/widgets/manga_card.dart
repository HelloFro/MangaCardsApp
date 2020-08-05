import 'package:flutter/material.dart';

import 'package:jikan_api/jikan_api.dart';
import 'package:simple_gesture_detector/simple_gesture_detector.dart';

import 'package:manga_cards_app/models/manga_detail_arguments.dart';
import 'package:manga_cards_app/screens/manga_detail.dart';

class MangaCard extends StatelessWidget {
  MangaCard({this.top, this.subtype});
  
  final Top top;
  final TopSubtype subtype;

  @override
  Widget build(BuildContext context) {
    final heroTag = (top?.malId?.toString() ?? "") + (subtype?.toString() ?? "");

    return SimpleGestureDetector(
      child: Column(
        children: <Widget>[
          Container(
            child: Card(
              semanticContainer: true,
              clipBehavior: Clip.antiAliasWithSaveLayer,
              child: Center(
                child: Hero(
                  tag: heroTag,
                  child: Image.network(top.imageUrl, fit: BoxFit.fill,),
                ),
              ),
              elevation: 5,
              margin: EdgeInsets.symmetric(horizontal: 5, vertical: 10),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15),
              ),
            ),
            height: 200,
          ),
          Container(
            child: Text(
              top?.title ?? "",
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              style: Theme.of(context).textTheme.caption,
              textAlign: TextAlign.center,
            ),
            width: 100,
          ),
        ],
      ),
      onTap: () => Navigator.pushNamed(context, MangaDetail.title, arguments: MangaDetailArguments(top: top, heroTag: heroTag)),
    );
  }
}