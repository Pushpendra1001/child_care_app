import 'package:child_care/views/screens/callender_attendence.dart';
import 'package:child_care/views/screens/photogallery/image_gallery_screen.dart';
import 'package:child_care/views/screens/loginScreens/intro1.dart';
import 'package:child_care/views/screens/loginScreens/signIn_page.dart';
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
      home: IntroPage1(),
    );
  }
}
