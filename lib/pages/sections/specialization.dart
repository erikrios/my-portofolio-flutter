import 'package:flutter/material.dart';

class Specialization extends StatelessWidget {
  final double height;

  Specialization({required this.height});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
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
                width: MediaQuery.of(context).size.width * 2 / 3,
                padding: EdgeInsets.all(40),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Flexible(
                      flex: 1,
                      child: Text(
                        'Specializing In'.toUpperCase(),
                        style: TextStyle(
                          fontSize: 40.0,
                          fontWeight: FontWeight.bold,
                          color: Colors.blue.shade700,
                        ),
                      ),
                    ),
                    Flexible(
                      flex: 2,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Flexible(
                            flex: 1,
                            child: _getSpecializationItem(
                              'Android Developer',
                              Icons.android,
                            ),
                          ),
                          Flexible(
                            flex: 1,
                            child: _getSpecializationItem(
                              'Back-End Engineer',
                              Icons.computer,
                            ),
                          ),
                          Flexible(
                            flex: 1,
                            child: _getSpecializationItem(
                              'Cross-Platform Developer',
                              Icons.web,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget _getSpecializationItem(String title, IconData iconData) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            width: 80.0,
            height: 80.0,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(80.0),
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
                  size: 50,
                  color: Colors.blue.shade700,
                ),
              ),
            ),
          ),
          Text(
            title,
            style: TextStyle(
              color: Colors.blue.shade700,
              fontSize: 20.0,
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(
            'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 16.0,
            ),
          )
        ],
      ),
    );
  }
}
