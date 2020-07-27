import 'package:flutter/material.dart';
import 'package:jikan_api/jikan_api.dart';

import 'package:manga_cards_app/widgets/manga_list.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          centerTitle: true,
          title: Text("Top Manga App"),
        ),
        body: ListView(
          children: <Widget>[
            SizedBox(height: 10),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: Text(
                    "Top Manga",
                    style: Theme.of(context).primaryTextTheme.headline6,
                  ),
                ),
                Container(height: 230, child: MangaList()),
              ],
            ),
            SizedBox(height: 10),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: Text(
                    "Top Manhwa",
                    style: Theme.of(context).primaryTextTheme.headline6,
                  ),
                ),
                Container(height: 230, child: MangaList(subtype: TopSubtype.manhwa)),
              ],
            ),
            SizedBox(height: 10),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: Text(
                    "Top Manhua",
                    style: Theme.of(context).primaryTextTheme.headline6,
                  ),
                ),
                Container(height: 230, child: MangaList(subtype: TopSubtype.manhua)),
              ],
            ),
            SizedBox(height: 10),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: Text(
                    "Favorites",
                    style: Theme.of(context).primaryTextTheme.headline6,
                  ),
                ),
                Container(height: 230, child: MangaList(subtype: TopSubtype.favorite)),
              ],
            ),
            SizedBox(height: 10),
          ],
        ),
      ),
      top: true,
    );
  }
}
