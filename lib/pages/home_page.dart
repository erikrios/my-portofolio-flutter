import 'package:flutter/material.dart';
import 'package:my_portofolio_flutter/pages/sections/contact.dart';
import 'package:my_portofolio_flutter/pages/sections/introduction.dart';
import 'package:my_portofolio_flutter/pages/sections/recent_work.dart';
import 'package:my_portofolio_flutter/pages/sections/resume.dart';
import 'package:my_portofolio_flutter/pages/sections/specialization.dart';
import 'package:my_portofolio_flutter/responsive/screen_size.dart';
import 'package:my_portofolio_flutter/responsive/util.dart';
import 'sections/footer.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final Size _size = MediaQuery.of(context).size;
    ScreenSize _screenSize;

    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        switch (getScreenSize(constraints.maxWidth)) {
          case ScreenSize.SMALL:
            {
              _screenSize = ScreenSize.SMALL;
              print(ScreenSize.SMALL.toString());
            }
            break;
          case ScreenSize.NORMAL:
            {
              _screenSize = ScreenSize.NORMAL;
              print(ScreenSize.NORMAL.toString());
            }
            break;
          case ScreenSize.MEDIUM:
            {
              _screenSize = ScreenSize.MEDIUM;
              print(ScreenSize.MEDIUM.toString());
            }
            break;
          case ScreenSize.LARGE:
            {
              _screenSize = ScreenSize.LARGE;
              print(ScreenSize.LARGE.toString());
            }
        }
        return Scaffold(
          appBar: getAppBar(
            screenSize: _screenSize,
          ),
          drawer: getDrawer(
            context: context,
            screenSize: _screenSize,
          ),
          body: Scrollbar(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Introduction(
                    screenSize: _screenSize,
                    height: _size.height,
                  ),
                  Resume(
                    screenSize: _screenSize,
                    height: _size.height,
                  ),
                  Specialization(
                    height: _size.height * 3 / 4,
                  ),
                  RecentWork(
                    height: _size.height * 5 / 6,
                  ),
                  Contact(
                    height: _size.height * 5 / 6,
                  ),
                  Footer(
                    height: _size.height * 1 / 4,
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  Widget getHeaderItem(String title) {
    return Container(
      width: 110.0,
      child: Center(
        child: TextButton(
          onPressed: () {},
          child: Text(
            title,
            style: TextStyle(
              color: Colors.blue.shade700,
              fontSize: 16.0,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }

  AppBar? getAppBar({required ScreenSize screenSize}) {
    bool isSmallScreen = screenSize == ScreenSize.SMALL;

    return AppBar(
      backgroundColor: Colors.white,
      title: isSmallScreen
          ? Text(
              'Erik Rio Setiawan',
              style: TextStyle(
                color: Colors.blue.shade700,
              ),
            )
          : null,
      leading: isSmallScreen
          ? Builder(
              builder: (BuildContext context) {
                return IconButton(
                  icon: Icon(
                    Icons.menu,
                    color: Colors.blue.shade700,
                  ),
                  onPressed: () {
                    Scaffold.of(context).openDrawer();
                  },
                );
              },
            )
          : Padding(
              padding: const EdgeInsets.only(left: 20),
              child: Image.asset(
                'assets/images/logo.png',
              ),
            ),
      actions: isSmallScreen
          ? null
          : [
              getHeaderItem('Home'),
              getHeaderItem('Blog'),
              getHeaderItem('Contact'),
              SizedBox(width: 100),
            ],
    );
  }

  Drawer? getDrawer(
      {required BuildContext context, required ScreenSize screenSize}) {
    bool isSmallScreen = screenSize == ScreenSize.SMALL;
    if (isSmallScreen)
      return Drawer(
        child: ListView(
          children: [
            ListTile(
              onTap: () {
                Navigator.of(context).pop();
              },
              title: Text(
                'Home',
              ),
            ),
            ListTile(
              onTap: () {
                Navigator.of(context).pop();
              },
              title: Text(
                'Blog',
              ),
            ),
            ListTile(
              onTap: () {
                Navigator.of(context).pop();
              },
              title: Text(
                'Contact',
              ),
            ),
          ],
        ),
      );
    else
      return null;
  }
}
