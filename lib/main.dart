
import 'package:flutter/material.dart';

import 'screens/home_screen.dart';
import 'screens/welcome_screen.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const VentaAutosApp());
}

class VentaAutosApp extends StatelessWidget {
  const VentaAutosApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'CarsLot - Venta de Autos',
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.red,
        ),
      ),
      home: const WelcomeScreen(),
      routes: {
        HomeScreen.routeName: (context) =>
            const HomeScreen(),
      },
    );
  }
}
