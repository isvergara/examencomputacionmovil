//ISMAEL VERGARA VIDELA
//16.936.330-7
//SEM 2 2023 | COMPUTACIÓN MÓVIL | eICFE1119-07

import 'package:flutter/material.dart';
import 'package:examen_final/providers/category_form_provider.dart';
import 'package:examen_final/services/category_service.dart';
import 'package:provider/provider.dart';
import '../ui/input_decorations.dart';

class EditCategoryScreen extends StatelessWidget {
  const EditCategoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final categoryService = Provider.of<CategoryService>(context);
    return ChangeNotifierProvider(
      create: (_) => CategoryFormProvider(categoryService.SelectCategory!),
      child: _CategoryScreenBody(categoryService: categoryService),
    );
  }
}

class _CategoryScreenBody extends StatelessWidget {
  const _CategoryScreenBody({
    Key? key,
    required this.categoryService,
  }) : super(key: key);

  final CategoryService categoryService;

  @override
  Widget build(BuildContext context) {
    final categoryForm = Provider.of<CategoryFormProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Editar Categoría'),
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
            _CategoryForm(),
          ],
        ),
      ),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
            backgroundColor: Colors.red,
            onPressed: () async {
              if (!categoryForm.isValidForm()) return;
              await categoryService.deleteCategory(
                  categoryForm.category, context);
            },
            heroTag: null,
            child: const Icon(Icons.delete_forever),
          ),
          const SizedBox(width: 20),
          FloatingActionButton(
            backgroundColor: Colors.green,
            onPressed: () async {
              if (!categoryForm.isValidForm()) return;
              await categoryService.editOrCreateCategory(categoryForm.category);
            },
            heroTag: null,
            child: const Icon(Icons.save_alt_outlined),
          ),
        ],
      ),
    );
  }
}

class _CategoryForm extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final categoryForm = Provider.of<CategoryFormProvider>(context);
    final category = categoryForm.category;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        width: double.infinity,
        decoration: _createDecoration(),
        child: Form(
          key: categoryForm.formKey,
          autovalidateMode: AutovalidateMode.onUserInteraction,
          child: Column(
            children: [
              TextFormField(
                initialValue: category.categoryName,
                onChanged: (value) => category.categoryName = value,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'El nombre de la categoria es un campo obligatorio';
                  }
                  return null;
                },
                decoration: InputDecortions.authInputDecoration(
                  hinText: 'Nombre de la categoria',
                  labelText: 'Nombre de la categoria',
                ),
              ),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }

  BoxDecoration _createDecoration() => const BoxDecoration(
        color: Colors.white,
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
