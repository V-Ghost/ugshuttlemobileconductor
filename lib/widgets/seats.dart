import 'package:flutter/material.dart';

class Seats extends StatelessWidget {
  final Color color;
  final String id;
  Seats({this.color, this.id});

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.width;

    return Padding(
      padding: EdgeInsets.only(right: 5),
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(
            top: 8.0,
            left: 10,
          ),
          child: Container(
            height: 50,
            width: 50,
            decoration: BoxDecoration(
              color: color == null ? Colors.grey : Colors.green,
              // border: Border(bottom: BorderSide()),
              borderRadius: new BorderRadius.only(
                topLeft: const Radius.circular(100.0),
                topRight: const Radius.circular(100.0),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
