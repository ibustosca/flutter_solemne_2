import 'package:flutter/material.dart';
import '../../models/categorias.dart';
import '../widgets.dart';

class CardCategory extends StatelessWidget {
  final ListadoCategorias category;
  const CardCategory({super.key, required this.category});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Container(
        margin: const EdgeInsets.only(top: 20, bottom: 5),
        width: double.infinity,
        decoration: _cardDecorations(),
        child: Stack(
          alignment: Alignment.bottomLeft,
          children: [DetailCategory(categoryName: category.categoryName)],
        ),
      ),
    );
  }
}

BoxDecoration _cardDecorations() => BoxDecoration(
  color: Colors.white,
  borderRadius: BorderRadius.only(
    bottomLeft: Radius.circular(25),
    topRight: Radius.circular(25),
  ),
  boxShadow: const [
    BoxShadow(
      color: Color.fromARGB(255, 104, 104, 104),
      offset: Offset(0, 4),
      blurRadius: 10,
    ),
  ],
);
