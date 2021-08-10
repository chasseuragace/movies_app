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
            fit: StackFit.expand,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(15),
                child: Image.network(
                  'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRJCrG2X_X33tETRfFULy6Q1hUntWH1HlsUnw&usqp=CAU',
                  fit: BoxFit.cover,
                ),
              ),
              Positioned(
                  top: 10,
                  left: 10,
                  child: Container(
                    decoration: BoxDecoration(
                        color: Theme.of(context).accentColor,
                        borderRadius: BorderRadius.circular(5)),
                    padding: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                    child: Text(
                      'Movie',
                      style:
                          TextStyle(fontWeight: FontWeight.w500, fontSize: 13),
                    ),
                  )),
              Positioned(
                child: Text(
                  'content content content dsfd dsfdsfd dsfdsf fsdfds dsfdsf dsfdf fsdfdf sdfdf fdsdf ',
                  overflow: TextOverflow.ellipsis,
                  maxLines: 3,
                ),
                bottom: 40,
                left: 10,
                width: 200,
                height: 50,
              ),
              Positioned(child: Text('1hr ago'), bottom: 10, left: 10)
            ],
          ),
        ),
      ),
    );
  }
}
