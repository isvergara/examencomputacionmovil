import 'package:flutter/material.dart';
import 'package:examen_final/models/categorias.dart';
import 'package:examen_final/services/services.dart';
import 'package:provider/provider.dart';
import 'package:examen_final/screen/screen.dart';

class ListCategoryScreen extends StatelessWidget {
  const ListCategoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final categoryService = Provider.of<CategoryService>(context);
    if (categoryService.isLoading) return LoadingScreen();
    return Scaffold(
      appBar: AppBar(
        title: const Text('Listado de categorias'),
      ),
      body: ListView.builder(
        itemCount: categoryService.categories.length,
        itemBuilder: (BuildContext context, index) {
          final category = categoryService.categories[index];
          return ElevatedButton(
            onPressed: () {
              categoryService.SelectCategory = category.copy();
              Navigator.pushNamed(context, 'editcategory');
            },
            style: ElevatedButton.styleFrom(
              primary: Color.fromRGBO(46, 151, 51, 1),
              alignment: Alignment.centerLeft,
            ),
            child: Text(
              "Nombre: " + category.categoryName,
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () {
          categoryService.SelectCategory =
              Listado(categoryId: 0, categoryName: '', categoryState: 'Activa');
          Navigator.pushNamed(context, 'editcategory');
        },
      ),
    );
  }
}
