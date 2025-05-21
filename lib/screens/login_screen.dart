import 'package:flutter/material.dart';
import '../widgets/widgets.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: LoginContainer1(
        child: LoginAreaForm(
          textFinalButton: 'No tienes cuenta? regístrate',
          textTitle: 'Login',
          path: 'register',
          pathButton: 'home',
          textButton: 'Ingresar',
          loginRegister: 1,
        ),
      ),
    );
  }
}
