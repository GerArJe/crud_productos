import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_signin_example/User/pages/sign_in_screen.dart';

import 'Product/pages/add_product.dart';
import 'Product/pages/products_list.dart';
import 'Product/pages/update_product.dart';

class RouterApp {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case '/':
        return MaterialPageRoute(builder: (_) => SignInScreen());
      case '/addProduct':
        return MaterialPageRoute(builder: (_) => AddProduct());
      default:
        return MaterialPageRoute(
            builder: (_) => Scaffold(
                  body: Center(
                    child: Text('No route defined for ${settings.name}'),
                  ),
                ));
    }
  }
}
