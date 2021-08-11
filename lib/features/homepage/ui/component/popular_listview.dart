import 'package:flutter/material.dart';

class PopularTodayTabView extends StatelessWidget {
  const PopularTodayTabView({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //todo wrap with ValuListenabeBuilder
    return Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20), color: Colors.black),
        width: 100,
        child: ListView.builder(
          itemCount: 7,
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) => Padding(
            padding: const EdgeInsets.all(25.0),
            child: Container(
              height: 300,
              width: 200,
              child: Stack(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: Image.network(
                      'https://www.dkoding.in/wp-content/uploads/Sherlock-Holmes-Movie-TV-Web-Entertainment-DKODING.jpg',
                      fit: BoxFit.cover,
                    ),
                  ),
                ],
                fit: StackFit.expand,
              ),
            ),
          ),
        ));
  }
}
