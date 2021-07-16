import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ListErrorIndicator extends StatelessWidget {
  final VoidCallback onReloadCallback;

  ListErrorIndicator(this.onReloadCallback);

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Container(
        margin: const EdgeInsets.all(4.0),
        child: Card(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text('Error has occured', textAlign: TextAlign.center),
                ElevatedButton(
                    onPressed: () {
                      onReloadCallback.call();
                    },
                    child: Text('Retry'))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
