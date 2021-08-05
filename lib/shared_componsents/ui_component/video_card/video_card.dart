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
            style: Theme.of(context)
                .textTheme
                .headline5
                .copyWith(fontSize: 15, fontWeight: FontWeight.w700),
          ),
        ),
        Text(
          "Some Subtitle",
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
          style: Theme.of(context)
              .textTheme
              .caption
              .copyWith(fontSize: 15, fontWeight: FontWeight.w500),
        )
      ],
    );
  }
}
