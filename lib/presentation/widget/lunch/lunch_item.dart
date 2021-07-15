import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class LunchItem extends StatelessWidget {
  final String name;
  final String imageUrl;

  LunchItem({required this.name, required this.imageUrl});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2.0,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.0)),
      child: InkWell(
        onTap: () {},
        child: Column(
          children: [
            Image.network(imageUrl, fit: BoxFit.cover, width: 200, height: 200,
                loadingBuilder: (context, child, loadingProgress) {
              if (loadingProgress == null) {
                return child;
              }
              return Container(
                  constraints: BoxConstraints(minWidth: 200, minHeight: 200),
                  child: Center(child: CircularProgressIndicator()));
            }),
            Padding(
              padding: const EdgeInsets.only(bottom: 8.0),
              child: Container(
                margin: EdgeInsets.only(top: 16.0),
                child: Text(name),
              ),
            )
          ],
        ),
      ),
    );
  }
}
