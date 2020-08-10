import 'package:flutter/material.dart';

import 'package:manga_cards_app/widgets/login.dart';

class Authentication extends StatelessWidget {
  const Authentication({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () => Future.value(false),
          child: Scaffold(
        body: Login(),
      ),
    );
  }
}