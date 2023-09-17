import 'package:cv/pages/cv_view.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'CV app',
      theme: ThemeData(primarySwatch: Colors.blueGrey),
      home: const CvViewPage(),
    );
  }
}
