import 'package:flutter/material.dart';

import '../widgets/widgets.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
        titleTextStyle: const TextStyle(
          fontSize: 23,
          fontWeight: FontWeight.bold,
          color: Colors.white,
        ),
        automaticallyImplyLeading: false,
        actions: [
          IconButton(
            icon: const Icon(Icons.logout),
            color: Colors.white,
            onPressed: () {
              Navigator.pop(context); // DEBE LLAMAR PARA CERRAR LA SESION
            },
          ),
        ],
      ),
      body: Container(
        color: Colors.white,
        width: double.infinity,
        height: double.infinity,
        child: const Column(
          children: [
            SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Menú',
                  style: TextStyle(
                    color: Color.fromARGB(224, 78, 78, 78),
                    fontSize: 23,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            SizedBox(height: 16),
            Button(
              textButton: 'Categorías',
              pathButton: 'list_category',
              buttonColor: Color.fromARGB(225, 255, 159, 25),
            ),
            Button(
              textButton: 'Proveedores',
              pathButton: 'list_supplier',
              buttonColor: Color.fromARGB(222, 100, 41, 148),
            ),
            Button(
              textButton: 'Productos',
              pathButton: 'list_product',
              buttonColor: Color.fromARGB(242, 41, 112, 148),
            ),
          ],
        ),
      ),
    );
  }
}
