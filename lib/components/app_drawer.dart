import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop/models/auth.dart';
import 'package:shop/utils/app_routes.dart';

class AppDrawer extends StatelessWidget {
  const AppDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          AppBar(
            title: const Text('Welcome User!'),
            automaticallyImplyLeading: false,
          ),
          const Divider(),
          ListTile(
            leading: const Icon(Icons.shop),
            title: const Text('Shop'),
            onTap: () {
              Navigator.of(context).pushReplacementNamed(
                AppRoutes.authOrHome,
              );
            },
          ),
          const Divider(),
          ListTile(
            leading: const Icon(Icons.payment),
            title: const Text('Orders'),
            onTap: () {
              Navigator.of(context).pushReplacementNamed(
                AppRoutes.orders,
              );
            },
          ),
          const Divider(),
          ListTile(
            leading: const Icon(Icons.edit),
            title: const Text('Product management'),
            onTap: () {
              Navigator.of(context).pushReplacementNamed(
                AppRoutes.products,
              );
            },
          ),
          const Divider(),
          ListTile(
            leading: const Icon(Icons.exit_to_app),
            title: const Text('Exit'),
            onTap: () {
              showDialog(
                context: context,
                builder: (ctx) => AlertDialog(
                  title: const Text('Exit'),
                  content: const Text('Want to log out of your account?'),
                  actions: [
                    TextButton(
                      onPressed: () => Navigator.of(context).pop(),
                      child: const Text('No'),
                    ),
                    TextButton(
                      onPressed: () {
                        // For some reason this part of the code without the pop was duplicating the items on the store every time the user logs out and logs in. With the pop this doesn't happen anymore.
                        Navigator.of(context).pop();

                        Provider.of<Auth>(
                          context,
                          listen: false,
                        ).logout();

                        Navigator.of(context).pushReplacementNamed(
                          AppRoutes.authOrHome,
                        );
                      },
                      child: const Text('Yes'),
                    ),
                  ],
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
