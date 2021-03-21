import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;
import 'package:my_portofolio_flutter/models/portofolio.dart';

import 'pages/home_page.dart';

void main() {
  LicenseRegistry.addLicense(() async* {
    final license = await rootBundle.loadString('google_fonts/LICENSE.txt');
    yield LicenseEntryWithLineBreaks(['google_fonts'], license);
  });
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    getPortofolio().then((portofolio) => print(portofolio));
    return MaterialApp(
      title: 'Erik Rio Setiawan',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        textTheme: GoogleFonts.robotoTextTheme(
          Theme.of(context).textTheme,
        ),
      ),
      home: HomePage(),
    );
  }

  Future<Portofolio> getPortofolio() async {
    http.Response response = await http.get(Uri.https(
        'raw.githubusercontent.com',
        'erikrios/dummy-file-testing/master/json/my-portofolio.json'));
    if (response.statusCode == 200)
      return Portofolio.fromJson(jsonDecode(response.body));
    else
      throw Exception('Failed to load portofolio');
  }
}
