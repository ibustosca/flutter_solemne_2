import 'package:flutter/material.dart';
import '../screens/screens.dart';

class AppRoutes {
  static final initialRoute = 'login';

  static Map<String, Widget Function(BuildContext)> routes = {
    'login': (BuildContext context) => LoginScreen(),
    'register': (BuildContext context) => RegisterScreen(),
    'home': (BuildContext context) => HomeScreen(),
    'error': (BuildContext context) => ErrorScreen(),
    'list_product': (BuildContext context) => ListProductScreen(),
    'edit_product': (BuildContext context) => EditProductScreen(),
    'list_category': (BuildContext context) => ListCategoryScreen(),
    'edit_category': (BuildContext context) => EditCategoryScreen(),
    'list_supplier': (BuildContext context) => ListSupplierScreen(),
    'edit_supplier': (BuildContext context) => EditSupplierScreen(),
  };

  static Route<dynamic> onGenerateRoute(RouteSettings settings) {
    return MaterialPageRoute(builder: (context) => const ErrorScreen());
  }
}
