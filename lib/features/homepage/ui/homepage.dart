import 'dart:math';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:movies_app/shared_componsents/section_header_with_action.dart';
import 'package:movies_app/shared_componsents/ui_component/video_card/model.dart';
import 'package:movies_app/shared_componsents/ui_component/video_card/video_card.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key key}) : super(key: key);
  double heightPercentFinder(BuildContext context) {
    return (320 + 20) / (MediaQuery.of(context).size.height - kToolbarHeight);
  }

  buildBody(BuildContext context) {
    final Size _size = MediaQuery.of(context).size;
    return SizedBox(
      height: MediaQuery.of(context).size.height,
      child: Stack(
        children: [
          TopScroller(),
          DraggableScrollableSheet(
            minChildSize: (1 - heightPercentFinder(context)) * .97,
            maxChildSize: heightPercentFinder(context) * 1.3,
            initialChildSize: 1 - heightPercentFinder(context),
            builder: (_, controller) {
              return SizedBox(
                height: _size.height,
                child: Container(
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(16),
                          topRight: Radius.circular(16)),
                      boxShadow: [
                        BoxShadow(
                            color: Colors.black12,
                            spreadRadius: 1,
                            blurRadius: 8,
                            offset: Offset(0, -3))
                      ]),
                  child: Padding(
                    padding: const EdgeInsets.only(
                      left: 8.0,
                      right: 8,
                      top: 8,
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(16),
                          topRight: Radius.circular(16)),
                      child: SingleChildScrollView(
                        physics: ClampingScrollPhysics(),
                        controller: controller,
                        child: Padding(
                          padding: const EdgeInsets.only(bottom: 8.0),
                          child: Material(
                            borderRadius: BorderRadius.circular(16),
                            child: Column(
                              children: [
                                Container(
                                  height: 700,
                                ),
                                Container(
                                  height: 700,
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              );
            },
          )
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        bottomNavigationBar:
            Container(color: Colors.grey, height: kToolbarHeight),
        body:
            kIsWeb ? buildBody(context) : SafeArea(child: buildBody(context)));
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
      height: 320,
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
            child: VideoScrollBox(),
          ),
        ],
      ),
    );
  }
}

class VideoScrollBox extends StatelessWidget {
  const VideoScrollBox({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 0.0),
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: 20,
        itemBuilder: (BuildContext context, int index) {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: VideoCard(
              singleCard: VideoCardModel(),
            ),
          );
        },
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
      width: 180,
      height: 40,
      child: Image.network(
        "https://officialpsds.com/imageview/7v/p8/7vp8kp_large.png?1521316499",
        //"https://png.pngitem.com/pimgs/s/8-81060_movie-lovers-movie-lovers-logo-hd-png-download.png",
        fit: BoxFit.contain,
      ),
    );
  }
}
