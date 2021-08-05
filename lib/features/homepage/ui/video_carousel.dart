import 'package:flutter/material.dart';
import 'package:movies_app/shared_componsents/ui_component/video_card/model.dart';
import 'package:movies_app/shared_componsents/ui_component/video_card/video_card.dart';

class VideoCarousel extends StatelessWidget {
  const VideoCarousel({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
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
    );
  }
}
