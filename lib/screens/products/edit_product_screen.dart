import 'package:flutter/material.dart';
import 'package:flutter_solemne_2/services/services.dart';
import 'package:provider/provider.dart';
import '../../providers/providers.dart';
import '../../widgets/widgets.dart';

class EditProductScreen extends StatelessWidget {
  const EditProductScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)?.settings.arguments;
    final deleteButton = (args is int) ? args : 0;
    final productSerrvice = Provider.of<ProductService>(context);
    return ChangeNotifierProvider(
      create: (_) => ProductFormProvider(productSerrvice.SelectProduct!),
      child: _ProductScreenBody(
        productService: productSerrvice,
        deleteButton: deleteButton,
      ),
    );
  }
}

class _ProductScreenBody extends StatelessWidget {
  final int deleteButton;
  final ProductService productService;

  const _ProductScreenBody({
    super.key,
    required this.productService,
    required this.deleteButton,
  });

  @override
  Widget build(BuildContext context) {
    final productForm = Provider.of<ProductFormProvider>(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Producto'),
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
          children: [
            Stack(
              children: [
                ImageProduct(
                  url: productService.SelectProduct!.productImage,
                  borderRadius: BorderRadius.zero,
                ),
                Positioned(
                  top: 40,
                  left: 20,
                  child: IconButton(
                    icon: const Icon(
                      Icons.arrow_back_ios,
                      size: 40,
                      color: Colors.black,
                    ),
                    onPressed: () => Navigator.of(context).pop(),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 10),
            const FormProduct(),
          ],
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
                if (!productForm.isValidForm()) return;
                bool success = await productService.deleteProduct(
                  productForm.product,
                  context,
                );
                if (success) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text('Producto eliminado con éxito'),
                      duration: Duration(seconds: 2),
                    ),
                  );
                  await productService.loadProducts();
                  Navigator.of(context).pushNamed('list_product');
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text('Error al eliminar el producto'),
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
              if (!productForm.isValidForm()) return;
              String result = await productService.editOrCreateProducts(
                productForm.product,
              );
              if (!context.mounted) return;
              if (result == 'creado' || result == 'editado') {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text('Producto guardado con éxito'),
                    duration: Duration(seconds: 3),
                  ),
                );
                await productService.loadProducts();
                Navigator.of(context).pushNamed('list_product');
              } else {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text('Error al guardar el producto'),
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
