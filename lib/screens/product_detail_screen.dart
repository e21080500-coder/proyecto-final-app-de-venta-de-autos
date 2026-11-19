
import 'package:flutter/material.dart';

import '../models/product.dart';

class ProductDetailScreen extends StatelessWidget {
  const ProductDetailScreen({super.key});

  static const String routeName = '/product-detail';

  @override
  Widget build(BuildContext context) {
    final arguments =
        ModalRoute.of(context)?.settings.arguments;

    final Product? product =
        arguments is Product ? arguments : null;

    if (product == null) {
      return Scaffold(
        appBar: AppBar(
          title: const Text('Products Details'),
        ),
        body: const Center(
          child: Text('No se encontró el automóvil.'),
        ),
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text('Products Details'),
        backgroundColor: Colors.red,
        foregroundColor: Colors.white,
      ),

      body: ListView(
        children: [
          Image.network(
            product.imageUrl01,
            width: double.infinity,
            height: 250,
            fit: BoxFit.cover,

            errorBuilder: (
              context,
              error,
              stackTrace,
            ) {
              return Container(
                height: 250,
                color: Colors.grey.shade200,
                child: const Icon(
                  Icons.directions_car,
                  size: 100,
                  color: Colors.grey,
                ),
              );
            },
          ),

          Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment:
                  CrossAxisAlignment.start,
              children: [
                Text(
                  product.title,
                  style: const TextStyle(
                    fontSize: 27,
                    fontWeight: FontWeight.bold,
                  ),
                ),

                const SizedBox(height: 12),

                Text(
                  '${product.price} MXN',
                  style: const TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.red,
                  ),
                ),

                const SizedBox(height: 22),

                Row(
                  children: [
                    const Icon(
                      Icons.speed,
                      color: Colors.grey,
                    ),
                    const SizedBox(width: 8),
                    Text(
                      '${product.km} km recorridos',
                      style: const TextStyle(
                        fontSize: 16,
                      ),
                    ),
                  ],
                ),

                const SizedBox(height: 22),

                const Text(
                  'Descripción',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),

                const SizedBox(height: 8),

                Text(
                  product.description,
                  style: const TextStyle(
                    fontSize: 16,
                  ),
                ),

                const SizedBox(height: 30),

                const Text(
                  'Los datos mostrados son ejemplos. '
                  'Más adelante agregaremos fotografías '
                  'reales y anuncios desde Firebase.',
                  style: TextStyle(
                    color: Colors.grey,
                    fontSize: 13,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
