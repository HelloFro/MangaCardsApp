import 'package:flutter/material.dart';

import 'package:flutter_pagewise/flutter_pagewise.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:jikan_api/jikan_api.dart';

import 'package:manga_cards_app/states/manga_util.dart';
import 'package:manga_cards_app/widgets/manga_card.dart';

class MangaList extends StatelessWidget {
  const MangaList({Key key, this.subtype}) : super(key: key);

  final TopSubtype subtype;

  @override
  Widget build(BuildContext context) {
    final _pageLoadController = PagewiseLoadController(
        pageFuture: (pageIndex) => jikan.read(context).getTop(TopType.manga, subtype: subtype ?? null, page: pageIndex + 1).then((value) => value.take(10).toList()),
        pageSize: 10,
    );

    return PagewiseListView(
      itemBuilder: (context, item, index) => MangaCard(top: item as Top, subtype: subtype),
      scrollDirection: Axis.horizontal,
      pageLoadController: _pageLoadController,
    );
  }
}