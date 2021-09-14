class DetailsBody extends StatelessWidget {
  const name({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  child: Column(
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
                                  );
  }
}