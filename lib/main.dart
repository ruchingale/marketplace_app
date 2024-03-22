import 'package:flutter/material.dart';
import 'sellInfor.dart';

import 'homeSeller.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'FlutterDemo',
        debugShowCheckedModeBanner: false,
        home: HomeSellerPage());
  }
}
