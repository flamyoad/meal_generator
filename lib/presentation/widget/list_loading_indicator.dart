import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ListLoadingIndicator extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: ConstrainedBox(
        constraints: BoxConstraints(minHeight: 150),
        child: Center(
          child: CircularProgressIndicator(),
        ),
      ),
    );
  }

}