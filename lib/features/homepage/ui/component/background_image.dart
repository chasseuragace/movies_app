import 'package:flutter/material.dart';

class BackgroundImage extends StatelessWidget {
  String url;

  BackgroundImage({this.url});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      decoration: BoxDecoration(
          image: DecorationImage(
              image: NetworkImage(
                url,
              ),
              fit: BoxFit.cover)),
    );
  }
}
