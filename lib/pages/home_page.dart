import 'package:flutter/material.dart';
import 'package:my_portofolio_flutter/pages/sections/introduction.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: Padding(
          padding: const EdgeInsets.only(left: 20),
          child: Image.asset(
            'assets/images/logo.png',
          ),
        ),
        actions: [
          GestureDetector(
            child: getHeaderItem('Home'),
            onTap: () => {},
          ),
          GestureDetector(
            child: getHeaderItem('Blog'),
            onTap: () => {},
          ),
          GestureDetector(
            child: getHeaderItem('Contact'),
            onTap: () => {},
          ),
          SizedBox(width: 100),
        ],
      ),
      body: Scrollbar(
        child: SingleChildScrollView(
          child: Column(
            children: [Introduction()],
          ),
        ),
      ),
    );
  }

  Widget getHeaderItem(String title) {
    return Container(
      width: 110.0,
      child: Center(
        child: Text(
          title,
          style: TextStyle(
            color: Colors.blue,
            fontSize: 16.0,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
