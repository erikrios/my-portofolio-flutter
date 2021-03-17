import 'package:flutter/material.dart';

class Footer extends StatelessWidget {
  final double height;

  Footer({required this.height});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      color: Colors.grey.shade200,
    );
  }
}
