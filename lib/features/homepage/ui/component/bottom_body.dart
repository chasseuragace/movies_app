import 'package:flutter/material.dart';
import 'package:movies_app/features/homepage/ui/component/news_card.dart';
import 'package:movies_app/shared_componsents/section_header_with_action.dart';

class BottomBody extends StatelessWidget {
  const BottomBody({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: DraggableScrollableSheet(
        initialChildSize: 1,
        builder: (_, ScrollController controller) {
          return SingleChildScrollView(
            controller: controller,
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: SectionHeaderWithAction(
                      heading: 'Hot News', action: () {}),
                ),
                Container(
                  height: 400,
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
              ],
            ),
          );
        },
      ),
    );
  }
}
