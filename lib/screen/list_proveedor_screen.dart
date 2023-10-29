import 'package:flutter/material.dart';
import 'package:examen_final/models/proveedores.dart';
import 'package:examen_final/services/services.dart';
import 'package:provider/provider.dart';
import 'package:examen_final/screen/screen.dart';

class ListProveedorScreen extends StatelessWidget {
  const ListProveedorScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final proveedorService = Provider.of<ProveedorService>(context);
    if (proveedorService.isLoading) return LoadingScreen();
    return Scaffold(
      appBar: AppBar(
        title: const Text('Listado de proveedores'),
      ),
      body: ListView.builder(
        itemCount: proveedorService.proveedores.length,
        itemBuilder: (BuildContext context, index) {
          final proveedor = proveedorService.proveedores[index];
          return Container(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: () {
                proveedorService.SelectProveedor = proveedor.copy();
                Navigator.pushNamed(context, 'editproveedor');
              },
              style: ElevatedButton.styleFrom(
                primary: Color.fromRGBO(46, 151, 51, 1),
                minimumSize: Size(double.infinity, 0), // Ancho fijo
                alignment:
                    Alignment.centerLeft, // Alinea el contenido a la izquierda
              ),
              child: Text(
                "Nombre: " +
                    proveedor.proveedorName +
                    " " +
                    "Apellido: " +
                    proveedor.proveedorLastName +
                    "\n" +
                    "E-Mail: " +
                    proveedor.proveedorMail,
                textAlign: TextAlign.left,
              ),
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () {
          proveedorService.SelectProveedor = Listado(
              proveedorId: 0,
              proveedorName: '',
              proveedorLastName: '',
              proveedorMail: '',
              proveedorState: 'Activa');
          Navigator.pushNamed(context, 'editproveedor');
        },
      ),
    );
  }
}
