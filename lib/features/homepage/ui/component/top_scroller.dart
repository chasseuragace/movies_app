import 'package:flutter/material.dart';
import 'package:movies_app/shared_componsents/ui_component/video_carousel.dart';
import 'package:movies_app/shared_componsents/ui_component/logo.dart';
import 'package:movies_app/shared_componsents/section_header_with_action.dart';

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
          // Top Logo
          Center(
            child: Padding(
              padding: const EdgeInsets.only(top: 15.0),
              child: Logo(),
            ),
          ),
          //  Section header
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: SectionHeaderWithAction(
                heading: "Interesting videos", action: () {}),
          ),
          // todo refractor this component as Videos Carousal
          VideoCarousel(),
        ],
      ),
    );
  }
}
