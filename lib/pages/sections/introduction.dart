import 'package:flutter/material.dart';

class Introduction extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    double height = size.height;
    double width = size.width;

    return Container(
      height: 500,
      child: Row(
        children: [
          Container(
            height: height,
            width: width / 2,
            padding: EdgeInsets.symmetric(horizontal: 50, vertical: 80),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Hello'.toUpperCase(),
                  style: TextStyle(
                    color: Colors.blue.shade700,
                    fontSize: 30.0,
                  ),
                ),
                Text(
                  "I'm Erik Rio Setiawan".toUpperCase(),
                  style: TextStyle(
                    color: Colors.blue.shade700,
                    fontWeight: FontWeight.bold,
                    fontSize: 50.0,
                  ),
                ),
                Text(
                  "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.",
                  style: TextStyle(
                    fontSize: 16.0,
                  ),
                ),
                ElevatedButton(
                  onPressed: () => {},
                  child: Text("Let's Talk!"),
                  style: ButtonStyle(
                    padding: MaterialStateProperty.all(
                      EdgeInsets.symmetric(horizontal: 24, vertical: 14),
                    ),
                    textStyle: MaterialStateProperty.all(TextStyle(
                      fontSize: 18.0,
                    )),
                    backgroundColor:
                        MaterialStateProperty.all(Colors.blue.shade700),
                    shape: MaterialStateProperty.all(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(18.0),
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
          Container(
            height: height,
            width: width / 2,
            child: Image.asset('assets/images/illustration.png'),
          )
        ],
      ),
    );
  }
}
