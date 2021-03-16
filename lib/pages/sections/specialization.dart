import 'package:flutter/material.dart';

class Specialization extends StatelessWidget {
  final double height;

  Specialization({required this.height});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      color: Colors.green,
    );
  }
}
