import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar:
          Container(color: Colors.grey, height: kToolbarHeight),
      body: Column(
        children: [
          Container(
            height: 200,
            color: Colors.grey,
          ),
          Expanded(
            child: DraggableScrollableSheet(),
          )
        ],
      ),
    );
  }
}
