import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop/models/cart.dart';
import 'package:shop/models/order_list.dart';
import 'package:shop/models/product_list.dart';
import 'package:shop/screens/cart_screen.dart';
import 'package:shop/screens/orders_screen.dart';
import 'package:shop/screens/product_detail_screen.dart';
import 'package:shop/screens/product_form_page.dart';
import 'package:shop/screens/products_screen.dart';
import 'package:shop/screens/products_overview_screen.dart';
import 'package:shop/utils/app_routes.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => ProductList(),
        ),
        ChangeNotifierProvider(
          create: (_) => Cart(),
        ),
        ChangeNotifierProvider(
          create: (_) => OrderList(),
        ),
      ],
      child: MaterialApp(
        title: 'Shop',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSwatch(
            primarySwatch: Colors.purple,
          ).copyWith(
            secondary: Colors.deepOrange,
          ),
          fontFamily: 'Lato',
        ),
        // home: const ProductsOverviewScreen(),
        routes: {
          AppRoutes.home: (ctx) => const ProductsOverviewScreen(),
          AppRoutes.productDetail: (ctx) => const ProductDetailScreen(),
          AppRoutes.cart: (ctx) => const CartScreen(),
          AppRoutes.orders: (ctx) => const OrdersScreen(),
          AppRoutes.products: (ctx) => const ProductsScreen(),
          AppRoutes.productForm: (ctx) => const ProductFormPage(),
        },
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}
