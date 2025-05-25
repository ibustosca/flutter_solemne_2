import 'package:flutter/material.dart';
import 'package:flutter_solemne_2/providers/providers.dart';
import 'package:flutter_solemne_2/services/services.dart';
import 'package:flutter_solemne_2/ui/input_decorations.dart';
import 'package:provider/provider.dart';

class LoginForm extends StatelessWidget {
  final String pathButton;
  final String textButton;
  final int loginRegister;

  const LoginForm({
    super.key,
    required this.pathButton,
    required this.textButton,
    required this.loginRegister,
  });

  @override
  Widget build(BuildContext context) {
    final LoginForm = Provider.of<LoginFormProvider>(context);
    return Form(
      key: LoginForm.formKey,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      child: Column(
        children: [
          TextFormField(
            autocorrect: false,
            keyboardType: TextInputType.text,
            decoration: InputDecorations.authInputDecoration(
              hinText: 'Ingrese su correo',
              labelText: 'Email',
              prefixIcon: Icons.people,
            ),
            onChanged: (value) => LoginForm.email = value,
            validator: (value) {
              return (value != null && value.length > 5)
                  ? null
                  : "Usuario no puede ser vacío y menos de 6 caracteres";
            },
          ),
          SizedBox(height: 30),
          TextFormField(
            autocorrect: false,
            obscureText: true,
            keyboardType: TextInputType.text,
            decoration: InputDecorations.authInputDecoration(
              hinText: '******',
              labelText: 'Password',
              prefixIcon: Icons.lock_outline,
            ),
            onChanged: (value) => LoginForm.password = value,
            validator: (value) {
              return (value != null && value.length > 5)
                  ? null
                  : "Usuario no puede ser vacío y menos de 6 caracteres";
            },
          ),
          SizedBox(height: 30),
          MaterialButton(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            disabledColor: Colors.grey,
            color: Color.fromARGB(162, 255, 87, 3),
            elevation: 10,
            onPressed:
                LoginForm.isLoading
                    ? null
                    : () async {
                      FocusScope.of(context).unfocus();
                      final authService = Provider.of<AuthServices>(
                        context,
                        listen: false,
                      );
                      if (!LoginForm.isValidForm()) return;
                      if (loginRegister == 1) {
                        final String? errorMessage = await authService.login(
                          LoginForm.email,
                          LoginForm.password,
                        );
                        if (errorMessage == null) {
                          Navigator.pushNamed(context, pathButton);
                        } else {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text(errorMessage),
                              duration: Duration(seconds: 3),
                            ),
                          );
                        }
                      } else {
                        final String? errorMessage = await authService
                            .createUser(LoginForm.email, LoginForm.password);
                        if (errorMessage == null) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text("Usuario creado con éxito!"),
                              duration: Duration(seconds: 3),
                            ),
                          );
                          Navigator.pushNamed(context, pathButton);
                        } else {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text(errorMessage),
                              duration: Duration(seconds: 3),
                            ),
                          );
                        }
                      }
                      LoginForm.isLoading = false;
                    },
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 80, vertical: 10),
              child: Text(
                textButton,
                style: const TextStyle(color: Colors.white, fontSize: 17),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
