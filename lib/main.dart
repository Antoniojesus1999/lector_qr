import 'package:flutter/material.dart';
import 'package:lector_qr/pages/home_page.dart';
import 'package:lector_qr/pages/mapa_page.dart';
import 'package:lector_qr/pages/theme_page.dart';
import 'package:lector_qr/providers/scan_list_provider.dart';
import 'package:lector_qr/providers/theme_provider.dart';
import 'package:lector_qr/providers/ui_provider.dart';
import 'package:lector_qr/screens/login_screen.dart';
import 'package:lector_qr/screens/settingsScreens.dart';
import 'package:lector_qr/share_preferences/preferences.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  //Sirve para cargar la clase Preferencia para guardar datos siempre y la linea de arriba es para que no pete
  await Preferences.init();
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(
          create: (_) => ThemeProvider(isDarkmode: Preferences.isDarkmode))
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
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'QA Reader',
        initialRoute: 'login',
        routes: {
          'home': (_) => const HomePage(),
          'mapa': (_) => MapaPage(),
          'theme': (_) => const ThemePage(),
          SettingsScreen.routerName: (_) => SettingsScreen(),
          'login': (_) => LoginScreen()
        },
        //primarySwatch para cambiar el color de todo el tema
        theme: Provider.of<ThemeProvider>(context).currentTheme,
      ),
    );
  }
}
