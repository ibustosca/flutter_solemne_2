import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../providers/providers.dart';
import '../../ui/input_decorations.dart';

class FormSupplier extends StatelessWidget {
  const FormSupplier({super.key});

  @override
  Widget build(BuildContext context) {
    final supplierForm = Provider.of<SupplierFormProvider>(context);
    final supplier = supplierForm.supplier;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        width: double.infinity,
        decoration: _createDecoration(),
        child: Form(
          key: supplierForm.formKey,
          autovalidateMode: AutovalidateMode.onUserInteraction,
          child: Column(
            children: [
              TextFormField(
                initialValue: supplier.supplierName,
                onChanged: (value) => supplier.supplierName = value,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'El nombre es obligatorio';
                  }
                  return null;
                },
                decoration: InputDecorations.authInputDecoration(
                  hinText: 'Nombre del proveedor',
                  labelText: 'Nombre',
                ),
              ),
              TextFormField(
                initialValue: supplier.supplierLastName,
                onChanged: (value) => supplier.supplierLastName = value,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'El segundo nombre es obligatorio';
                  }
                  return null;
                },
                decoration: InputDecorations.authInputDecoration(
                  hinText: 'Segundo nombre del proveedor',
                  labelText: 'Segundo Nombre',
                ),
              ),
              TextFormField(
                initialValue: supplier.supplierMail,
                onChanged: (value) => supplier.supplierMail = value,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'El mail es obligatorio';
                  }
                  return null;
                },
                decoration: InputDecorations.authInputDecoration(
                  hinText: 'Mail del proveedor',
                  labelText: 'Mail',
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
  borderRadius: BorderRadius.only(
    bottomLeft: Radius.circular(25),
    bottomRight: Radius.circular(25),
  ),
  boxShadow: [
    BoxShadow(color: Colors.black, offset: Offset(0, 5), blurRadius: 10),
  ],
);
