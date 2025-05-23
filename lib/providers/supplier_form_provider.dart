import 'package:flutter/material.dart';
import 'package:flutter_solemne_2/models/models.dart';
import '../models/proveedores.dart';

class SupplierFormProvider extends ChangeNotifier {
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  ListadoProveedores supplier;
  SupplierFormProvider(this.supplier);

  bool isValidForm() {
    return formKey.currentState?.validate() ?? false;
  }
}
