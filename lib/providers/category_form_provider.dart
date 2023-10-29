//ISMAEL VERGARA VIDELA
//16.936.330-7
//SEM 2 2023 | COMPUTACIÓN MÓVIL | eICFE1119-07

import 'package:flutter/material.dart';
import 'package:examen_final/models/categorias.dart';

class CategoryFormProvider extends ChangeNotifier {
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  Listado category;
  CategoryFormProvider(this.category);

  bool isValidForm() {
    return formKey.currentState?.validate() ?? false;
  }
}
