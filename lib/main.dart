import 'package:flutter/material.dart';
import 'package:profile/views/screens/company_view.dart';


void main(List<String> args) {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: CompanyView(),
    );
  }
}