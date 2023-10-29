import 'package:flutter/material.dart';
import 'package:examen_final/models/proveedores.dart';

class ProveedorFormProvider extends ChangeNotifier {
  GlobalKey<FormState> formKey = new GlobalKey<FormState>();
  Listado proveedor;
  ProveedorFormProvider(this.proveedor);

  bool isValidForm() {
    return formKey.currentState?.validate() ?? false;
  }
}
