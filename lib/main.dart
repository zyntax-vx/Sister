import 'package:flutter/material.dart';
import 'auth/splash.dart';
import 'auth/tema.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'SISTER',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(colorSchemeSeed: biru, useMaterial3: true),
      home: const Splash(),
    );
  }
}
