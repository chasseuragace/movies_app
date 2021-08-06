import 'package:flutter/material.dart';
import 'package:movies_app/features/homepage/ui/component/news_card.dart';
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
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: SectionHeaderWithAction(heading: 'Hot News', action: () {}),
        ),
        Container(
          height: isPortrait ? 400 : 300,
          width: MediaQuery.of(context).size.width,
          child: ListView(
            scrollDirection: Axis.horizontal,
            children: [
              Container(
                width: 508,
                child: Row(
                  children: [
                    NewsCard(),
                    Expanded(
                      child: Column(
                        children: [NewsCard(), NewsCard()],
                      ),
                    )
                  ],
                ),
              ),
              //todo refactor
              Container(
                width: 488,
                child: Row(
                  children: [
                    NewsCard(),
                    Expanded(
                      child: Column(
                        children: [NewsCard(), NewsCard()],
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: SectionHeaderWithTabs(heading: 'Popular Today', action: () {}),
        ),
      ],
    );
  }
}
