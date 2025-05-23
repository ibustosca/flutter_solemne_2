import 'package:flutter/material.dart';

class DetailSupplier extends StatelessWidget {
  final String supplierName;
  const DetailSupplier({super.key, required this.supplierName});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 50),
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
              style: const TextStyle(fontSize: 23, color: Colors.white),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
          ],
        ),
      ),
    );
  }
}

BoxDecoration _boxDecorations() => const BoxDecoration(
  color: Color.fromARGB(242, 41, 112, 148),
  borderRadius: BorderRadius.only(
    bottomLeft: Radius.circular(25),
    topRight: Radius.circular(25),
  ),
);
