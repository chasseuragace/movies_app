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
          "The title text",
          style: TextStyle(
            color: Colors.white,
            fontSize: 20,
          ),
        ),
        Text("the subtitle section",
            style: TextStyle(color: Colors.grey[700], fontSize: 15))
      ],
    );
  }
}
