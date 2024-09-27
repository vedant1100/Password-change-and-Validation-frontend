import 'package:flutter/material.dart';
import 'package:password_change/accountDetails.dart';
import 'passwordChange.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        appBarTheme: const AppBarTheme(color: Colors.white)
      ),
      home: accountDetails(),
    );
  }
}
