import 'package:flutter/material.dart';
import 'package:instagram_clone/constants/colors.dart';
import 'package:instagram_clone/responsive/mobilescreen_layout.dart';
import 'package:instagram_clone/responsive/responsive_layoutscreen.dart';
import 'package:instagram_clone/responsive/webscreen_layout.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Instagram Clone',
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark()
          .copyWith(scaffoldBackgroundColor: mobileBackgroundColor),
      home: const ResponsiveLayout(
          webScreenLayout: WebScreenLayout(),
          mobileScreenLayout: MobileScreenLayout()),
    );
  }
}
