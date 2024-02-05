import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Single Child Scroll"),),
      body: Column(
        children: [
          Container(height: 100, color: Colors.red,),
          Container(height: 100, color: Colors.green,),
          Container(height: 100, color: Colors.yellow,),
          Container(height: 100, color: Colors.blue,),
          Container(height: 100, color: Colors.deepPurple,),
        ],
      ),
    );
  }
}
