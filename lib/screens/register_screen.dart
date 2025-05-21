import 'package:flutter/material.dart';

import '../widgets/widgets.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: LoginContainer1(
        child: LoginAreaForm(
          path: 'login',
          textFinalButton: 'Inicia tu sesión',
          textTitle: 'Registro',
          pathButton: 'register',
          textButton: 'Crear cuenta',
          loginRegister: 2,
        ),
      ),
    );
  }
}
