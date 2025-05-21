import 'package:flutter/material.dart';
import 'package:flutter_solemne_2/providers/login_form_provider.dart';
import 'package:provider/provider.dart';
import '../widgets.dart';

class LoginAreaForm extends StatelessWidget {
  final String textFinalButton;
  final String textTitle;
  final String path;
  final String pathButton;
  final String textButton;
  final int loginRegister;

  const LoginAreaForm({
    super.key,
    required this.textFinalButton,
    required this.textTitle,
    required this.path,
    required this.pathButton,
    required this.textButton,
    required this.loginRegister,
  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          const SizedBox(height: 200),
          CardContainer(
            child: Column(
              children: [
                const SizedBox(height: 10),
                Text(
                  textTitle,
                  style: Theme.of(context).textTheme.headlineLarge,
                ), // Lo recibimos como parámetro
                const SizedBox(height: 10),
                ChangeNotifierProvider(
                  create: (_) => LoginFormProvider(),
                  child: LoginForm(
                    pathButton: pathButton,
                    textButton: textButton,
                    loginRegister: loginRegister,
                  ),
                ),
                TextButton(
                  onPressed: () => Navigator.pushNamed(context, path),
                  child: Text(textFinalButton),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
