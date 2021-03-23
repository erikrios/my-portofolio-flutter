import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_portofolio_flutter/bloc/portofolio/portofolio_bloc.dart';
import 'package:my_portofolio_flutter/bloc/portofolio/portofolio_state.dart';
import 'package:my_portofolio_flutter/models/role.dart';
import 'package:my_portofolio_flutter/responsive/screen_size.dart';

class Specialization extends StatelessWidget {
  final double height;
  final ScreenSize screenSize;

  Specialization({required this.screenSize, required this.height});

  @override
  Widget build(BuildContext context) {
    final bool isSmallOrNormalScreen =
        screenSize == ScreenSize.SMALL || screenSize == ScreenSize.NORMAL;
    final PortofolioBloc bloc = BlocProvider.of<PortofolioBloc>(context);

    return Container(
      height: isSmallOrNormalScreen ? height * 1 : height * 3 / 4,
      child: Stack(
        children: [
          Column(
            children: [
              Flexible(
                flex: 1,
                child: Container(
                  color: Colors.blue.shade700,
                ),
              ),
              Flexible(
                flex: 4,
                child: Container(),
              ),
            ],
          ),
          Center(
            child: Card(
              elevation: 80,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20.0),
              ),
              child: Container(
                height: height,
                width: isSmallOrNormalScreen
                    ? MediaQuery.of(context).size.width * 2.4 / 3
                    : MediaQuery.of(context).size.width * 2 / 3,
                padding: EdgeInsets.all(
                  isSmallOrNormalScreen ? 16.0 : 40.0,
                ),
                child: BlocBuilder<PortofolioBloc, PortofolioState>(
                    bloc: bloc,
                    builder: (context, state) => Column(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Flexible(
                              flex: 1,
                              child: Text(
                                'Specializing In'.toUpperCase(),
                                style: TextStyle(
                                  fontSize: isSmallOrNormalScreen ? 28.0 : 40.0,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.blue.shade700,
                                ),
                              ),
                            ),
                            Flexible(
                              flex: isSmallOrNormalScreen ? 5 : 2,
                              child: isSmallOrNormalScreen
                                  ? Column(
                                      children: _getSpecializationItems(
                                        roles: state is PortofolioSuccessState
                                            ? state.portofolio.roles
                                            : [],
                                        isSmallOrNormalScreen:
                                            isSmallOrNormalScreen,
                                      ),
                                    )
                                  : Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceAround,
                                      children: _getSpecializationItems(
                                        roles: state is PortofolioSuccessState
                                            ? state.portofolio.roles
                                            : [],
                                        isSmallOrNormalScreen:
                                            isSmallOrNormalScreen,
                                      ),
                                    ),
                            ),
                          ],
                        )),
              ),
            ),
          )
        ],
      ),
    );
  }

  List<Widget> _getSpecializationItems(
      {required bool isSmallOrNormalScreen, required List<Role> roles}) {
    final List<IconData> icons = [Icons.android, Icons.computer, Icons.web];
    int position = 0;

    return roles.map((role) {
      Widget widgetItem = Flexible(
        flex: 1,
        child: _getSpecializationItem(
          title: role.name,
          description: role.description,
          iconData: icons[position],
          isSmallOrNormalScreen: isSmallOrNormalScreen,
        ),
      );
      position++;
      return widgetItem;
    }).toList();
  }

  Widget _getSpecializationItem(
      {required String title,
      required String description,
      required IconData iconData,
      required bool isSmallOrNormalScreen}) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            width: isSmallOrNormalScreen ? 50.0 : 80.0,
            height: isSmallOrNormalScreen ? 50.0 : 80.0,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(
                isSmallOrNormalScreen ? 50.0 : 80.0,
              ),
              child: Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [Colors.deepOrange, Colors.yellow],
                    begin: Alignment(-1.0, -4.0),
                    end: Alignment(1, 4),
                    stops: [0.0, 0.7],
                  ),
                ),
                child: Icon(
                  iconData,
                  size: isSmallOrNormalScreen ? 32.0 : 50.0,
                  color: Colors.blue.shade700,
                ),
              ),
            ),
          ),
          Text(
            title,
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.blue.shade700,
              fontSize: isSmallOrNormalScreen ? 16.0 : 20.0,
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(
            description,
            textAlign: TextAlign.center,
            maxLines: isSmallOrNormalScreen ? 5 : 4,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(
              fontSize: isSmallOrNormalScreen ? 12 : 16.0,
            ),
          )
        ],
      ),
    );
  }
}
