import 'package:flutter/material.dart';
import '../../models/proveedores.dart';
import '../widgets.dart';

class CardSupplier extends StatelessWidget {
  final ListadoProveedores supplier;
  const CardSupplier({super.key, required this.supplier});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Container(
        margin: const EdgeInsets.only(top: 30, bottom: 10),
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
              top: 0,
              right: 0,
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
  borderRadius: BorderRadius.circular(25),
  boxShadow: const [
    BoxShadow(color: Colors.black, offset: Offset(0, 5), blurRadius: 10),
  ],
);
