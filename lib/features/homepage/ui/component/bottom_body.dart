import 'dart:math';

import 'package:flutter/material.dart';
import 'package:movies_app/features/homepage/ui/component/news_card.dart';
import 'package:movies_app/service/api/api_provider.dart';
import 'package:movies_app/shared_componsents/section_header_with_action.dart';

class BottomBody extends StatelessWidget {
  const BottomBody({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var isPortrait = MediaQuery.of(context).orientation == Orientation.portrait;

    return Column(
      children: [
        HotNews(),
        // refractor to popular section
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: SectionHeaderWithTabs(heading: 'Popular Today', action: () {}),
        ),
      ],
    );
  }
}

TMDBManager manager = TMDBManager();

class HotNews extends StatelessWidget {
  const HotNews({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<DataFetchState>(
        valueListenable: manager.trendingFetchState,
        builder: (context, state, child) {
          return state == DataFetchState.LOADING
              ? Center(
                  child: CircularProgressIndicator(),
                )
              : state == DataFetchState.ERROR
                  ? Center(
                      child: ElevatedButton(
                        child: Text("retry"),
                        onPressed: () {},
                      ),
                    )
                  : Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 8.0),
                          child: SectionHeaderWithAction(
                              heading: 'Hot News', action: () {}),
                        ),
                        Container(
                          height: 400,
                          width: MediaQuery.of(context).size.width,
                          child: ListView.builder(
                            itemCount: (manager.trendingData.results.length / 3)
                                .ceil(),
                            itemBuilder: (context, index) {
                              var currentData = manager.trendingData.results
                                  .sublist(
                                      index * 3,
                                      min(manager.trendingData.results.length,
                                          index * 3 + 3));
                              if (currentData.length < 3) return SizedBox();

                              return Container(
                                width: 508,
                                child: Row(
                                  children: [
                                    if (currentData.isNotEmpty)
                                      NewsCard(currentData[0]),
                                    Expanded(
                                      child: Column(
                                        children: [
                                          NewsCard(currentData[1]),
                                          NewsCard(currentData[2])
                                        ],
                                      ),
                                    )
                                  ],
                                ),
                              );
                            },
                            scrollDirection: Axis.horizontal,
                          ),
                        ),
                      ],
                    );
        });
  }
}
