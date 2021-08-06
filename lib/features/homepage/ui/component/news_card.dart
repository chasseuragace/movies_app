import 'package:flutter/material.dart';

class NewsCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            color: Colors.orange,
          ),
          child: Stack(
            children: [],
          ),
        ),
      ),
    );
  }
}
