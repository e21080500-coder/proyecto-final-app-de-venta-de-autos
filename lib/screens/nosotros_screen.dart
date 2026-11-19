
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class NosotrosScreen extends StatelessWidget {
  const NosotrosScreen({super.key});

  static const String routeName = '/nosotros';

  // Configura aquí los datos de contacto del proyecto.
  // WhatsApp debe incluir código de país, sin + ni espacios.
  static const String contactEmail = '';
  static const String contactWhatsapp = '';

  static const Color navy = Color(0xFF14213D);
  static const Color red = Color(0xFFEF4444);
  static const Color background = Color(0xFFF4F6FA);

  void _showMessage(BuildContext context, String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(message)),
    );
  }

  Future<void> _openLink(
    BuildContext context,
    Uri uri,
  ) async {
    try {
      final opened = await launchUrl(
        uri,
        mode: LaunchMode.externalApplication,
      );

      if (!opened && context.mounted) {
        _showMessage(
          context,
          'No se pudo abrir la aplicación.',
        );
      }
    } catch (_) {
      if (context.mounted) {
        _showMessage(
          context,
          'No fue posible abrir el enlace.',
        );
      }
    }
  }

  Future<void> _openEmail(BuildContext context) async {
    if (contactEmail.isEmpty) {
      _showMessage(
        context,
        'El correo de contacto aún no está configurado.',
      );
      return;
    }

    await _openLink(
      context,
      Uri(
        scheme: 'mailto',
        path: contactEmail,
      ),
    );
  }

  Future<void> _openWhatsapp(BuildContext context) async {
    if (contactWhatsapp.isEmpty) {
      _showMessage(
        context,
        'El WhatsApp aún no está configurado.',
      );
      return;
    }

    final uri = Uri.https(
      'wa.me',
      '/$contactWhatsapp',
      {
        'text':
            'Hola, me gustaría recibir información '
            'sobre los vehículos de CarsLot.',
      },
    );

    await _openLink(context, uri);
  }

  Widget _buildCard({required Widget child}) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(22),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(22),
        border: Border.all(
          color: const Color(0xFFE5EAF1),
        ),
      ),
      child: child,
    );
  }

  Widget _buildFeature(
    IconData icon,
    String title,
    String description,
  ) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 12),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: const Color(0xFFFFECEC),
              borderRadius: BorderRadius.circular(14),
            ),
            child: Icon(icon, color: red),
          ),
          const SizedBox(width: 14),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: navy,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  description,
                  style: const TextStyle(
                    color: Color(0xFF64748B),
                    height: 1.5,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: background,
      appBar: AppBar(
        title: const Text(
          'Sobre CarsLot',
          style: TextStyle(
            color: navy,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
        backgroundColor: background,
        foregroundColor: navy,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Center(
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 850),
            child: Padding(
              padding: const EdgeInsets.fromLTRB(18, 12, 18, 35),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Encabezado con identidad del negocio
                  ClipRRect(
                    borderRadius: BorderRadius.circular(24),
                    child: SizedBox(
                      height: 280,
                      width: double.infinity,
                      child: Stack(
                        fit: StackFit.expand,
                        children: [
                          Image.asset(
                            'images/back.jpg',
                            fit: BoxFit.cover,
                          ),
                          Container(
                            decoration: const BoxDecoration(
                              gradient: LinearGradient(
                                begin: Alignment.topCenter,
                                end: Alignment.bottomCenter,
                                colors: [
                                  Color(0xAA101827),
                                  Color(0xDD101827),
                                ],
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(22),
                            child: Column(
                              mainAxisAlignment:
                                  MainAxisAlignment.center,
                              children: [
                                Image.asset(
                                  'images/logo.png',
                                  height: 135,
                                  fit: BoxFit.contain,
                                ),
                                const SizedBox(height: 12),
                                const Text(
                                  'Tu próximo auto comienza aquí',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 21,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                const SizedBox(height: 8),
                                const Text(
                                  'Explora vehículos de forma '
                                  'fácil, rápida y moderna.',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    color: Color(0xFFE2E8F0),
                                    fontSize: 14,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),

                  const SizedBox(height: 20),

                  _buildCard(
                    child: Column(
                      crossAxisAlignment:
                          CrossAxisAlignment.start,
                      children: [
                        const Text(
                          '¿Qué es CarsLot?',
                          style: TextStyle(
                            fontSize: 22,
                            fontWeight: FontWeight.bold,
                            color: navy,
                          ),
                        ),
                        const SizedBox(height: 12),
                        const Text(
                          'CarsLot Chihuahua es un proyecto '
                          'de aplicación móvil desarrollado '
                          'en Flutter para explorar anuncios '
                          'de automóviles, consultar sus '
                          'características y facilitar el '
                          'contacto con los vendedores.',
                          style: TextStyle(
                            color: Color(0xFF526075),
                            height: 1.7,
                            fontSize: 15,
                          ),
                        ),
                      ],
                    ),
                  ),

                  const SizedBox(height: 16),

                  _buildCard(
                    child: Column(
                      crossAxisAlignment:
                          CrossAxisAlignment.start,
                      children: [
                        const Text(
                          '¿Qué puedes hacer?',
                          style: TextStyle(
                            color: navy,
                            fontSize: 21,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 14),
                        _buildFeature(
                          Icons.directions_car_rounded,
                          'Explorar vehículos',
                          'Consulta los automóviles disponibles '
                          'en el catálogo.',
                        ),
                        _buildFeature(
                          Icons.photo_library_outlined,
                          'Ver fotografías y detalles',
                          'Revisa imágenes, precios, kilometraje '
                          'y descripciones.',
                        ),
                        _buildFeature(
                          Icons.favorite_border_rounded,
                          'Guardar favoritos',
                          'Marca los vehículos que más '
                          'te interesan.',
                        ),
                        _buildFeature(
                          Icons.chat_bubble_outline_rounded,
                          'Contactar al vendedor',
                          'Accede a las opciones de contacto '
                          'disponibles en cada anuncio.',
                        ),
                      ],
                    ),
                  ),

                  const SizedBox(height: 16),

                  _buildCard(
                    child: Column(
                      crossAxisAlignment:
                          CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'Contacto',
                          style: TextStyle(
                            color: navy,
                            fontSize: 21,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 10),
                        const Text(
                          '¿Quieres comunicarte con nosotros?',
                          style: TextStyle(
                            color: Color(0xFF64748B),
                          ),
                        ),
                        const SizedBox(height: 18),

                        ListTile(
                          contentPadding: EdgeInsets.zero,
                          leading: const CircleAvatar(
                            backgroundColor:
                                Color(0xFFFFECEC),
                            child: Icon(
                              Icons.email_outlined,
                              color: red,
                            ),
                          ),
                          title: const Text(
                            'Correo electrónico',
                            style: TextStyle(
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          subtitle: Text(
                            contactEmail.isEmpty
                                ? 'Pendiente de configurar'
                                : contactEmail,
                          ),
                          trailing: const Icon(
                            Icons.arrow_outward_rounded,
                          ),
                          onTap: () => _openEmail(context),
                        ),

                        const Divider(height: 24),

                        SizedBox(
                          width: double.infinity,
                          child: FilledButton.icon(
                            onPressed: () =>
                                _openWhatsapp(context),
                            style: FilledButton.styleFrom(
                              backgroundColor:
                                  const Color(0xFF16A34A),
                              foregroundColor: Colors.white,
                              padding:
                                  const EdgeInsets.symmetric(
                                vertical: 17,
                              ),
                              shape: RoundedRectangleBorder(
                                borderRadius:
                                    BorderRadius.circular(14),
                              ),
                            ),
                            icon: const Icon(
                              Icons.chat_bubble_outline,
                            ),
                            label: const Text(
                              'Contactar por WhatsApp',
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),

                  const SizedBox(height: 22),

                  const Center(
                    child: Text(
                      'CarsLot Chihuahua • Proyecto Flutter 2026\n'
                      'Versión de demostración',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Color(0xFF94A3B8),
                        fontSize: 12,
                        height: 1.6,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
