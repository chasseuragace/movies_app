import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:movies_app/shared_componsents/section_header_with_action.dart';
import 'package:movies_app/shared_componsents/ui_component/video_card/model.dart';
import 'package:movies_app/shared_componsents/ui_component/video_card/video_card.dart';
import 'package:movies_app/theme/theme_constants.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key key}) : super(key: key);

  buildBody() {
    return Column(
      children: [
        TopScroller(),
        Expanded(
          child: DraggableScrollableSheet(
            initialChildSize: 1,
            builder: (_, ScrollController controller) {
              return SingleChildScrollView(
                controller: controller,
                child: Column(
                  children: [
                    Container(
                      height: 700,
                      color: Colors.green,
                    ),
                    Container(
                      height: 700,
                      color: Colors.red,
                    ),
                  ],
                ),
              );
            },
          ),
        )
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        bottomNavigationBar:
            Container(color: Colors.grey, height: kToolbarHeight),
        body: kIsWeb ? buildBody() : SafeArea(child: buildBody()));
  }
}

// todo [REFRACTOR] put this widget in a new file just like SectionHeaderWithAction
class TopScroller extends StatelessWidget {
  const TopScroller({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.black45,
      height: 300,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Center(
            child: Padding(
              padding: const EdgeInsets.only(top: 15.0),
              child: Logo(),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: SectionHeaderWithAction(
                heading: "Interesting videos", action: () {}),
          ),
          // todo refractor this component as Videos Carousal
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(top: 0.0),
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: 7,
                itemBuilder: (BuildContext context, int index) {
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: VideoCard(
                      singleCard: VideoCardModel(),
                    ),
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// todo [REFRACTOR]
class Logo extends StatelessWidget {
  const Logo({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 140,
      height: 60,
      child: Image.network(
          "https://png.pngitem.com/pimgs/s/8-81060_movie-lovers-movie-lovers-logo-hd-png-download.png"),
    );
  }
}
