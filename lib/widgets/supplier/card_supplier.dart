import 'package:flutter/material.dart';
import '../../models/proveedores.dart';
import '../widgets.dart';

class CardSupplier extends StatelessWidget {
  final ListadoProveedores supplier;
  const CardSupplier({super.key, required this.supplier});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 21),
      child: Container(
        margin: const EdgeInsets.only(top: 20, bottom: 5),
        width: double.infinity,
        decoration: _cardDecorations(),
        child: Stack(
          alignment: Alignment.bottomLeft,
          children: [
            DetailSupplier(
              supplierName:
                  '${supplier.supplierName} ${supplier.supplierLastName}',
            ),
            Positioned(
              top: 23,
              left: 20,
              child: MailSupplier(supplierMail: supplier.supplierMail),
            ),
          ],
        ),
      ),
    );
  }
}

BoxDecoration _cardDecorations() => BoxDecoration(
  color: Colors.white,
  boxShadow: const [
    BoxShadow(
      color: Color.fromARGB(255, 139, 139, 139),
      offset: Offset(0, 5),
      blurRadius: 10,
    ),
  ],
);
