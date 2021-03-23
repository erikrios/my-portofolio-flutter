import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_portofolio_flutter/bloc/portofolio/portofolio_bloc.dart';
import 'package:my_portofolio_flutter/bloc/portofolio/portofolio_state.dart';
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

    final PortofolioBloc bloc = BlocProvider.of<PortofolioBloc>(context);

    return Container(
      height: this.height * 3 / 4,
      child: isSmallOrNormalScreen
          ? Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Flexible(
                  flex: 2,
                  child: _handleInfo(
                    bloc: bloc,
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
                    bloc: bloc,
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

  Widget _handleInfo(
      {required PortofolioBloc bloc, required bool isSmallOrNormalScreen}) {
    return BlocBuilder<PortofolioBloc, PortofolioState>(
        builder: (context, state) {
      return Container(
        padding: isSmallOrNormalScreen
            ? EdgeInsets.symmetric(horizontal: 16, vertical: 16)
            : EdgeInsets.symmetric(horizontal: 50, vertical: 50),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: isSmallOrNormalScreen
              ? CrossAxisAlignment.center
              : CrossAxisAlignment.start,
          children: [
            Text(
              'Hello'.toUpperCase(),
              textAlign:
                  isSmallOrNormalScreen ? TextAlign.center : TextAlign.left,
              style: TextStyle(
                color: Colors.blue.shade700,
                fontSize: isSmallOrNormalScreen ? 20.0 : 30.0,
              ),
            ),
            Text(
              state is PortofolioLoadingState
                  ? "Loading...".toUpperCase()
                  : state is PortofolioErrorState
                      ? "No Data".toUpperCase()
                      : (state as PortofolioSuccessState)
                          .portofolio
                          .name
                          .toUpperCase(),
              textAlign:
                  isSmallOrNormalScreen ? TextAlign.center : TextAlign.left,
              style: TextStyle(
                color: Colors.blue.shade700,
                fontWeight: FontWeight.bold,
                fontSize: isSmallOrNormalScreen ? 30.0 : 50.0,
              ),
            ),
            Text(
              state is PortofolioLoadingState
                  ? "Loading..."
                  : state is PortofolioErrorState
                      ? "No Data"
                      : (state as PortofolioSuccessState)
                          .portofolio
                          .introduction,
              maxLines: isSmallOrNormalScreen ? 10 : 6,
              overflow: TextOverflow.ellipsis,
              textAlign:
                  isSmallOrNormalScreen ? TextAlign.center : TextAlign.left,
              style: TextStyle(
                fontSize: isSmallOrNormalScreen ? 14.0 : 16.0,
              ),
            ),
            Align(
              alignment: isSmallOrNormalScreen
                  ? Alignment.center
                  : Alignment.centerLeft,
              child: ElevatedButton(
                onPressed: () async {
                  final Uri emailLaunchUri = Uri(
                    scheme: 'mailto',
                    path: state is PortofolioSuccessState
                        ? state.portofolio.contacts
                            .firstWhere((contact) =>
                                contact.platform.toLowerCase() ==
                                'Gmail'.toLowerCase())
                            .url
                        : 'erikriosetiawan15@gmail.com',
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
    });
  }

  Widget _handleImage() {
    return Container(
      child: Image.asset('assets/images/illustration.png'),
    );
  }
}
