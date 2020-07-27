import 'package:flutter/material.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:jikan_api/jikan_api.dart';
import 'package:url_launcher/url_launcher.dart';

import 'package:manga_cards_app/models/manga_detail_arguments.dart';
import 'package:manga_cards_app/states/manga_util.dart';
import 'package:manga_cards_app/widgets/circular_clipper.dart';

class MangaDetail extends StatelessWidget {
  const MangaDetail({Key key}) : super(key: key);

  // Potential for Localization
  static String title = "manga_detail";

  _launchURL(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    final MangaDetailArguments mangaDetails = ModalRoute.of(context).settings.arguments;
    final top = mangaDetails.top;
    final manga = jikan.readOwner(ProviderStateOwner()).getMangaInfo(top.malId);

    return SafeArea(
      child: Scaffold(
        body: ListView(
          children: <Widget>[
            Stack(
              children: <Widget>[
                Container(
                  child: Hero(
                    tag: mangaDetails.heroTag,
                    child: ClipShadowPath(
                      clipper: CircularClipper(),
                      shadow: Shadow(blurRadius: 20.0),
                      child: Image.network(
                        top.imageUrl,
                        height: MediaQuery.of(context).size.height / 2.5,
                        width: double.infinity,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  transform: Matrix4.translationValues(0, -50, 0),
                ),
                AppBar(
                  leading: IconButton(
                    color: Colors.tealAccent,
                    icon: Icon(Icons.arrow_back),
                    onPressed: () => Navigator.pop(context),
                    iconSize: 30,
                    tooltip: "Back",
                  ),
                  backgroundColor: Colors.transparent,
                  elevation: 0,
                ),
                Positioned.fill(
                  bottom: 20,
                  child: Align(
                    alignment: Alignment.bottomCenter,
                    child: FloatingActionButton(
                      onPressed: () => _launchURL(top
                          .url), // Launch external url, potentially launch in web view
                      elevation: 12,
                      backgroundColor: Colors.grey[800],
                      child: Icon(
                        Icons.web,
                        size: 35,
                        color: Colors.tealAccent,
                      ),
                      tooltip: "Web",
                    ),
                  ),
                ),
              ],
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 10),
              child: Text(
                top.title,
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),
            ),
            SizedBox(height: 10),
            FutureBuilder(
              future: manga,
              builder: (context, manga) {
                var info = manga.data as Manga;
                return info == null
                    ? Container(
                        height: 75,
                        child: CircularProgressIndicator(),
                        alignment: Alignment.center,
                        padding: EdgeInsets.all(5))
                    : Column(
                        children: <Widget>[
                          Text(
                            info.titleJapanese,
                            textAlign: TextAlign.center
                          ),
                          Container(
                            height: 50,
                            child: SingleChildScrollView(
                              child: Row(
                                children: List.generate(
                                  info?.genres?.length ?? 0,
                                  (index) => Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 5),
                                    child: Text(
                                      info.genres[index].name,
                                      style: Theme.of(context)
                                          .primaryTextTheme
                                          .caption,
                                    ),
                                  ),
                                ),
                              ),
                              scrollDirection: Axis.horizontal,
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: <Widget>[
                              Column(
                                children: <Widget>[
                                  Text(
                                    "Chapters",
                                    style: TextStyle(
                                      color: Colors.white54,
                                      fontSize: 16,
                                    ),
                                  ),
                                  SizedBox(height: 2),
                                  Text(
                                    info?.chapters?.toString() ?? "N/A",
                                    style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ],
                              ),
                              Column(
                                children: <Widget>[
                                  Text(
                                    "Volumes",
                                    style: TextStyle(
                                      color: Colors.white54,
                                      fontSize: 16,
                                    ),
                                  ),
                                  SizedBox(height: 2),
                                  Text(
                                    info?.volumes?.toString() ?? "N/A",
                                    style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ],
                              ),
                              Column(
                                children: <Widget>[
                                  Text(
                                    "Rank",
                                    style: TextStyle(
                                      color: Colors.white54,
                                      fontSize: 16,
                                    ),
                                  ),
                                  SizedBox(height: 2),
                                  Text(
                                    info.rank.toString(),
                                    style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ],
                              ),
                              Column(
                                children: <Widget>[
                                  Text(
                                    "Score",
                                    style: TextStyle(
                                      color: Colors.white54,
                                      fontSize: 16,
                                    ),
                                  ),
                                  SizedBox(height: 2),
                                  Text(
                                    info.score.toString(),
                                    style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ],
                              ),
                              Column(
                                children: <Widget>[
                                  Text(
                                    "Year",
                                    style: TextStyle(
                                      color: Colors.white54,
                                      fontSize: 16,
                                    ),
                                  ),
                                  SizedBox(height: 2),
                                  Text(
                                    info.published.from.split("-").first,
                                    style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                          SizedBox(height: 15),
                          Container(
                            child: Text(info.synopsis,
                                textAlign: TextAlign.center),
                            padding: EdgeInsets.symmetric(horizontal: 10),
                          ),
                          SizedBox(height: 15),
                          Column(
                            children: <Widget>[
                              Text(
                                "Author(s)",
                                style: TextStyle(
                                  color: Colors.white54,
                                  fontSize: 14,
                                ),
                              ),
                              SizedBox(height: 5),
                              SingleChildScrollView(
                                child: Row(
                                  children: List.generate(
                                    info?.authors?.length ?? 0,
                                    (index) => Padding(
                                      padding: const EdgeInsets.symmetric(horizontal: 5),
                                      child: Text(
                                        info.authors[index].name,
                                        style: Theme.of(context)
                                            .primaryTextTheme
                                            .caption,
                                      ),
                                    ),
                                  ),
                                ),
                                scrollDirection: Axis.horizontal,
                              ),
                            ],
                          ),
                          SizedBox(height: 15),
                        ],
                      );
              },
            ),
          ],
        ),
      ),
      top: true,
    );
  }
}
