import 'package:flutter/material.dart';
import 'package:movies_app/shared_componsents/ui_component/video_card/model.dart';

class VideoCard extends StatelessWidget {
  final VideoCardModel singleCard;

  const VideoCard({Key key, this.singleCard}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: Material(
            borderRadius: BorderRadius.circular(12),
            child: Container(
              width: 280,
              child: null,
            ),
          ),
        ),
        //todo define text style for title and subtitie
        Text(
          "title",
        ),
        Text("subtitie")
      ],
    );
  }
}
