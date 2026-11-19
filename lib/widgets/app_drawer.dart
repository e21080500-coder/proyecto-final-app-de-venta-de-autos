
import 'package:flutter/material.dart';

import '../screens/nosotros_screen.dart';
import '../screens/products_overview_screen.dart';

class AppDrawer extends StatelessWidget {
  const AppDrawer({super.key});

  static const Color navy = Color(0xFF14213D);
  static const Color red = Color(0xFFEF4444);

  void _navigate(BuildContext context, String route) {
    final navigator = Navigator.of(context);
    final currentRoute =
        ModalRoute.of(context)?.settings.name;

    // Cierra el menú lateral.
    navigator.pop();

    // Evita abrir la misma página dos veces.
    if (currentRoute != route) {
      navigator.pushNamed(route);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Colors.white,
      child: SafeArea(
        child: Column(
          children: [
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(24),
              decoration: const BoxDecoration(
                color: navy,
              ),
              child: Column(
                crossAxisAlignment:
                    CrossAxisAlignment.start,
                children: [
                  Image.asset(
                    'images/logo.png',
                    height: 115,
                    fit: BoxFit.contain,
                  ),
                  const SizedBox(height: 10),
                  const Text(
                    'CarsLot Chihuahua',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 21,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 5),
                  const Text(
                    'Encuentra tu próximo automóvil',
                    style: TextStyle(
                      color: Color(0xFFCBD5E1),
                      fontSize: 13,
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 14),

            ListTile(
              contentPadding: const EdgeInsets.symmetric(
                horizontal: 22,
              ),
              leading: const Icon(
                Icons.directions_car_outlined,
                color: red,
              ),
              title: const Text(
                'Explorar autos',
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                ),
              ),
              trailing: const Icon(
                Icons.chevron_right_rounded,
              ),
              onTap: () => _navigate(
                context,
                ProductsOverviewScreen.routeName,
              ),
            ),

            const Divider(indent: 22, endIndent: 22),

            ListTile(
              contentPadding: const EdgeInsets.symmetric(
                horizontal: 22,
              ),
              leading: const Icon(
                Icons.info_outline_rounded,
                color: red,
              ),
              title: const Text(
                'Nosotros',
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                ),
              ),
              trailing: const Icon(
                Icons.chevron_right_rounded,
              ),
              onTap: () => _navigate(
                context,
                NosotrosScreen.routeName,
              ),
            ),

            const Spacer(),

            const Padding(
              padding: EdgeInsets.all(22),
              child: Text(
                'CarsLot • Flutter 2026',
                style: TextStyle(
                  color: Color(0xFF94A3B8),
                  fontSize: 12,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
