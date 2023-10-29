//ISMAEL VERGARA VIDELA
//16.936.330-7
//SEM 2 2023 | COMPUTACIÓN MÓVIL | eICFE1119-07

import 'package:flutter/material.dart';
import 'package:examen_final/screen/screen.dart';
import '../theme/my_theme.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Mi Aplicación de Compras'),
      ),
      body: const Center(
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

  const CustomButton({required this.label, required this.destination});

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
        backgroundColor: MyTheme.primary,
      ),
      child: Text(
        label,
        style: const TextStyle(
          color: Colors.white,
        ),
      ),
    );
  }
}
