import 'package:flutter/material.dart';
import 'package:my_portofolio_flutter/responsive/screen_size.dart';
import 'package:url_launcher/url_launcher.dart';

class Introduction extends StatelessWidget {
  final ScreenSize screenSize;
  final double height;

  Introduction({required this.screenSize, required this.height});

  @override
  Widget build(BuildContext context) {
    final isSmallOrNormalScreen =
        screenSize == ScreenSize.SMALL || screenSize == ScreenSize.NORMAL;

    return Container(
      height: this.height * 3 / 4,
      child: isSmallOrNormalScreen
          ? Column(
              children: [
                Flexible(
                  flex: 2,
                  child: _handleInfo(
                    isSmallOrNormalScreen: isSmallOrNormalScreen,
                  ),
                ),
                Flexible(
                  flex: 1,
                  child: _handleImage(),
                ),
              ],
            )
          : Row(
              children: [
                Flexible(
                  flex: 1,
                  child: _handleInfo(
                    isSmallOrNormalScreen: isSmallOrNormalScreen,
                  ),
                ),
                Flexible(
                  flex: 1,
                  child: _handleImage(),
                )
              ],
            ),
    );
  }

  Widget _handleInfo({required bool isSmallOrNormalScreen}) {
    return Container(
      padding: isSmallOrNormalScreen
          ? EdgeInsets.symmetric(horizontal: 16, vertical: 16)
          : EdgeInsets.symmetric(horizontal: 50, vertical: 50),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Hello'.toUpperCase(),
            style: TextStyle(
              color: Colors.blue.shade700,
              fontSize: isSmallOrNormalScreen ? 20.0 : 30.0,
            ),
          ),
          Text(
            "I'm Erik Rio Setiawan".toUpperCase(),
            style: TextStyle(
              color: Colors.blue.shade700,
              fontWeight: FontWeight.bold,
              fontSize: isSmallOrNormalScreen ? 30.0 : 50.0,
            ),
          ),
          Text(
            "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.",
            maxLines: isSmallOrNormalScreen ? 10 : 6,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(
              fontSize: isSmallOrNormalScreen ? 14.0 : 16.0,
            ),
          ),
          Align(
            alignment:
                isSmallOrNormalScreen ? Alignment.center : Alignment.centerLeft,
            child: ElevatedButton(
              onPressed: () async {
                final Uri emailLaunchUri = Uri(
                  scheme: 'mailto',
                  path: 'erikriosetiawan15@gmail.com',
                  queryParameters: {'subject': 'Hello, Erik!'},
                );

                String url = emailLaunchUri.toString();

                await canLaunch(url)
                    ? await launch(url)
                    : throw 'Could not launch $url';
              },
              child: Text("Let's Talk!"),
              style: ButtonStyle(
                padding: MaterialStateProperty.all(
                  isSmallOrNormalScreen
                      ? EdgeInsets.symmetric(horizontal: 18, vertical: 12)
                      : EdgeInsets.symmetric(horizontal: 24, vertical: 14),
                ),
                textStyle: MaterialStateProperty.all(TextStyle(
                  fontSize: isSmallOrNormalScreen ? 16.0 : 18.0,
                )),
                backgroundColor:
                    MaterialStateProperty.all(Colors.blue.shade700),
                shape: MaterialStateProperty.all(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(18.0),
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget _handleImage() {
    return Container(
      child: Image.asset('assets/images/illustration.png'),
    );
  }
}
