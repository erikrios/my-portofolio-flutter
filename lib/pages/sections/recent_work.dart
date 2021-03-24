import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_portofolio_flutter/bloc/portofolio/portofolio_bloc.dart';
import 'package:my_portofolio_flutter/bloc/portofolio/portofolio_state.dart';
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
    final bool isSmallOrNormalScreen =
        screenSize == ScreenSize.SMALL || screenSize == ScreenSize.NORMAL;
    final PortofolioBloc bloc = BlocProvider.of<PortofolioBloc>(context);

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
                  child: BlocBuilder<PortofolioBloc, PortofolioState>(
                    bloc: bloc,
                    builder: (context, state) => CarouselSlider.builder(
                      itemCount: state is PortofolioSuccessState
                          ? state.portofolio.projects.length
                          : 0,
                      itemBuilder: (BuildContext context, int index, _) =>
                          ProjectItem(
                        isSmallOrNormalScreen: isSmallOrNormalScreen,
                        project: (state is PortofolioSuccessState)
                            ? state.portofolio.projects[index]
                            : Project(
                                name: '',
                                description: '',
                                url: '',
                                imagePath: '',
                              ),
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
}
