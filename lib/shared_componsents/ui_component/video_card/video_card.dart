import 'package:flutter/material.dart';
import 'package:movies_app/shared_componsents/ui_component/video_card/model.dart';
import 'package:movies_app/theme/theme_constants.dart';

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

//todo select/modify 1
class VideoCard2 extends StatelessWidget {
  final VideoCardModel singleCard;

  const VideoCard2({Key key, this.singleCard}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: Material(
            elevation: 4,
            borderRadius: BorderRadius.circular(12),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: Stack(
                alignment: Alignment.center,
                children: [
                  Container(
                    width: 280,
                    child: AspectRatio(
                      aspectRatio: 1,
                      child: Image.network(
                        'https://www.escapelive.co.uk/wp-content/uploads/2019/10/Peaky-blinders-Banner-new-2.jpg',
                        fit: BoxFit.fill,
                      ),
                    ),
                  ),
                  Center(
                    child: Opacity(
                      opacity: .8,
                      child: FloatingActionButton(
                        heroTag: UniqueKey(),
                        onPressed: () {},
                        child: Icon(Icons.play_arrow),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
        //todo define text style for title and subtitie
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            "Some Title",
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: AppThemeConstants.appFont.withSize(15).withWeight(weight: 7),
          ),
        ),
        Text(
          "Some Subtitle",
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
          style: AppThemeConstants.appFont
              .copyWith(fontSize: 15, fontWeight: FontWeight.w500),
        )
      ],
    );
  }
}
