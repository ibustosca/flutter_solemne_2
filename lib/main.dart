import 'package:flutter/material.dart';
import 'package:flutter_solemne_2/routes/app_routes.dart';
import 'package:flutter_solemne_2/services/auth_services.dart';
import 'package:flutter_solemne_2/services/category_service.dart';
import 'package:flutter_solemne_2/services/product_service.dart';
import 'package:flutter_solemne_2/services/supplier_service.dart';
import 'package:flutter_solemne_2/themes/my_theme.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const AppState());
}

class AppState extends StatelessWidget {
  const AppState({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => AuthServices()),
        ChangeNotifierProvider(create: (_) => ProductService()),
        ChangeNotifierProvider(create: (_) => SupplierService()),
        ChangeNotifierProvider(create: (_) => CategoryService()),
      ],
      child: MainApp(),
    );
  }
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Solemne 2',
      initialRoute: AppRoutes.initialRoute,
      routes: AppRoutes.routes,
      onGenerateRoute: AppRoutes.onGenerateRoute,
      theme: MyTheme.myTheme,
    );
  }
}
