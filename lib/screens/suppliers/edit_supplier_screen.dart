import 'package:flutter/material.dart';
import 'package:flutter_solemne_2/services/supplier_service.dart';
import 'package:provider/provider.dart';
import '../../providers/providers.dart';
import '../../widgets/widgets.dart';

class EditSupplierScreen extends StatelessWidget {
  const EditSupplierScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)?.settings.arguments;
    final deleteButton = (args is int) ? args : 0;
    final supplierService = Provider.of<SupplierService>(context);
    return ChangeNotifierProvider(
      create: (_) => SupplierFormProvider(supplierService.SelectSupplier!),
      child: _SupplierScreenBody(
        supplierService: supplierService,
        deleteButton: deleteButton,
      ),
    );
  }
}

class _SupplierScreenBody extends StatelessWidget {
  final int deleteButton;
  final SupplierService supplierService;

  const _SupplierScreenBody({
    super.key,
    required this.supplierService,
    required this.deleteButton,
  });

  @override
  Widget build(BuildContext context) {
    final supplierForm = Provider.of<SupplierFormProvider>(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Proveedor'),
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
          children: [const SizedBox(height: 10), const FormSupplier()],
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
                if (!supplierForm.isValidForm()) return;
                bool success = await supplierService.deleteSupplier(
                  supplierForm.supplier,
                  context,
                );
                if (success) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text('Proveedor eliminado con éxito'),
                      duration: Duration(seconds: 2),
                    ),
                  );
                  Navigator.of(context).pushNamed('list_supplier');
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text('Error al eliminar el proveedor'),
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
              if (!supplierForm.isValidForm()) return;
              String result = await supplierService.editOrCreateSuppliers(
                supplierForm.supplier,
              );
              if (!context.mounted) return;
              if (result == 'Proveedor creado' ||
                  result == 'Proveedor editado') {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text('Proveedor guardado con éxito'),
                    duration: Duration(seconds: 3),
                  ),
                );
              } else {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text('Error al guardar el proveedor'),
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
