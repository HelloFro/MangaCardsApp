import 'package:flutter/material.dart';

import 'package:manga_cards_app/screens/manga_detail.dart';
import 'package:manga_cards_app/screens/home.dart';

class App extends StatelessWidget {
  // routes and theme
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark(),
      themeMode: ThemeMode.system,
      home: Home(),
      routes: {
        Home.title: (context) => Home(),
        MangaDetail.title: (context) => MangaDetail(),
      },
    );
  }
}