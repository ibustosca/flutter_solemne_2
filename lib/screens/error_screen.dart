import 'package:flutter/material.dart';

class ErrorScreen extends StatelessWidget {
  const ErrorScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Error'),
        titleTextStyle: const TextStyle(
          fontSize: 23,
          fontWeight: FontWeight.bold,
          color: Colors.white,
        ),
      ),
      body: const Center(
        child: Text(
          'Lo sentimos. Hemos encontrado un error!',
          style: TextStyle(fontSize: 18),
        ),
      ),
    );
  }
}
