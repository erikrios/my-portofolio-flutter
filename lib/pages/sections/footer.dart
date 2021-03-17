import 'package:flutter/material.dart';
import 'package:my_portofolio_flutter/responsive/screen_size.dart';
import 'package:url_launcher/url_launcher.dart';

class Footer extends StatelessWidget {
  final double height;
  final ScreenSize screenSize;

  Footer({required this.screenSize, required this.height});

  @override
  Widget build(BuildContext context) {
    bool isSmallOrNormalScreen =
        screenSize == ScreenSize.SMALL || screenSize == ScreenSize.NORMAL;
    return Container(
      height: isSmallOrNormalScreen ? height * 1 / 6 : height * 1 / 4,
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
                  iconSize: isSmallOrNormalScreen ? 24.0 : 36.0,
                  padding: isSmallOrNormalScreen ? 4.0 : 8.0,
                  onPressed: () async {
                    final String url =
                        'https://www.linkedin.com/in/erikriosetiawan/';
                    await canLaunch(url)
                        ? await launch(url)
                        : throw 'Could not launch $url';
                  }),
              _socialIcon(
                  path: 'assets/images/github.png',
                  iconSize: isSmallOrNormalScreen ? 24.0 : 36.0,
                  padding: isSmallOrNormalScreen ? 4.0 : 8.0,
                  onPressed: () async {
                    final String url = 'https://github.com/erikrios';
                    await canLaunch(url)
                        ? await launch(url)
                        : throw 'Could not launch $url';
                  }),
              _socialIcon(
                  path: 'assets/images/email.png',
                  iconSize: isSmallOrNormalScreen ? 24.0 : 36.0,
                  padding: isSmallOrNormalScreen ? 4.0 : 8.0,
                  onPressed: () async {
                    final String url = 'mailto:erikriosetiawan15@gmail.com';
                    await canLaunch(url)
                        ? await launch(url)
                        : throw 'Could not launch $url';
                  }),
            ],
          ),
          Text(
            isSmallOrNormalScreen
                ? '\u00a9 All Right Reserved\nDesigned by Erik Rio Setiwan'
                : '\u00a9 All Right Reserved - Designed by Erik Rio Setiwan',
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.blue.shade700,
              fontSize: isSmallOrNormalScreen ? 12.0 : 16.0,
            ),
          )
        ],
      ),
    );
  }

  Widget _socialIcon({
    required String path,
    required double iconSize,
    required double padding,
    required void Function() onPressed,
  }) =>
      Padding(
        padding: EdgeInsets.all(
          padding,
        ),
        child: IconButton(
          icon: Image.asset(path),
          iconSize: iconSize,
          onPressed: onPressed,
        ),
      );
}
