import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class LunchScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _LunchScreenState();
}

class _LunchScreenState extends State<LunchScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Lunch of the day'),
      ),
      body: Center(
        child: Text('hello!!'),
      )
    );
  }
}