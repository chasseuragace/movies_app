import 'dart:ui';

import 'package:flutter/material.dart';

import 'package:movies_app/features/homepage/ui/details_page/details_manager.dart';
import 'package:movies_app/features/homepage/ui/details_page/modal/details_response.dart'
    as details;
import 'package:movies_app/features/homepage/ui/trendingPage/modal/trending_response.dart';
import 'package:movies_app/service/api/api_provider.dart';
import 'package:movies_app/theme/theme_constants.dart';

class Detailspage extends StatefulWidget {
  final Results currentData;
  Detailspage({Key key, this.currentData}) : super(key: key);

  @override
  State<Detailspage> createState() => _DetailspageState();
}

class _DetailspageState extends State<Detailspage> {
  DetailsManager detailManager;
  @override
  void initState() {
    detailManager = DetailsManager(id: widget.currentData.id);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          //todo : refractor as Background Image
          Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: NetworkImage(
                      'https://image.tmdb.org/t/p/w500/${widget.currentData.backdropPath}',
                    ),
                    fit: BoxFit.cover)),
          ),
          //todo : refractor as BackgroundBlur
          ClipRRect(
            child: BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 4.6, sigmaY: 4.6),
                child: Container(
                  height: MediaQuery.of(context).size.height,
                  width: MediaQuery.of(context).size.width,
                  child: Stack(
                    children: [
                      //todo : refractor as CustomBackButton
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
                                height:
                                    MediaQuery.of(context).size.height - 300,
                                width: 200,
                                child: SingleChildScrollView(
                                  //todo : refractor as DetailsBody
                                  child: Column(
                                    children: [
                                      SizedBox(height: 60),
                                      Text(
                                        widget.currentData.title ??
                                            widget.currentData.originalTitle ??
                                            widget.currentData.name ??
                                            widget.currentData.originalName ??
                                            "NO Data",
                                        style: AppThemeConstants.appFont
                                            .withSize(18)
                                            .withWeight(),
                                        maxLines: 1,
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                      Padding(
                                        padding:
                                            const EdgeInsets.only(top: 8.0),
                                        child: Text(
                                            "${widget.currentData.releaseDate?.substring(0, 4) ?? 'unknown'}"),
                                      ),
                                      Padding(
                                        padding:
                                            const EdgeInsets.only(top: 18.0),
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
                                                          "${widget.currentData.voteAverage}",
                                                          style:
                                                              AppThemeConstants
                                                                  .appFontAccent
                                                                  .withSize(18)
                                                                  .withWeight()),
                                                    ),
                                                  ],
                                                ),
                                                Text(
                                                    "${widget.currentData.voteCount}")
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
                                                          "${widget.currentData.popularity}",
                                                          style: AppThemeConstants
                                                              .appFontAccent
                                                              .copyWith(
                                                                  color: Colors
                                                                      .grey)
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
                                                          "${widget.currentData.originalLanguage.toUpperCase()}",
                                                          style:
                                                              AppThemeConstants
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
                                      ),
                                      SizedBox(
                                        height: 550,
                                        child: DefaultTabController(
                                            length: 5,
                                            child: SizedBox(
                                              /// height: 700,
                                              width: MediaQuery.of(context)
                                                  .size
                                                  .width,
                                              child: Column(children: [
                                                TabBar(
                                                    isScrollable: true,
                                                    tabs: [
                                                      Tab(
                                                        text: 'Overview',
                                                      ),
                                                      Tab(
                                                        text: 'Episodes',
                                                      ),
                                                      Tab(
                                                        text: 'Details',
                                                      ),
                                                      Tab(
                                                        text: 'Review',
                                                      ),
                                                      Tab(
                                                        text: 'Discussion',
                                                      ),
                                                    ]),
                                                Expanded(
                                                    child: TabBarView(
                                                        children: List.generate(
                                                            5,
                                                            (index) => Padding(
                                                                  padding:
                                                                      const EdgeInsets
                                                                              .all(
                                                                          8.0),
                                                                  child: Column(
                                                                      crossAxisAlignment:
                                                                          CrossAxisAlignment
                                                                              .start,
                                                                      children: [
                                                                        Text(
                                                                            "Storyline",
                                                                            style:
                                                                                TextStyle().withWeight(weight: 9)),
                                                                        Padding(
                                                                          padding:
                                                                              const EdgeInsets.only(top: 8.0),
                                                                          child: Text(widget
                                                                              .currentData
                                                                              .overview),
                                                                        ),
                                                                        ValueListenableBuilder(
                                                                            valueListenable: detailManager
                                                                                .detailsFetchState,
                                                                            builder: (context,
                                                                                value,
                                                                                child) {
                                                                              return value == DataFetchState.LOADED
                                                                                  ? Column(
                                                                                      crossAxisAlignment: CrossAxisAlignment.start,
                                                                                      children: [
                                                                                        Wrap(
                                                                                          children: [
                                                                                            ...List.generate(
                                                                                                detailManager.detailsData.genres.length,
                                                                                                (index) => Padding(
                                                                                                      padding: const EdgeInsets.only(right: 8.0, top: 8.0),
                                                                                                      child: Text(detailManager.detailsData.genres[index].name + "${index == detailManager.detailsData.genres.length - 1 ? "" : "  /"}"),
                                                                                                    ))
                                                                                          ],
                                                                                        ),
                                                                                        DefaultTabController(
                                                                                            length: 2,
                                                                                            child: Column(
                                                                                              crossAxisAlignment: CrossAxisAlignment.start,
                                                                                              children: [
                                                                                                SizedBox(
                                                                                                    width: 140,
                                                                                                    child: TabBar(
                                                                                                      tabs: ["Cast", "Crew"]
                                                                                                          .map((e) => Tab(
                                                                                                                child: Text(e),
                                                                                                              ))
                                                                                                          .toList(),
                                                                                                      labelPadding: EdgeInsets.zero,
                                                                                                      indicatorSize: TabBarIndicatorSize.tab,
                                                                                                    )),
                                                                                                SizedBox(
                                                                                                  height: 200,
                                                                                                  child: TabBarView(
                                                                                                      physics: NeverScrollableScrollPhysics(),
                                                                                                      children: List.generate(
                                                                                                        2,
                                                                                                        (index) => Padding(
                                                                                                          padding: const EdgeInsets.all(8.0),
                                                                                                          child: Container(height: 120, child: CastCrewList(detailManager: detailManager, isCrew: index == 1)),
                                                                                                        ),
                                                                                                      )),
                                                                                                )
                                                                                              ],
                                                                                            ))
                                                                                      ],
                                                                                    )
                                                                                  : Text("Loading");
                                                                            })
                                                                      ]),
                                                                )))),
                                              ]),
                                            )),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          )),
                      // //todo : refractor as CenterImage
                      Positioned(
                          top: 100,
                          height: 300,
                          left: 0,
                          right: 0,
                          child: Align(
                            alignment: Alignment.center,
                            child: Hero(
                              tag: "details-${widget.currentData.id}",
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
                                        'https://image.tmdb.org/t/p/w500/${widget.currentData.backdropPath}',
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

class CastCrewList extends StatelessWidget {
  final isCrew;
  const CastCrewList({
    Key key,
    @required this.detailManager,
    this.isCrew = false,
  }) : super(key: key);

  final DetailsManager detailManager;

  @override
  Widget build(BuildContext context) {
    final crews = detailManager.getCrew;
    final cast = detailManager.getCast;
    return ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: (isCrew ? (crews) : (cast)).length,
        itemBuilder: (c, i) => Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                width: 128,
                child: Column(
                  children: [
                    Expanded(
                        child: Image.network(
                      "https://image.tmdb.org/t/p/w500/${(isCrew ? crews.elementAt(i).profilePath : cast.elementAt(i).profilePath)}",
                    )),
                    Padding(
                      padding: const EdgeInsets.only(top: 8.0),
                      child: Text((isCrew
                          ? crews.elementAt(i).name
                          : cast.elementAt(i).name)),
                    )
                  ],
                ),
              ),
            ));
  }
}
