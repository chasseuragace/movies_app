import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:movies_app/features/homepage/ui/component/bottom_body.dart';
import 'package:movies_app/features/homepage/ui/component/top_scroller.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key key}) : super(key: key);

  buildBody() {
    return Column(
      children: [TopScroller(), BottomBody()],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        bottomNavigationBar:
            Container(color: Colors.grey, height: kToolbarHeight),
        body: kIsWeb ? buildBody() : SafeArea(child: buildBody()));
  }
}
