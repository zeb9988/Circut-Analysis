import 'package:circutanalysis/Firstpage.dart';
import 'package:flutter/material.dart';

void main() => runApp(const MathApp());

class MathApp extends StatelessWidget {
  const MathApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: StartPage(),
    );
  }
}
