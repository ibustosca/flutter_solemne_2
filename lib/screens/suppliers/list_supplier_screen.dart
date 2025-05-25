import 'package:flutter/material.dart';
import 'package:flutter_solemne_2/models/models.dart';
import 'package:flutter_solemne_2/services/services.dart';
import 'package:flutter_solemne_2/widgets/widgets.dart';
import 'package:provider/provider.dart';
import '../screens.dart';

class ListSupplierScreen extends StatelessWidget {
  const ListSupplierScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final supplierService = Provider.of<SupplierService>(context);
    if (supplierService.isLoading) return LoadingScreen();
    return Scaffold(
      appBar: AppBar(
        title: const Text('Listado de proveedores'),
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
        itemCount: supplierService.suppliers.length,
        itemBuilder:
            (BuildContext context, index) => GestureDetector(
              onTap: () {
                supplierService.SelectSupplier =
                    supplierService.suppliers[index].copy();
                Navigator.pushNamed(context, 'edit_supplier', arguments: 1);
              },
              child: CardSupplier(supplier: supplierService.suppliers[index]),
            ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Color.fromARGB(255, 215, 118, 69),
        foregroundColor: Colors.white,
        child: const Icon(Icons.add),
        onPressed: () {
          supplierService.SelectSupplier = ListadoProveedores(
            supplierName: '',
            supplierLastName: '',
            supplierMail: '',
            supplierState: '',
          );
          Navigator.pushNamed(context, 'edit_supplier', arguments: 0);
        },
      ),
    );
  }
}
