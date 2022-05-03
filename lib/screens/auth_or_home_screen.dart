import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop/models/auth.dart';
import 'package:shop/screens/auth_screen.dart';
import 'package:shop/screens/products_overview_screen.dart';

class AuthOrHomeScreen extends StatelessWidget {
  const AuthOrHomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Auth auth = Provider.of(context);
    // return auth.isAuth ? ProductsOverviewScreen() : AuthScreen();
    return FutureBuilder(
      future: auth.tryAutoLogin(),
      builder: (ctx, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Container(
            color: Colors.white,
            child: const Center(
              child: CircularProgressIndicator.adaptive(),
            ),
          );
        } else if (snapshot.error != null) {
          return Container(
            color: Colors.white,
            child: const Center(
              child: Text("An error has ocurred!"),
            ),
          );
        } else {
          return auth.isAuth
              ? const ProductsOverviewScreen()
              : const AuthScreen();
        }
      },
    );
  }
}
