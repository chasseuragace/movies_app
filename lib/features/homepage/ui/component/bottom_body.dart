import 'package:flutter/material.dart';

class BottomBody extends StatelessWidget {
  const BottomBody({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: DraggableScrollableSheet(
        initialChildSize: 1,
        builder: (_, ScrollController controller) {
          return SingleChildScrollView(
            controller: controller,
            child: Column(
              children: [
                Container(
                  height: 700,
                  color: Colors.green,
                ),
                Container(
                  height: 700,
                  color: Colors.red,
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
