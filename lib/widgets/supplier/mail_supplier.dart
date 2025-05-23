import 'package:flutter/material.dart';

class MailSupplier extends StatelessWidget {
  final String supplierMail;
  const MailSupplier({super.key, required this.supplierMail});
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100,
      height: 70,
      alignment: Alignment.center,
      decoration: _boxDecorations(),
      child: FittedBox(
        fit: BoxFit.contain,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Text(
            '\$$supplierMail',
            style: const TextStyle(fontSize: 20, color: Colors.white),
          ),
        ),
      ),
    );
  }

  BoxDecoration _boxDecorations() {
    return const BoxDecoration(
      color: Color.fromARGB(242, 41, 112, 148),
      borderRadius: BorderRadius.only(
        topRight: Radius.circular(25),
        bottomLeft: Radius.circular(25),
      ),
    );
  }
}
