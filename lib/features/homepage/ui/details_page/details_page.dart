import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:movies_app/features/homepage/ui/component/background_image.dart';
import 'package:movies_app/features/homepage/ui/component/center_image.dart';
import 'package:movies_app/features/homepage/ui/details_page/details_body.dart';

import 'package:movies_app/features/homepage/ui/details_page/details_manager.dart';
import 'package:movies_app/features/homepage/ui/trendingPage/modal/trending_response.dart';

class Detailspage extends StatefulWidget {
  final Results currentData;
  Detailspage({Key key, this.currentData}) : super(key: key);

  @override
  State<Detailspage> createState() => _DetailspageState();
}

class _DetailspageState extends State<Detailspage> {
  DetailsManager detailManager;
  @override
  void initState() {
    detailManager = DetailsManager(id: widget.currentData.id);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          //todo : refractor as Background Image
          BackgroundImage('https://image.tmdb.org/t/p/w500/${widget.currentData.backdropPath}'),
          //todo : refractor as BackgroundBlur
          ClipRRect(
            child: BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 4.6, sigmaY: 4.6),
                child: Container(
                  height: MediaQuery.of(context).size.height,
                  width: MediaQuery.of(context).size.width,
                  child: Stack(
                    children: [
                      //todo : refractor as CustomBackButton
                      Positioned(
                        left: 20,
                        top: kToolbarHeight,
                        child: FloatingActionButton(
                            elevation: 0,
                            backgroundColor: Colors.white24,
                            child: Center(
                              child: Icon(
                                Icons.arrow_back_ios,
                                size: 12,
                                color: Colors.grey,
                              ),
                            ),
                            mini: true,
                            onPressed: () {
                              Navigator.of(context).pop();
                            }),
                      ),

                      Positioned(
                          bottom: 0,
                          height: MediaQuery.of(context).size.height - 300 - 55,
                          left: 0,
                          right: 0,
                          child: Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 18.0),
                            child: Material(
                              borderRadius: BorderRadius.circular(12),
                              child: Container(
                                height:
                                    MediaQuery.of(context).size.height - 300,
                                width: 200,
                                child: SingleChildScrollView(
                                  //todo : refractor as DetailsBody
                                 DetailsBody(),
                                ),
                              ),
                            ),
                          )),
                      // //todo : refractor as CenterImage
                      CenterImage(tag:"details-${widget.currentData.id}",url: 'https://image.tmdb.org/t/p/w500/${widget.currentData.backdropPath}'),
                    ],
                  ),
                )),
          )
        ],
      ),
    );
  }
}

class CastCrewList extends StatelessWidget {
  final isCrew;
  const CastCrewList({
    Key key,
    @required this.detailManager,
    this.isCrew = false,
  }) : super(key: key);

  final DetailsManager detailManager;

  @override
  Widget build(BuildContext context) {
    final crews = detailManager.getCrew;
    final cast = detailManager.getCast;
    return ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: (isCrew ? (crews) : (cast)).length,
        itemBuilder: (c, i) => Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                width: 128,
                child: Column(
                  children: [
                    Expanded(
                        child: Image.network(
                      "https://image.tmdb.org/t/p/w500/${(isCrew ? crews.elementAt(i).profilePath : cast.elementAt(i).profilePath)}",
                    )),
                    Padding(
                      padding: const EdgeInsets.only(top: 8.0),
                      child: Text((isCrew
                          ? crews.elementAt(i).name
                          : cast.elementAt(i).name)),
                    )
                  ],
                ),
              ),
            ));
  }
}
