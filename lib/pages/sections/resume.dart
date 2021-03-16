import 'dart:ui';

import 'package:flutter/material.dart';

class Resume extends StatelessWidget {
  final double height;

  Resume({required this.height});

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Container(
      color: Colors.blue.shade700,
      height: height,
      child: Row(
        children: [
          Flexible(
            flex: 1,
            child: Container(
              child: Center(
                child: Container(
                  width: width * 1 / 4,
                  height: width * 1 / 4,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(width * 1 / 4),
                    child: Image.asset('assets/images/photo.png'),
                  ),
                ),
              ),
            ),
          ),
          Flexible(
            flex: 1,
            child: Container(
              padding: EdgeInsets.only(right: 100, top: 50, bottom: 50),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    'Hi, Nice to meet you.',
                    style: TextStyle(
                      fontSize: 26,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.white,
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () {},
                    child: Text('Download CV'),
                    style: ButtonStyle(
                      padding: MaterialStateProperty.all(
                        EdgeInsets.symmetric(
                          vertical: 14,
                          horizontal: 24,
                        ),
                      ),
                      textStyle: MaterialStateProperty.all(
                        TextStyle(fontSize: 18.0, color: Colors.blue.shade700),
                      ),
                      backgroundColor:
                          MaterialStateProperty.all(Colors.amber.shade800),
                      shape: MaterialStateProperty.all(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(18.0),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
