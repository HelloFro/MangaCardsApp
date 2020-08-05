import 'package:flutter/material.dart';

import 'package:manga_cards_app/screens/authentication.dart';
import 'package:manga_cards_app/screens/home.dart';

class Delegate extends StatelessWidget {
  const Delegate({Key key}) : super(key: key);

  // Potential for Localization
  static String title = "delegate";

  @override
  Widget build(BuildContext context) {
    // TODO: Fix screen delegation logic
    return key == null ? Authentication() : Home();
  }
}