import 'package:flutter/material.dart';

class Rating extends StatelessWidget {
  final num rating;

  const Rating(this.rating);

  @override
  Widget build(BuildContext context) {
    return Text.rich(
      TextSpan(
        children: [
          WidgetSpan(
            child: Icon(
              Icons.star,
              size: 17,
              color: Colors.orangeAccent,
            ),
          ),
          TextSpan(text: '$rating')
        ],
      ),
      strutStyle: StrutStyle(fontSize: 20),
    );
  }
}
