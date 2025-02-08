import 'package:flutter/material.dart';
import 'package:news/app_them.dart';
import 'package:news/homeScreen.dart';
import 'package:news/news/news_view.dart';

void main() {
  runApp(myApp());
}

class myApp extends StatelessWidget {
  const myApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        Homescreen.routName: (_) => Homescreen(),
      },
      initialRoute: Homescreen.routName,
      theme: AppThem.lightMode,
      darkTheme: AppThem.darkMode,
      themeMode: ThemeMode.dark,
    );
  }
}
