import 'package:flutter/material.dart';
import 'package:scroll/pages/grid_view_page.dart';
import 'package:scroll/pages/home_page.dart';
import 'package:scroll/pages/list_view_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const GridViewPage(),
    );
  }
}
