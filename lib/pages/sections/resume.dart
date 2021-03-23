import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_portofolio_flutter/bloc/portofolio/portofolio_bloc.dart';
import 'package:my_portofolio_flutter/bloc/portofolio/portofolio_state.dart';
import 'package:my_portofolio_flutter/responsive/screen_size.dart';
import 'package:url_launcher/url_launcher.dart';

class Resume extends StatelessWidget {
  final ScreenSize screenSize;
  final double height;

  Resume({required this.screenSize, required this.height});

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    final bool isSmallOrNormalScreen =
        screenSize == ScreenSize.SMALL || screenSize == ScreenSize.NORMAL;
    final PortofolioBloc bloc = BlocProvider.of<PortofolioBloc>(context);

    return Container(
      padding: EdgeInsets.all(
        isSmallOrNormalScreen ? 16.0 : 40.0,
      ),
      color: Colors.blue.shade700,
      height: height * 3 / 4,
      child: isSmallOrNormalScreen
          ? Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Flexible(
                  flex: 2,
                  child: _handlePhotos(
                    isSmallOrNormalScreen: isSmallOrNormalScreen,
                    width: width,
                  ),
                ),
                Flexible(
                  flex: 3,
                  child: _handleInfo(
                    bloc: bloc,
                    isSmallOrNormalScreen: isSmallOrNormalScreen,
                  ),
                ),
              ],
            )
          : Row(
              children: [
                Flexible(
                  flex: 1,
                  child: _handlePhotos(
                    isSmallOrNormalScreen: isSmallOrNormalScreen,
                    width: width,
                  ),
                ),
                Flexible(
                  flex: 1,
                  child: _handleInfo(
                    bloc: bloc,
                    isSmallOrNormalScreen: isSmallOrNormalScreen,
                  ),
                ),
              ],
            ),
    );
  }

  Widget _handlePhotos(
      {required bool isSmallOrNormalScreen, required double width}) {
    return Container(
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
    );
  }

  Widget _handleInfo(
      {required PortofolioBloc bloc, required bool isSmallOrNormalScreen}) {
    return BlocBuilder<PortofolioBloc, PortofolioState>(
      bloc: bloc,
      builder: (context, state) => Container(
        padding: isSmallOrNormalScreen
            ? EdgeInsets.all(16.0)
            : EdgeInsets.only(right: 100, top: 50, bottom: 50),
        child: Column(
          mainAxisAlignment: isSmallOrNormalScreen
              ? MainAxisAlignment.spaceBetween
              : MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              'Hi, Nice to meet you.',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: isSmallOrNormalScreen ? 18.0 : 26.0,
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              state is PortofolioLoadingState
                  ? "Loading..."
                  : state is PortofolioErrorState
                      ? "No Data"
                      : (state as PortofolioSuccessState).portofolio.resume,
              textAlign: TextAlign.center,
              maxLines: 9,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                fontSize: isSmallOrNormalScreen ? 14.0 : 16.0,
                color: Colors.white,
              ),
            ),
            ElevatedButton(
              onPressed: () async {
                final String url = state is PortofolioSuccessState
                    ? state.portofolio.contacts
                        .singleWhere((contact) =>
                            contact.platform.toLowerCase() ==
                            'LinkedIn'.toLowerCase())
                        .url
                    : 'https://www.linkedin.com/in/erikriosetiawan/';
                await canLaunch(url)
                    ? await launch(url)
                    : throw 'Could not launch $url';
              },
              child: Text('Download CV'),
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
                    color: Colors.blue.shade700,
                  ),
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
    );
  }
}
