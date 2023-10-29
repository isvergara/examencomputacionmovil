import 'package:flutter/material.dart';
import 'package:examen_final/screen/screen.dart';

class AppRoutes {
  static const initialRoute = 'login';
  static Map<String, Widget Function(BuildContext)> routes = {
    'login': (BuildContext context) => const LoginScreen(),
    'list': (BuildContext context) => const HomeScreen(),
    'editproduct': (BuildContext context) => const EditProductScreen(),
    'editcategory': (BuildContext context) => const EditCategoryScreen(),
    'editproveedor': (BuildContext context) => const EditProveedorScreen(),
    'add_user': (BuildContext context) => const RegisterUserScreen(),
  };

  static Route<dynamic> onGenerateRoute(RouteSettings settings) {
    return MaterialPageRoute(
      builder: (context) => const ErrorScreen(),
    );
  }
}
