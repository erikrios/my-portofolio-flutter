import 'package:flutter/material.dart';
import 'package:my_portofolio_flutter/models/project.dart';
import 'package:url_launcher/url_launcher.dart';

class ProjectItem extends StatelessWidget {
  final Project project;

  ProjectItem({required this.project});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Flexible(
          flex: 2,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                project.name ?? "No Title",
                style: TextStyle(
                  fontSize: 26,
                  color: Colors.amber,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                project.description ?? "No Description",
                style: TextStyle(
                  fontSize: 16.0,
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
                    EdgeInsets.symmetric(
                      vertical: 14,
                      horizontal: 24,
                    ),
                  ),
                  textStyle: MaterialStateProperty.all(
                    TextStyle(
                      fontSize: 18.0,
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
          ),
        ),
        SizedBox(
          width: 50,
        ),
        Flexible(
          flex: 1,
          child: Image.asset(
            project.imagePath ?? "",
          ),
        ),
      ],
    );
  }
}
