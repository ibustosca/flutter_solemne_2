import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../providers/providers.dart';
import '../../ui/input_decorations.dart';

class FormCategory extends StatelessWidget {
  const FormCategory({super.key});

  @override
  Widget build(BuildContext context) {
    final categoryForm = Provider.of<CategoryFormProvider>(context);
    final category = categoryForm.category;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Container(
        padding: const EdgeInsets.only(bottom: 12, left: 10, right: 10),
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
                    return 'El nombre es obligatorio';
                  }
                  return null;
                },
                decoration: InputDecorations.authInputDecoration(
                  hinText: 'Nombre de la categoría',
                  labelText: 'Nombre',
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
