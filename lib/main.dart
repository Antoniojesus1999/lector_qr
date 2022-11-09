import 'package:flutter/material.dart';
import 'package:lector_qr/pages/home_page.dart';
import 'package:lector_qr/pages/mapa_page.dart';
import 'package:lector_qr/pages/product_page.dart';
import 'package:lector_qr/pages/theme_page.dart';
import 'package:lector_qr/providers/scan_list_provider.dart';
import 'package:lector_qr/providers/theme_provider.dart';
import 'package:lector_qr/providers/ui_provider.dart';
import 'package:lector_qr/screens/check_auth_screen.dart';
import 'package:lector_qr/screens/login_screen.dart';
import 'package:lector_qr/screens/product_screen.dart';
import 'package:lector_qr/screens/register_screen.dart';
import 'package:lector_qr/screens/settingsScreens.dart';
import 'package:lector_qr/services/auth_service.dart';
import 'package:lector_qr/services/notification_service.dart';
import 'package:lector_qr/services/products_service.dart';
import 'package:lector_qr/share_preferences/preferences.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  //Sirve para cargar la clase Preferencia para guardar datos siempre y la linea de arriba es para que no pete
  await Preferences.init();
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(
          create: (_) => ThemeProvider(isDarkmode: Preferences.isDarkmode)),
      ChangeNotifierProvider(create: (_) => ProductsService())
    ],
    child: const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    //Gestor de estado
    return MultiProvider(
      providers: [
        //Indicamos que clase extiende de ChangeNotifier y lo inicializamos
        ChangeNotifierProvider(create: (_) => UiProvider()),
        ChangeNotifierProvider(create: (_) => ScanListProvider()),
        ChangeNotifierProvider(create: (_) => AuthService())
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'QA Reader',
        initialRoute: 'login',
        //Sirve para anclar el mensaje de error al hacer login
        scaffoldMessengerKey: NotificationService.messengerKey,
        routes: {
          'home': (_) => const HomePage(),
          'register': (_) => const RegisterScreen(),
          'mapa': (_) => MapaPage(),
          'theme': (_) => const ThemePage(),
          SettingsScreen.routerName: (_) => SettingsScreen(),
          'login': (_) => const LoginScreen(),
          'productos': (_) => const ProductPage(),
          'product': (_) => const ProductScreen(),
          'checking': (_) => const CheckScreen(),
        },
        //primarySwatch para cambiar el color de todo el tema
        theme: Provider.of<ThemeProvider>(context).currentTheme.copyWith(
            scaffoldBackgroundColor: const Color.fromARGB(255, 247, 255, 254),
            appBarTheme: const AppBarTheme(
                elevation: 0, color: Color.fromARGB(255, 31, 255, 195)),
            floatingActionButtonTheme: const FloatingActionButtonThemeData(
                backgroundColor: Color.fromARGB(255, 0, 254, 216),
                elevation: 0)),
      ),
    );
  }
}
