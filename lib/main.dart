import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:m9_m12_all/home_screen.dart';

void main(){
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.teal
      ),
      home: HomeScreen(),
    );
  }
}
