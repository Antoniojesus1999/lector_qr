import 'package:flutter/material.dart';
import 'package:lector_qr/pages/product_page.dart';
import 'package:lector_qr/screens/login_screen.dart';
import 'package:lector_qr/services/auth_service.dart';
import 'package:provider/provider.dart';

class CheckScreen extends StatelessWidget {
  const CheckScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final authService = Provider.of<AuthService>(context, listen: false);

    return Scaffold(
      body: Center(
        child: FutureBuilder(
          future: authService.readToken(),
          builder: (context, snapshot) {
            if (!snapshot.hasData) {
              return const Text('');
            }

            if (snapshot.data == '') {
              //El futureBuilder requiere que se devuelva un widget el microtask sirve para que no
              //ejecute la redirección hasta que no termine de formar el widget
              Future.microtask(() => {
                    Navigator.pushReplacement(
                        context,
                        PageRouteBuilder(
                            pageBuilder: (_, __, ___) => const LoginScreen(),
                            transitionDuration: const Duration(seconds: 0)))
                  });
            } else {
              Future.microtask(() => {
                    Navigator.pushReplacement(
                        context,
                        PageRouteBuilder(
                            pageBuilder: (_, __, ___) => const ProductPage(),
                            transitionDuration: const Duration(seconds: 0)))
                  });
            }

            return Container();
          },
        ),
      ),
    );
  }
}
