import 'package:flutter/material.dart';

class MailSupplier extends StatelessWidget {
  final String supplierMail;
  const MailSupplier({super.key, required this.supplierMail});
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 300,
      height: 70,
      alignment: Alignment.centerLeft,
      child: FittedBox(
        fit: BoxFit.contain,
        child: Text(
          supplierMail,
          style: const TextStyle(
            fontSize: 20,
            color: Color.fromARGB(255, 116, 116, 116),
          ),
        ),
      ),
    );
  }
}
