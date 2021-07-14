import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class LunchItem extends StatelessWidget {
  final String name;
  final String imageUrl;

  LunchItem({required this.name, required this.imageUrl});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Image.network(imageUrl,
            fit: BoxFit.fill,
            loadingBuilder: (context, child, loadingProgress) => CircularProgressIndicator()),
        Container(
          margin: EdgeInsets.only(top: 8.0),
          child: Text(name),
        )
      ],
    );
  }

}