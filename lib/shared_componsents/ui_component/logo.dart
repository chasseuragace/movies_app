import 'package:flutter/material.dart';
import 'package:movies_app/service/api/api_provider.dart';

class Logo extends StatelessWidget {
  const Logo({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 180,
      height: 40,
      child: GestureDetector(
        onTap: () {},
        child: Image.network(
            "https://png.pngitem.com/pimgs/s/8-81060_movie-lovers-movie-lovers-logo-hd-png-download.png"),
      ),
    );
  }
}
