import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:movies_app/service/api/api_provider.dart';
import 'package:movies_app/theme/theme_constants.dart';

class Detailspage extends StatelessWidget {
  final Results currentData;
  const Detailspage({Key key, this.currentData}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: NetworkImage(
                      'https://image.tmdb.org/t/p/w500/${currentData.backdropPath}',
                    ),
                    fit: BoxFit.cover)),
          ),
          ClipRRect(
            child: BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 4.6, sigmaY: 4.6),
                child: Container(
                  height: MediaQuery.of(context).size.height,
                  width: MediaQuery.of(context).size.width,
                  child: Stack(
                    children: [
                      Positioned(
                        left: 20,
                        top: kToolbarHeight,
                        child: FloatingActionButton(
                            elevation: 0,
                            backgroundColor: Colors.white24,
                            child: Center(
                              child: Icon(
                                Icons.arrow_back_ios,
                                size: 12,
                                color: Colors.grey,
                              ),
                            ),
                            mini: true,
                            onPressed: () {
                              Navigator.of(context).pop();
                            }),
                      ),
                      Positioned(
                          bottom: 0,
                          height: MediaQuery.of(context).size.height - 300 - 55,
                          left: 0,
                          right: 0,
                          child: Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 18.0),
                            child: Material(
                              borderRadius: BorderRadius.circular(12),
                              child: Container(
                                height: MediaQuery.of(context).size.height -
                                    300 -
                                    55,
                                width: 200,
                                child: Column(
                                  children: [
                                    SizedBox(height: 60),
                                    Text(
                                      currentData.title ??
                                          currentData.originalTitle ??
                                          currentData.name ??
                                          currentData.originalName ??
                                          "NO Data",
                                      style: AppThemeConstants.appFont
                                          .withSize(18)
                                          .withWeight(),
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(top: 8.0),
                                      child: Text(
                                          "${currentData.releaseDate.substring(0, 4)}"),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(top: 18.0),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceEvenly,
                                        children: [
                                          Column(
                                            children: [
                                              Row(
                                                children: [
                                                  Icon(
                                                    Icons.star,
                                                    color: Theme.of(context)
                                                        .colorScheme
                                                        .primary,
                                                  ),
                                                  Padding(
                                                    padding:
                                                        const EdgeInsets.only(
                                                            left: 3.0),
                                                    child: Text(
                                                        "${currentData.voteAverage}",
                                                        style: AppThemeConstants
                                                            .appFontAccent
                                                            .withSize(18)
                                                            .withWeight()),
                                                  ),
                                                ],
                                              ),
                                              Text("${currentData.voteCount}")
                                            ],
                                          ),
                                          Column(
                                            children: [
                                              Row(
                                                children: [
                                                  Icon(
                                                    Icons.signal_cellular_alt,
                                                    color: Theme.of(context)
                                                        .colorScheme
                                                        .secondaryVariant,
                                                  ),
                                                  Padding(
                                                    padding:
                                                        const EdgeInsets.only(
                                                            left: 3.0),
                                                    child: Text(
                                                        "${currentData.popularity}",
                                                        style: AppThemeConstants
                                                            .appFontAccent
                                                            .copyWith(
                                                                color:
                                                                    Colors.grey)
                                                            .withSize(18)
                                                            .withWeight()),
                                                  ),
                                                ],
                                              ),
                                              Text("popularity")
                                            ],
                                          ),
                                          Column(
                                            children: [
                                              Row(
                                                children: [
                                                  Icon(
                                                    Icons.language_outlined,
                                                    color: Theme.of(context)
                                                        .colorScheme
                                                        .secondary,
                                                  ),
                                                  Padding(
                                                    padding:
                                                        const EdgeInsets.only(
                                                            left: 3.0),
                                                    child: Text(
                                                        "${currentData.originalLanguage.toUpperCase()}",
                                                        style: AppThemeConstants
                                                            .appFont
                                                            .withSize(18)
                                                            .withWeight()),
                                                  ),
                                                ],
                                              ),
                                              Text("language")
                                            ],
                                          )
                                        ],
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ),
                          )),
                      Positioned(
                          top: 100,
                          height: 300,
                          left: 0,
                          right: 0,
                          child: Align(
                            alignment: Alignment.center,
                            child: Hero(
                              tag: "details-${currentData.id}",
                              child: Material(
                                borderRadius: BorderRadius.circular(12),
                                elevation: 6,
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(12),
                                  child: Container(
                                      width: 200,
                                      height: 300,
                                      color: Colors.red,
                                      child: Image.network(
                                        'https://image.tmdb.org/t/p/w500/${currentData.backdropPath}',
                                        fit: BoxFit.cover,
                                      )),
                                ),
                              ),
                            ),
                          )),
                    ],
                  ),
                )),
          )
        ],
      ),
    );
  }
}
