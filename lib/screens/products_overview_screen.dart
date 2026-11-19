
import 'package:flutter/material.dart';

import '../models/product.dart';
import '../widgets/product_item.dart';

class ProductsOverviewScreen extends StatefulWidget {
  const ProductsOverviewScreen({super.key});

  static const String routeName = '/products-overview';

  @override
  State<ProductsOverviewScreen> createState() =>
      _ProductsOverviewScreenState();
}

class _ProductsOverviewScreenState
    extends State<ProductsOverviewScreen> {

  static const String redCarImage =
      'https://images.unsplash.com/photo-1494976388531-d1058494cdd8?w=1200';

  static const String blackCarImage =
      'https://images.unsplash.com/photo-1549317661-bd32c8ce0db2?w=1200';

  final List<Product> loadedProducts = [
    Product(
      id: 'a1',
      title: 'Sentra 2005',
      description: 'Automóvil en buenas condiciones.',
      km: 160000,
      price: '\$98,000',
      imageUrl01: redCarImage,
      imageUrl02: redCarImage,
      imageUrl03: redCarImage,
      phone: '',
      whatsapp: '',
    ),

    Product(
      id: 'a2',
      title: 'Altima 2011',
      description: 'Automóvil usado en buenas condiciones.',
      km: 270000,
      price: '\$120,000',
      imageUrl01: blackCarImage,
      imageUrl02: blackCarImage,
      imageUrl03: blackCarImage,
      phone: '',
      whatsapp: '',
    ),
  ];

  void toggleFavorite(Product product) {
    setState(() {
      product.isFavorite = !product.isFavorite;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Products Overview'),
        backgroundColor: Colors.red,
        foregroundColor: Colors.white,
      ),

      body: LayoutBuilder(
        builder: (context, constraints) {
          // En celulares: una columna.
          // En pantallas grandes: dos columnas.
          final int columns =
              constraints.maxWidth >= 800 ? 2 : 1;

          return GridView.builder(
            padding: const EdgeInsets.all(12),

            itemCount: loadedProducts.length,

            gridDelegate:
                SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: columns,
              childAspectRatio: columns == 1
                  ? 16 / 9
                  : 16 / 10,
              crossAxisSpacing: 12,
              mainAxisSpacing: 12,
            ),

            itemBuilder: (context, index) {
              final product = loadedProducts[index];

              return ProductItem(
                product: product,
                onFavoriteToggle: () {
                  toggleFavorite(product);
                },
              );
            },
          );
        },
      ),
    );
  }
}
