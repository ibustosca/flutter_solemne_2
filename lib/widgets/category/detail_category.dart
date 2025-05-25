import 'package:flutter/material.dart';

class DetailCategory extends StatelessWidget {
  final String categoryName;
  const DetailCategory({super.key, required this.categoryName});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 0),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 18),
        width: double.infinity,
        height: 70,
        decoration: _boxDecorations(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              categoryName,
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
  color: Color.fromRGBO(255, 130, 67, 0.8),
  borderRadius: BorderRadius.only(
    bottomLeft: Radius.circular(25),
    topRight: Radius.circular(25),
  ),
);
