import 'package:flutter/material.dart';
import 'package:examen_final/screen/screen.dart';
import '../theme/my_theme.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Mi Aplicación de Compras'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CustomButton(
              label: 'Explorar Productos',
              destination: ListProductScreen(),
            ),
            CustomButton(
              label: 'Categorías de Productos',
              destination: ListCategoryScreen(),
            ),
            CustomButton(
              label: 'Nuestros Proveedores',
              destination: ListProveedorScreen(),
            ),
          ],
        ),
      ),
    );
  }
}

class CustomButton extends StatelessWidget {
  final String label;
  final Widget destination;

  CustomButton({required this.label, required this.destination});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => destination,
          ),
        );
      },
      style: ElevatedButton.styleFrom(
        primary: MyTheme.primary,
      ),
      child: Text(
        label,
        style: TextStyle(
          color: Colors.white,
        ),
      ),
    );
  }
}
