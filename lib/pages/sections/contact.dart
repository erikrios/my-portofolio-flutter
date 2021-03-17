import 'package:flutter/cupertino.dart';

class Contact extends StatelessWidget {
  final double height;

  Contact({required this.height});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
    );
  }
}
