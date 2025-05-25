import 'package:flutter/material.dart';

class DetailSupplier extends StatelessWidget {
  final String supplierName;
  const DetailSupplier({super.key, required this.supplierName});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 0),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        width: double.infinity,
        height: 80,
        decoration: _boxDecorations(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              supplierName,
              style: const TextStyle(
                fontSize: 23,
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
          ],
        ),
      ),
    );
  }
}

BoxDecoration _boxDecorations() =>
    const BoxDecoration(color: Color.fromRGBO(255, 174, 106, 0.9));
