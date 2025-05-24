import 'package:flutter/material.dart';
import 'package:flutter_solemne_2/services/category_service.dart';
import 'package:provider/provider.dart';
import '../../providers/providers.dart';
import '../../widgets/widgets.dart';

class EditCategoryScreen extends StatelessWidget {
  const EditCategoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)?.settings.arguments;
    final deleteButton = (args is int) ? args : 0;
    final categoryService = Provider.of<CategoryService>(context);
    return ChangeNotifierProvider(
      create: (_) => CategoryFormProvider(categoryService.SelectCategory!),
      child: _CategoryScreenBody(
        categoryService: categoryService,
        deleteButton: deleteButton,
      ),
    );
  }
}

class _CategoryScreenBody extends StatelessWidget {
  final int deleteButton;
  final CategoryService categoryService;

  const _CategoryScreenBody({
    super.key,
    required this.categoryService,
    required this.deleteButton,
  });

  @override
  Widget build(BuildContext context) {
    final categoryForm = Provider.of<CategoryFormProvider>(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Categoría'),
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
      body: SingleChildScrollView(
        child: Column(
          children: [const SizedBox(height: 10), const FormCategory()],
        ),
      ),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          if (deleteButton == 1)
            FloatingActionButton(
              backgroundColor: Color.fromARGB(226, 221, 71, 71),
              foregroundColor: Colors.white,
              onPressed: () async {
                if (!categoryForm.isValidForm()) return;
                bool success = await categoryService.deleteCategory(
                  categoryForm.category,
                  context,
                );
                if (success) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text('Categoría eliminada con éxito'),
                      duration: Duration(seconds: 2),
                    ),
                  );
                  await categoryService.loadCategories();
                  Navigator.of(context).pushNamed('list_category');
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text('Error al eliminar la categoría'),
                      duration: Duration(seconds: 2),
                    ),
                  );
                }
              },
              heroTag: null,
              child: const Icon(Icons.delete_forever),
            ),
          const SizedBox(width: 20),
          FloatingActionButton(
            backgroundColor: Color.fromARGB(226, 54, 164, 59),
            foregroundColor: Colors.white,
            onPressed: () async {
              if (!categoryForm.isValidForm()) return;
              String result = await categoryService.editOrCreateCategories(
                categoryForm.category,
              );
              if (!context.mounted) return;
              if (result == 'Categoria creada' ||
                  result == 'Categoria editada') {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text('Categoría guardada con éxito'),
                    duration: Duration(seconds: 3),
                  ),
                );
                await categoryService.loadCategories();
                Navigator.of(context).pushNamed('list_category');
              } else {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text('Error al guardar la categoría'),
                    duration: Duration(seconds: 3),
                  ),
                );
              }
            },
            heroTag: null,
            child: const Icon(Icons.save),
          ),
        ],
      ),
    );
  }
}
