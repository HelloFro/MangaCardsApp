import 'package:flutter/material.dart';

import 'package:manga_cards_app/delegate.dart';
import 'package:manga_cards_app/screens/home.dart';
import 'package:manga_cards_app/screens/manga_detail.dart';

class App extends StatelessWidget {
  // routes and theme
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark(),
      themeMode: ThemeMode.system,
      home: Delegate(),
      routes: {
        Delegate.title: (context) => Delegate(),
        Home.title: (context) => Home(),
        MangaDetail.title: (context) => MangaDetail(),
      },
    );
  }
}