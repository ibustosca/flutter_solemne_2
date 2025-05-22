import 'package:flutter/material.dart';

class PriceProduct extends StatelessWidget {
  final int productPrice;
  const PriceProduct({super.key, required this.productPrice});
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
            '\$$productPrice',
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
