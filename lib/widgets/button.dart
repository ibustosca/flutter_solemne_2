import 'package:flutter/material.dart';

class Button extends StatelessWidget {
  final String textButton;
  final String pathButton;
  final Color buttonColor;

  const Button({
    super.key,
    required this.textButton,
    required this.pathButton,
    required this.buttonColor,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: SizedBox(
        width: double.infinity,
        child: MaterialButton(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          disabledColor: Colors.blueGrey,
          color: buttonColor,
          elevation: 10,
          onPressed: () => Navigator.pushNamed(context, pathButton),
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 50),
            child: Text(
              textButton,
              style: const TextStyle(color: Colors.white, fontSize: 23),
            ),
          ),
        ),
      ),
    );
  }
}
