import 'package:flutter/material.dart';

import '../widgets.dart';

class LoginContainer2 extends StatelessWidget {
  const LoginContainer2({super.key});

  @override
  Widget build(BuildContext context) {
    final sizeScreen = MediaQuery.of(context).size;
    return Container(
      width: double.infinity,
      height: sizeScreen.height * 0.4,
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          colors: [
            /* Color.fromRGBO(107, 133, 220, 1), */
            /* Color.fromRGBO(17, 31, 113, 1), */
            Color.fromARGB(225, 255, 159, 25),
            Color.fromARGB(162, 255, 87, 3),
          ],
        ),
      ),
      child: const Stack(
        children: [
          // ignore: sort_child_properties_last
          Positioned(top: 90, left: 30, child: Buble()),
          Positioned(top: -40, left: -30, child: Buble()),
          Positioned(top: -50, left: -20, child: Buble()),
          Positioned(top: 120, right: 20, child: Buble()),
          Positioned(top: 20, right: 80, child: Buble()),
          Positioned(top: -50, right: -20, child: Buble()),
        ],
      ),
    );
  }
}
