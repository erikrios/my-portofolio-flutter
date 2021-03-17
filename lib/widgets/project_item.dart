import 'package:flutter/material.dart';
import 'package:my_portofolio_flutter/models/project.dart';
import 'package:url_launcher/url_launcher.dart';

class ProjectItem extends StatelessWidget {
  final Project project;
  final bool isSmallOrNormalScreen;

  ProjectItem({required this.isSmallOrNormalScreen, required this.project});

  @override
  Widget build(BuildContext context) {
    return isSmallOrNormalScreen
        ? Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Flexible(
                flex: 2,
                child: _getProjectImage(
                  isSmallOrNormalScreen: isSmallOrNormalScreen,
                  path: project.imagePath,
                ),
              ),
              Flexible(
                flex: 3,
                child: _getProjectInfo(
                  isSmallOrNormalScreen: isSmallOrNormalScreen,
                ),
              ),
            ],
          )
        : Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Flexible(
                flex: 2,
                child: _getProjectInfo(
                  isSmallOrNormalScreen: isSmallOrNormalScreen,
                ),
              ),
              SizedBox(
                width: 50,
              ),
              Flexible(
                flex: 1,
                child: _getProjectImage(
                  isSmallOrNormalScreen: isSmallOrNormalScreen,
                  path: project.imagePath,
                ),
              ),
            ],
          );
  }

  Widget _getProjectInfo({required bool isSmallOrNormalScreen}) {
    return Column(
      mainAxisAlignment: isSmallOrNormalScreen
          ? MainAxisAlignment.spaceEvenly
          : MainAxisAlignment.spaceAround,
      crossAxisAlignment: isSmallOrNormalScreen
          ? CrossAxisAlignment.center
          : CrossAxisAlignment.start,
      children: [
        Text(
          project.name ?? "No Title",
          textAlign: isSmallOrNormalScreen ? TextAlign.center : TextAlign.left,
          style: TextStyle(
            fontSize: isSmallOrNormalScreen ? 20.0 : 26.0,
            color: Colors.amber,
            fontWeight: FontWeight.bold,
          ),
        ),
        Text(
          project.description ?? "No Description",
          textAlign: isSmallOrNormalScreen ? TextAlign.center : TextAlign.left,
          maxLines: isSmallOrNormalScreen ? 12 : 9,
          overflow: TextOverflow.ellipsis,
          style: TextStyle(
            fontSize: isSmallOrNormalScreen ? 14.0 : 16.0,
          ),
        ),
        ElevatedButton(
          onPressed: () async {
            final String url = project.url ?? "";
            await canLaunch(url)
                ? await launch(url)
                : throw 'Could not launch $url';
          },
          child: Text(
            'Download',
          ),
          style: ButtonStyle(
            padding: MaterialStateProperty.all(
              isSmallOrNormalScreen
                  ? EdgeInsets.symmetric(
                      vertical: 12.0,
                      horizontal: 18.0,
                    )
                  : EdgeInsets.symmetric(
                      vertical: 14.0,
                      horizontal: 24.0,
                    ),
            ),
            textStyle: MaterialStateProperty.all(
              TextStyle(
                fontSize: isSmallOrNormalScreen ? 16.0 : 18.0,
                color: Colors.white,
              ),
            ),
            backgroundColor: MaterialStateProperty.all(
              Colors.blue.shade700,
            ),
            shape: MaterialStateProperty.all(
              RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(
                  18.0,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _getProjectImage(
      {required bool isSmallOrNormalScreen, required String? path}) {
    return Image.asset(
      path ?? "",
    );
  }
}
