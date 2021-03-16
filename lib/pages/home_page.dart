import 'package:flutter/material.dart';
import 'package:my_portofolio_flutter/pages/sections/introduction.dart';
import 'package:my_portofolio_flutter/pages/sections/recent_work.dart';
import 'package:my_portofolio_flutter/pages/sections/resume.dart';
import 'package:my_portofolio_flutter/pages/sections/specialization.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
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
          getHeaderItem('Home'),
          getHeaderItem('Blog'),
          getHeaderItem('Contact'),
          SizedBox(width: 100),
        ],
      ),
      body: Scrollbar(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Introduction(
                height: size.height * 3 / 4,
              ),
              Resume(
                height: size.height * 3 / 4,
              ),
              Specialization(
                height: size.height * 3 / 4,
              ),
              RecentWork(
                height: size.height * 3 / 4,
              ),
            ],
          ),
        ),
      ),
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
}
