import 'package:flutter/material.dart';
import 'package:lector_qr/providers/login_form_provider.dart';
import 'package:lector_qr/services/notification_service.dart';
import 'package:lector_qr/ui/input_decorations.dart';
import 'package:lector_qr/widgets/card_container.dart';
import 'package:lector_qr/widgets/outh_background.dart';
import 'package:provider/provider.dart';

import '../services/auth_service.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //Esta clase tiene un stack y dentro tiene la parte superior y lo que le entra en el child es el form por eso se pone arriba
      body: AuthBackground(
        child: SingleChildScrollView(
            child: Column(
          children: [
            const SizedBox(
              height: 240,
            ),
            CardContainer(
              child: Column(
                children: [
                  const SizedBox(height: 10),
                  Text(
                    'LOGIN',
                    style: Theme.of(context).textTheme.headline4,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  ChangeNotifierProvider(
                    create: (_) => LoginFormProvider(),
                    child: const _LoginForm(),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 50),
            TextButton(
              onPressed: () =>
                  Navigator.pushReplacementNamed(context, 'register'),
              style: ButtonStyle(
                  overlayColor:
                      MaterialStateProperty.all(Colors.indigo.withOpacity(0.1)),
                  shape: MaterialStateProperty.all(const StadiumBorder())),
              child: const Text('Crear una nueva cuenta',
                  style: TextStyle(fontSize: 18, color: Colors.black87)),
            ),
            const SizedBox(height: 50),
          ],
        )),
      ),
    );
  }
}

class _LoginForm extends StatelessWidget {
  const _LoginForm({super.key});

  @override
  Widget build(BuildContext context) {
    final loginForm = Provider.of<LoginFormProvider>(context);
    return Container(
      child: Form(
          key: loginForm.formKey,
          autovalidateMode: AutovalidateMode.onUserInteraction,
          child: Column(
            children: [
              TextFormField(
                  autocorrect: false,
                  keyboardType: TextInputType.emailAddress,
                  decoration: InputDecorations.authInputDecoration(
                      hintText: 'antoniojesus@gmail.com',
                      labelText: 'Correo electrónico',
                      prefixIcon: Icons.alternate_email_rounded),
                  onChanged: ((value) => loginForm.email = value),
                  validator: ((value) {
                    String pattern =
                        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
                    RegExp regExp = RegExp(pattern);
                    return regExp.hasMatch(value ?? '')
                        ? null
                        : 'El valor ingresado no luce como un correo';
                  })),
              const SizedBox(height: 30),
              TextFormField(
                  autocorrect: false,
                  keyboardType: TextInputType.emailAddress,
                  decoration: InputDecorations.authInputDecoration(
                      hintText: '***********',
                      labelText: 'Contraseña',
                      prefixIcon: Icons.lock_outline_rounded),
                  onChanged: ((value) => loginForm.password = value),
                  validator: ((value) {
                    if (value != null && value.length >= 6) return null;
                    return 'La contrseañ debe de ser de 6 caracteres';
                  })),
              const SizedBox(height: 30),
              MaterialButton(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10)),
                  disabledColor: Colors.grey,
                  elevation: 0,
                  color: const Color.fromARGB(255, 11, 183, 160),
                  onPressed: loginForm.isLoading
                      ? null
                      : () async {
                          FocusScope.of(context).unfocus();
                          final authService =
                              Provider.of<AuthService>(context, listen: false);
                          if (!loginForm.isValidForm()) return;
                          loginForm.isLoading = true;
                          final String? errorMessage = await authService.login(
                              loginForm.email, loginForm.password);
                          if (errorMessage == null) {
                            // ignore: use_build_context_synchronously
                            Navigator.pushReplacementNamed(context, 'home');
                          } else {
                            print(errorMessage);
                            if (errorMessage == 'EMAIL_NOT_FOUND') {
                              NotificationService.showSSnackbar(
                                  'El email no esta registrado');
                            } else {
                              NotificationService.showSSnackbar(errorMessage);
                            }
                          }
                          loginForm.isLoading = false;
                        },
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 80, vertical: 15),
                    child: Text(
                      loginForm.isLoading ? 'Espere ...' : 'Ingresar',
                      style: const TextStyle(
                          color: Color.fromARGB(255, 149, 255, 230)),
                    ),
                  ))
            ],
          )),
    );
  }
}
