import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:movies_app/features/homepage/ui/details_page/details_page.dart';
import 'package:movies_app/service/api/api_provider.dart';

class NewsCard extends StatelessWidget {
  final Results currentData;
  NewsCard(this.currentData);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GestureDetector(
        onTap: () {
          Navigator.of(context)
              .push(MaterialPageRoute(builder: (_) => Detailspage()));
        },
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                color: Colors.orange,
                boxShadow: [
                  BoxShadow(
                      color: Colors.amber,
                      spreadRadius: -2,
                      blurRadius: 7,
                      offset: Offset(0, 6))
                ]),
            child: Stack(
              fit: StackFit.expand,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(15),
                  child: ColorFiltered(
                    colorFilter:
                        ColorFilter.mode(Colors.black54, BlendMode.darken),
                    child: Image.network(
                      'https://image.tmdb.org/t/p/w500/${currentData.backdropPath}',
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Positioned(
                    top: 10,
                    left: 10,
                    child: Container(
                      decoration: BoxDecoration(
                          color: Theme.of(context).accentColor,
                          borderRadius: BorderRadius.circular(5)),
                      padding:
                          EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                      child: Text(
                        currentData.mediaType,
                        style: TextStyle(
                            fontWeight: FontWeight.w500, fontSize: 13),
                      ),
                    )),
                Positioned(
                  child: Text(
                    currentData.title ??
                        currentData.originalTitle ??
                        currentData.name ??
                        currentData.originalName ??
                        "NO Data",
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w600,
                        fontSize: 16),
                    overflow: TextOverflow.ellipsis,
                    maxLines: 1,
                  ),
                  bottom: 65,
                  left: 10,
                  width: 200,
                  height: 50,
                ),
                Positioned(
                  child: Text(
                    currentData.overview ?? "NO Data",
                    style: TextStyle(color: Colors.white),
                    overflow: TextOverflow.ellipsis,
                    maxLines: 3,
                  ),
                  bottom: 40,
                  left: 10,
                  width: 200,
                  height: 50,
                ),
                Positioned(
                    child: Text(
                      "${currentData.voteAverage} / 10",
                      style: TextStyle(color: Colors.white54),
                    ),
                    bottom: 10,
                    left: 10)
              ],
            ),
          ),
        ),
      ),
    );
  }
}
