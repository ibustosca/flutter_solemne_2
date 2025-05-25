import 'package:flutter/material.dart';
import 'package:flutter_solemne_2/models/models.dart';
import 'package:flutter_solemne_2/services/services.dart';
import 'package:flutter_solemne_2/widgets/widgets.dart';
import 'package:provider/provider.dart';
import '../screens.dart';

class ListCategoryScreen extends StatelessWidget {
  const ListCategoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final categoryService = Provider.of<CategoryService>(context);
    if (categoryService.isLoading) return LoadingScreen();
    return Scaffold(
      appBar: AppBar(
        title: const Text('Listado de categorías'),
        titleTextStyle: const TextStyle(
          fontSize: 23,
          fontWeight: FontWeight.bold,
          color: Colors.white,
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.logout),
            color: Colors.white,
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ],
      ),
      body: ListView.builder(
        itemCount: categoryService.categories.length,
        itemBuilder:
            (BuildContext context, index) => GestureDetector(
              onTap: () {
                categoryService.SelectCategory =
                    categoryService.categories[index].copy();
                Navigator.pushNamed(context, 'edit_category', arguments: 1);
              },
              child: CardCategory(category: categoryService.categories[index]),
            ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Color.fromARGB(255, 215, 118, 69),
        foregroundColor: Colors.white,
        child: const Icon(Icons.add),
        onPressed: () {
          categoryService.SelectCategory = ListadoCategorias(
            categoryName: '',
            categoryState: '',
          );
          Navigator.pushNamed(context, 'edit_category', arguments: 0);
        },
      ),
    );
  }
}
