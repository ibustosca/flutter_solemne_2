import 'package:flutter/material.dart';
import 'package:flutter_solemne_2/models/models.dart';
import 'package:flutter_solemne_2/services/services.dart';
import 'package:flutter_solemne_2/widgets/widgets.dart';
import 'package:provider/provider.dart';
import '../screens.dart';

class ListProductScreen extends StatelessWidget {
  const ListProductScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final productService = Provider.of<ProductService>(context);
    if (productService.isLoading) return LoadingScreen();
    return Scaffold(
      appBar: AppBar(
        title: const Text('Listado de productos'),
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
        itemCount: productService.products.length,
        itemBuilder:
            (BuildContext context, index) => GestureDetector(
              onTap: () {
                productService.SelectProduct =
                    productService.products[index].copy();
                Navigator.pushNamed(context, 'edit_product', arguments: 1);
              },
              child: CardProduct(product: productService.products[index]),
            ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Color.fromARGB(255, 215, 118, 69),
        foregroundColor: Colors.white,
        child: const Icon(Icons.add),
        onPressed: () {
          productService.SelectProduct = Listado(
            productName: '',
            productPrice: 0,
            productImage:
                'https://abravidro.org.br/wp-content/uploads/2015/04/sem-imagem4.jpg',
            productState: '',
          );
          Navigator.pushNamed(context, 'edit_product', arguments: 0);
        },
      ),
    );
  }
}
