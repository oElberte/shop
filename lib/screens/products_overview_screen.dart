import 'package:flutter/material.dart';
import 'package:shop/components/product_grid.dart';

class ProductsOverviewScreen extends StatelessWidget {
  const ProductsOverviewScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('My shop'),
      ),
      body: const ProductGrid(),
    );
  }
}
