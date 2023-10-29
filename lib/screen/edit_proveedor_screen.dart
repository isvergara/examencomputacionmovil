//ISMAEL VERGARA VIDELA
//16.936.330-7
//SEM 2 2023 | COMPUTACIÓN MÓVIL | eICFE1119-07

import 'package:flutter/material.dart';
import 'package:examen_final/providers/proveedor_form_provider.dart';
import 'package:examen_final/services/proveedor_service.dart';
import 'package:provider/provider.dart';
import '../ui/input_decorations.dart';

class EditProveedorScreen extends StatelessWidget {
  const EditProveedorScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final proveedorService = Provider.of<ProveedorService>(context);
    return ChangeNotifierProvider(
      create: (_) => ProveedorFormProvider(proveedorService.SelectProveedor!),
      child: _ProveedorScreenBody(proveedorService: proveedorService),
    );
  }
}

class _ProveedorScreenBody extends StatelessWidget {
  const _ProveedorScreenBody({
    Key? key,
    required this.proveedorService,
  }) : super(key: key);

  final ProveedorService proveedorService;

  @override
  Widget build(BuildContext context) {
    final proveedorForm = Provider.of<ProveedorFormProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Editar Proveedor'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            _ProveedorForm(),
          ],
        ),
      ),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
            backgroundColor: Colors.red,
            onPressed: () async {
              if (!proveedorForm.isValidForm()) return;
              await proveedorService.deleteProveedor(
                  proveedorForm.proveedor, context);
            },
            heroTag: null,
            child: const Icon(Icons.delete_forever),
          ),
          const SizedBox(width: 20),
          FloatingActionButton(
            backgroundColor: Colors.green, // Color de fondo del botón
            onPressed: () async {
              if (!proveedorForm.isValidForm()) return;
              await proveedorService
                  .editOrCreateProveedor(proveedorForm.proveedor);
            },
            heroTag: null,
            child: const Icon(Icons.save_alt_outlined),
          ),
        ],
      ),
    );
  }
}

class _ProveedorForm extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final proveedorForm = Provider.of<ProveedorFormProvider>(context);
    final proveedor = proveedorForm.proveedor;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        width: double.infinity,
        decoration: _createDecoration(),
        child: Form(
          key: proveedorForm.formKey,
          autovalidateMode: AutovalidateMode.onUserInteraction,
          child: Column(
            children: [
              TextFormField(
                initialValue: proveedor.proveedorName,
                onChanged: (value) => proveedor.proveedorName = value,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'el nombre es obligatorio';
                  }
                  return null;
                },
                decoration: InputDecortions.authInputDecoration(
                  hinText: 'Nombre del proveedor',
                  labelText: 'Nombre del proveedor',
                ),
              ),
              const SizedBox(height: 20),

              TextFormField(
                initialValue: proveedor.proveedorLastName,
                onChanged: (value) => proveedor.proveedorLastName = value,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'el apellido es obligatorio';
                  }
                  return null;
                },
                decoration: InputDecortions.authInputDecoration(
                  hinText: 'Apellido del proveedor',
                  labelText: 'Apellido del proveedor',
                ),
              ),
              const SizedBox(height: 20),

              TextFormField(
                initialValue: proveedor.proveedorMail,
                onChanged: (value) => proveedor.proveedorMail = value,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'el email es obligatorio';
                  }
                  return null;
                },
                decoration: InputDecortions.authInputDecoration(
                  hinText: 'Email del proveedor',
                  labelText: 'Email del proveedor',
                ),
              ),
              const SizedBox(height: 20),
              // Otros campos de formulario
            ],
          ),
        ),
      ),
    );
  }

  BoxDecoration _createDecoration() => const BoxDecoration(
        color: Colors.white, // Color de fondo de la pantalla
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(25),
          bottomRight: Radius.circular(25),
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black,
            offset: Offset(0, 5),
            blurRadius: 10,
          ),
        ],
      );
}
