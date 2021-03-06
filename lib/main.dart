import 'package:flutter/material.dart';
import 'package:iuniversities/views/details_page.dart';
import 'package:iuniversities/views/home_page.dart';
import 'package:iuniversities/views/universities_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.purple,
      ),
      initialRoute: '/HomePage',
      routes: {
        '/HomePage': (_) => const HomePage(),
        '/universitiesPage': (_) => const UniversitiesPage(),
        '/details': (_) => const DetailsPage(),
      },
    );
  }
}
