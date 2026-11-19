
import 'package:flutter/material.dart';

import '../models/product.dart';
import '../widgets/product_item.dart';
import '../widgets/app_drawer.dart';

// Opciones disponibles en el menú del catálogo.
enum FilterOptions {
  favorites,
  all,
}

class ProductsOverviewScreen extends StatefulWidget {
  const ProductsOverviewScreen({super.key});

  static const String routeName = '/products-overview';

  @override
  State<ProductsOverviewScreen> createState() =>
      _ProductsOverviewScreenState();
}

class _ProductsOverviewScreenState
    extends State<ProductsOverviewScreen> {

  // Controla si se muestran todos los autos
  // o solamente los que están en favoritos.
  bool _showOnlyFavorites = false;

  // Imágenes de ejemplo.
  static const String redCarImage =
      'https://images.unsplash.com/photo-1494976388531-d1058494cdd8?w=1200';

  static const String blackCarImage =
      'https://images.unsplash.com/photo-1549317661-bd32c8ce0db2?w=1200';

  // Lista de automóviles del curso.
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

  // Marca o desmarca un automóvil como favorito.
  void toggleFavorite(Product product) {
    setState(() {
      product.isFavorite = !product.isFavorite;
    });
  }

  // Cambia el filtro del catálogo.
  void changeFilter(FilterOptions selectedValue) {
    setState(() {
      if (selectedValue == FilterOptions.favorites) {
        _showOnlyFavorites = true;
      } else {
        _showOnlyFavorites = false;
      }
    });
  }

  // Devuelve los autos que deben mostrarse.
  List<Product> get displayedProducts {
    if (_showOnlyFavorites) {
      return loadedProducts
          .where((product) => product.isFavorite)
          .toList();
    }

    return loadedProducts;
  }

  @override
  Widget build(BuildContext context) {
    final products = displayedProducts;

    return Scaffold(

      // ==========================================
      // MENÚ LATERAL - SECCIÓN 5 DEL CURSO
      // ==========================================
      drawer: AppDrawer(),

      // ==========================================
      // BARRA SUPERIOR DEL CATÁLOGO
      // ==========================================
      appBar: AppBar(
        title: const Text('Catálogo de autos'),
        centerTitle: true,
        backgroundColor: Colors.red,
        foregroundColor: Colors.white,

        // Botón para abrir el menú lateral.
        leading: Builder(
          builder: (context) => IconButton(
            icon: const Icon(Icons.menu_rounded),
            tooltip: 'Abrir menú',
            onPressed: () {
              Scaffold.of(context).openDrawer();
            },
          ),
        ),

        // ==========================================
        // MENÚ DE FILTROS
        // ==========================================
        actions: [
          PopupMenuButton<FilterOptions>(
            tooltip: 'Filtrar automóviles',
            icon: const Icon(Icons.more_vert),

            onSelected: changeFilter,

            itemBuilder: (context) => [
              PopupMenuItem<FilterOptions>(
                value: FilterOptions.all,
                child: Row(
                  children: [
                    Icon(
                      _showOnlyFavorites
                          ? Icons.directions_car_outlined
                          : Icons.check_circle,
                      color: _showOnlyFavorites
                          ? Colors.grey
                          : Colors.red,
                    ),
                    const SizedBox(width: 10),
                    const Text('Mostrar todos'),
                  ],
                ),
              ),

              PopupMenuItem<FilterOptions>(
                value: FilterOptions.favorites,
                child: Row(
                  children: [
                    Icon(
                      _showOnlyFavorites
                          ? Icons.check_circle
                          : Icons.favorite,
                      color: _showOnlyFavorites
                          ? Colors.red
                          : Colors.grey,
                    ),
                    const SizedBox(width: 10),
                    const Text('Solo favoritos'),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),

      // ==========================================
      // CONTENIDO DEL CATÁLOGO
      // ==========================================

      // Si no hay favoritos, mostramos un mensaje.
      body: products.isEmpty
          ? Center(
              child: Padding(
                padding: const EdgeInsets.all(24),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const Icon(
                      Icons.favorite_border,
                      size: 85,
                      color: Colors.grey,
                    ),

                    const SizedBox(height: 18),

                    const Text(
                      'No tienes autos favoritos',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                      ),
                    ),

                    const SizedBox(height: 10),

                    const Text(
                      'Marca un automóvil con el corazón '
                      'para que aparezca en esta sección.',
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 15),
                    ),

                    const SizedBox(height: 20),

                    ElevatedButton.icon(
                      onPressed: () {
                        setState(() {
                          _showOnlyFavorites = false;
                        });
                      },
                      icon: const Icon(
                        Icons.directions_car,
                      ),
                      label: const Text('Mostrar todos'),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.red,
                        foregroundColor: Colors.white,
                      ),
                    ),
                  ],
                ),
              ),
            )

          // ==========================================
          // GRID DE AUTOMÓVILES
          // ==========================================
          : LayoutBuilder(
              builder: (context, constraints) {
                final int columns =
                    constraints.maxWidth >= 800 ? 2 : 1;

                return GridView.builder(
                  padding: const EdgeInsets.all(12),

                  itemCount: products.length,

                  gridDelegate:
                      SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: columns,
                    childAspectRatio:
                        columns == 1 ? 16 / 9 : 16 / 10,
                    crossAxisSpacing: 12,
                    mainAxisSpacing: 12,
                  ),

                  itemBuilder: (context, index) {
                    final product = products[index];

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
