
import 'package:flutter/material.dart';

import 'home_screen.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          // ====================================
          // IMAGEN DE FONDO DEL CURSO
          // ====================================
          Image.asset(
            'images/back.jpg',
            fit: BoxFit.cover,
          ),

          // ====================================
          // CAPA BLANCA SEMITRANSPARENTE
          // ====================================
          const ColoredBox(
            color: Colors.white38,
          ),

          // ====================================
          // CONTENIDO DE BIENVENIDA
          // ====================================
          SafeArea(
            child: LayoutBuilder(
              builder: (context, constraints) {
                return SingleChildScrollView(
                  child: ConstrainedBox(
                    constraints: BoxConstraints(
                      minHeight: constraints.maxHeight,
                    ),
                    child: Center(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 24,
                          vertical: 32,
                        ),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            // LOGO DEL CURSO
                            Image.asset(
                              'images/logo.png',
                              width: 300,
                              height: 220,
                              fit: BoxFit.contain,
                            ),

                            const SizedBox(height: 40),

                            // BOTÓN PARA CONTINUAR
                            ElevatedButton(
                              onPressed: () {
                                Navigator.of(context)
                                    .pushNamed(
                                  HomeScreen.routeName,
                                );
                              },
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.red,
                                foregroundColor: Colors.white,
                                padding:
                                    const EdgeInsets.symmetric(
                                  horizontal: 30,
                                  vertical: 14,
                                ),
                                shape: RoundedRectangleBorder(
                                  borderRadius:
                                      BorderRadius.circular(6),
                                ),
                              ),
                              child: const Text(
                                'Press me',
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
