import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:movies_app/features/homepage/ui/component/bottom_body.dart';
import 'package:movies_app/features/homepage/ui/component/top_scroller.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        bottomNavigationBar:
            Container(color: Colors.grey, height: kToolbarHeight),
        body:
            kIsWeb ? buildBody(context) : SafeArea(child: buildBody(context)));
  }

  double heightPercentFinder(BuildContext context) {
    //ques
    return (320 + 20) / (MediaQuery.of(context).size.height - kToolbarHeight);
  }

  buildBody(BuildContext context) {
    var isPortrait = MediaQuery.of(context).orientation == Orientation.portrait;

    final Size _size = MediaQuery.of(context).size;
    return SizedBox(
      height: MediaQuery.of(context).size.height,
      child: Stack(
        children: [
          TopScroller(),
          DraggableScrollableSheet(
            minChildSize: isPortrait
                ? 0.4
                : .1, //(1 - heightPercentFinder(context)) * .97,
            maxChildSize: 1, //heightPercentFinder(context) * 1.3,
            initialChildSize:
                isPortrait ? .63 : .15, //1 - heightPercentFinder(context),
            builder: (_, controller) {
              return SizedBox(
                height: _size.height,
                child: Container(
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(16),
                          topRight: Radius.circular(16)),
                      boxShadow: [
                        BoxShadow(
                            color: Colors.black12,
                            spreadRadius: 1,
                            blurRadius: 8,
                            offset: Offset(0, -3))
                      ]),
                  child: Padding(
                    padding: const EdgeInsets.only(
                      left: 8.0,
                      right: 8,
                      top: 8,
                    ),
                    child: Material(
                      borderRadius: BorderRadius.circular(16),
                      child: ClipRRect(
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(16),
                            topRight: Radius.circular(16)),
                        child: SingleChildScrollView(
                          physics: ClampingScrollPhysics(),
                          controller: controller,
                          child: Padding(
                            padding: const EdgeInsets.only(bottom: 8.0),
                            child: BottomBody(),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              );
            },
          )
        ],
      ),
    );
  }
}
