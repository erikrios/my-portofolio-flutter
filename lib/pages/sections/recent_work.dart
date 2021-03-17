import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:my_portofolio_flutter/models/project.dart';
import 'package:my_portofolio_flutter/responsive/screen_size.dart';
import 'package:my_portofolio_flutter/widgets/project_item.dart';
import 'package:url_launcher/url_launcher.dart';

class RecentWork extends StatelessWidget {
  final double height;
  final ScreenSize screenSize;

  RecentWork({required this.screenSize, required this.height});

  @override
  Widget build(BuildContext context) {
    final projects = getProjects();
    final bool isSmallOrNormalScreen =
        screenSize == ScreenSize.SMALL || screenSize == ScreenSize.NORMAL;

    return Container(
      height: isSmallOrNormalScreen ? height * 1.2 : height * 5 / 6,
      padding: isSmallOrNormalScreen
          ? EdgeInsets.all(16.0)
          : EdgeInsets.only(
              left: 100,
              top: 40,
              right: 100,
            ),
      child: Column(
        mainAxisAlignment: isSmallOrNormalScreen
            ? MainAxisAlignment.spaceEvenly
            : MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Flexible(
            flex: isSmallOrNormalScreen ? 1 : 2,
            child: Text(
              "What I've Been Up To".toUpperCase(),
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: isSmallOrNormalScreen ? 28.0 : 40.0,
                fontWeight: FontWeight.bold,
                color: Colors.blue.shade700,
              ),
            ),
          ),
          Flexible(
            flex: 1,
            child: Text(
              "Here's a selection of some recent work",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: isSmallOrNormalScreen ? 16.0 : 18.0,
                color: Colors.blue,
              ),
            ),
          ),
          Flexible(
            flex: isSmallOrNormalScreen ? 10 : 8,
            child: Center(
              child: Card(
                elevation: 80,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20.0),
                ),
                child: Container(
                  height: double.maxFinite,
                  width: isSmallOrNormalScreen
                      ? MediaQuery.of(context).size.width * 2.4 / 3
                      : MediaQuery.of(context).size.width * 2 / 3,
                  padding: EdgeInsets.symmetric(
                    vertical: isSmallOrNormalScreen ? 16.0 : 25.0,
                    horizontal: isSmallOrNormalScreen ? 20.0 : 100.0,
                  ),
                  child: CarouselSlider.builder(
                    itemCount: projects.length,
                    itemBuilder: (BuildContext context, int index, _) =>
                        ProjectItem(
                      isSmallOrNormalScreen: isSmallOrNormalScreen,
                      project: projects[index],
                    ),
                    options: CarouselOptions(
                      autoPlay: true,
                      height: double.maxFinite,
                      viewportFraction: 1,
                      autoPlayInterval: Duration(
                        seconds: 5,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
          Flexible(
            flex: 1,
            child: ElevatedButton.icon(
              onPressed: () async {
                final String playStoreAccountUrl =
                    'https://play.google.com/store/apps/dev?id=8775578834200610548';
                await canLaunch(playStoreAccountUrl)
                    ? launch(playStoreAccountUrl)
                    : throw 'Could not launch $playStoreAccountUrl';
              },
              icon: Icon(
                Icons.shop,
                color: Colors.blue.shade700,
              ),
              label: Text(
                'See more on Google Play Store',
                style: TextStyle(
                  fontSize: 18.0,
                  color: Colors.blue.shade700,
                  fontWeight: FontWeight.bold,
                ),
              ),
              style: ButtonStyle(
                padding: MaterialStateProperty.all(
                  EdgeInsets.symmetric(
                    vertical: 14,
                    horizontal: 24,
                  ),
                ),
                backgroundColor: MaterialStateProperty.all(
                  Colors.white,
                ),
                side: MaterialStateProperty.all(
                  BorderSide(
                    color: Colors.blue.shade700,
                    width: 2.0,
                  ),
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
          ),
        ],
      ),
    );
  }

  List<Project> getProjects() {
    return [
      Project(
        name: 'Reog Apps',
        description:
            'Reog Apps merupakan sebuah aplikasi mobile berbasis Android yang digunakan untuk memudahkan segala infomasi yang ada di Ponorogo. Kini Anda dapat dengan mudah mendapatkan informasi aktual dan terbaru seputar wilayah Ponorogo hanya dengan sekali klik. Banyak sekali fitur-fitur yang ditawarkan oleh aplikasi Reog Apps ini, diantaranya informasi seputar Ponorogo, tempat wisata di Ponorogo, makanan khas, sejarah, dan wallpaper Reog Ponorogo.',
        url:
            'https://play.google.com/store/apps/details?id=io.erikrios.github.reogapps',
        imagePath: 'assets/images/reogapps.png',
      ),
      Project(
        name: 'Reog Wallpaper',
        description:
            'Reog Wallpaper merupakan aplikasi keren yang berisi kumpulan wallpaper Reog Ponorogo. Dengan menggunakan aplikasi Reog Apps ini, kamu bisa menemukan gambar menarik mengenai Reog Ponorogo, antara lain wallpaper Reog, wallpaper Klono Sewandono, wallpaper Bujang Ganong, wallpaper Warok, dan wallpaper Jathil. Selain itu, wallpaper tersebut bisa diatur sebagai home screen (layar depan), lock screen (layar kunci), bahkan keduanya di perangkat / smartphone kamu.',
        url:
            'https://play.google.com/store/apps/details?id=io.erikrios.github.reogwallpaper',
        imagePath: 'assets/images/reogwallpaper.png',
      )
    ];
  }
}
