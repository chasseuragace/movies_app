import 'dart:ui';

import 'package:flutter/material.dart';

class Detailspage extends StatelessWidget {
  const Detailspage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: NetworkImage(
                        "https://i.pinimg.com/originals/3c/61/52/3c61520fd32ec28eeb1d19e6299e5e11.jpg"),
                    fit: BoxFit.cover)),
          ),
          BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 4.6, sigmaY: 4.6),
              child: Container(
                height: MediaQuery.of(context).size.height,
                width: MediaQuery.of(context).size.width,
                child: Stack(
                  children: [
                    Positioned(
                      left: 20,
                      top: 20,
                      child: FloatingActionButton(onPressed: () {
                        Navigator.of(context).pop();
                      }),
                    ),
                    Positioned(
                        bottom: 0,
                        height: MediaQuery.of(context).size.height - 300 - 55,
                        left: 0,
                        right: 0,
                        child: Container(
                          width: 200,
                          color: Colors.white,
                        )),
                    Positioned(
                        top: 100,
                        height: 300,
                        left: 0,
                        right: 0,
                        child: Align(
                          alignment: Alignment.center,
                          child: Container(
                            width: 200,
                            color: Colors.red,
                          ),
                        )),
                  ],
                ),
              ))
        ],
      ),
    );
  }
}
