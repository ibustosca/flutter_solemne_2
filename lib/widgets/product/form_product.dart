import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../providers/providers.dart';
import '../../ui/input_decorations.dart';

class FormProduct extends StatelessWidget {
  const FormProduct({super.key});

  @override
  Widget build(BuildContext context) {
    final productForm = Provider.of<ProductFormProvider>(context);
    final product = productForm.product;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Container(
        padding: const EdgeInsets.only(bottom: 12, left: 10, right: 10),
        width: double.infinity,
        decoration: _createDecoration(),
        child: Form(
          key: productForm.formKey,
          autovalidateMode: AutovalidateMode.onUserInteraction,
          child: Column(
            children: [
              TextFormField(
                initialValue: product.productName,
                onChanged: (value) => product.productName = value,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'El nombre es obligatorio';
                  }
                  return null;
                },
                decoration: InputDecorations.authInputDecoration(
                  hinText: 'Nombre del producto',
                  labelText: 'Nombre',
                ),
              ),
              TextFormField(
                initialValue: product.productPrice.toString(),
                onChanged: (value) {
                  if (int.tryParse(value) == null) {
                    product.productPrice = 0;
                  } else {
                    product.productPrice = int.parse(value);
                  }
                },
                decoration: InputDecorations.authInputDecoration(
                  hinText: '------',
                  labelText: 'Precio',
                ),
              ),
              TextFormField(
                initialValue: product.productImage,
                onChanged: (value) => product.productImage = value,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'La url es obligatoria';
                  }
                  return null;
                },
                decoration: InputDecorations.authInputDecoration(
                  hinText: 'Agregue una url',
                  labelText: 'URL',
                ).copyWith(
                  isDense: true,
                  contentPadding: const EdgeInsets.only(top: 12, bottom: 10),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

BoxDecoration _createDecoration() => const BoxDecoration(
  color: Colors.white,
  boxShadow: [
    BoxShadow(color: Colors.black, offset: Offset(0, 1), blurRadius: 3),
  ],
);
