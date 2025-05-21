import 'package:flutter/material.dart';
import '../screens/screens.dart';

class AppRoutes {
  static final initialRoute = 'login';

  static Map<String, Widget Function(BuildContext)> routes = {
    'login': (BuildContext context) => LoginScreen(),
    'register': (BuildContext context) => RegisterScreen(),
    'home': (BuildContext context) => HomeScreen(),
    'error': (BuildContext context) => ErrorScreen(),
  };

  static Route<dynamic> onGenerateRoute(RouteSettings settings) {
    return MaterialPageRoute(builder: (context) => const ErrorScreen());
  }
}
