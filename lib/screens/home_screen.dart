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
              Navigator.pop(context);
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
            SizedBox(height: 20),
            Button(
              textButton: 'Categorías',
              pathButton: 'list_category',
              buttonColor: Color.fromRGBO(255, 130, 67, 0.8),
            ),
            SizedBox(height: 20),
            Button(
              textButton: 'Proveedores',
              pathButton: 'list_supplier',
              buttonColor: Color.fromRGBO(255, 174, 106, 0.9),
            ),
            SizedBox(height: 20),
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
