import 'dart:html';

import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class Footer extends StatelessWidget {
  final double height;

  Footer({required this.height});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      color: Colors.grey.shade200,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _socialIcon(
                  path: 'assets/images/linkedin.png',
                  iconSize: 36.0,
                  onPressed: () async {
                    final String url =
                        'https://www.linkedin.com/in/erikriosetiawan/';
                    await canLaunch(url)
                        ? await launch(url)
                        : throw 'Could not launch $url';
                  }),
              _socialIcon(
                  path: 'assets/images/github.png',
                  iconSize: 36.0,
                  onPressed: () async {
                    final String url = 'https://github.com/erikrios';
                    await canLaunch(url)
                        ? await launch(url)
                        : throw 'Could not launch $url';
                  }),
              _socialIcon(
                  path: 'assets/images/email.png',
                  iconSize: 36.0,
                  onPressed: () async {
                    final String url = 'mailto:erikriosetiawan15@gmail.com';
                    await canLaunch(url)
                        ? await launch(url)
                        : throw 'Could not launch $url';
                  }),
            ],
          ),
          Text(
            '\u00a9 All Right Reserved - Designed by Erik Rio Setiwan',
            style: TextStyle(
              color: Colors.blue.shade700,
              fontSize: 16.0,
            ),
          )
        ],
      ),
    );
  }

  Widget _socialIcon({
    required String path,
    required double iconSize,
    required void Function() onPressed,
  }) =>
      Padding(
        padding: const EdgeInsets.all(8.0),
        child: IconButton(
          icon: Image.asset(path),
          iconSize: iconSize,
          onPressed: onPressed,
        ),
      );
}
