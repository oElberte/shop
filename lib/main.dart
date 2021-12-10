import 'package:flutter/material.dart';
import 'package:shop/screens/products_overview_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Shop',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSwatch(
          primarySwatch: Colors.pink,
        ).copyWith(
          secondary: Colors.deepOrange,
        ),
        fontFamily: 'Lato',
      ),
      home: ProductsOverviewScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}
