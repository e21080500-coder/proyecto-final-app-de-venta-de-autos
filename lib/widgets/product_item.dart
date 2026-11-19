
import 'package:flutter/material.dart';

import '../models/product.dart';
import '../screens/product_detail_screen.dart';

class ProductItem extends StatelessWidget {
  final Product product;
  final VoidCallback onFavoriteToggle;

  const ProductItem({
    super.key,
    required this.product,
    required this.onFavoriteToggle,
  });

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(12),
      child: GridTile(
        footer: GridTileBar(
          backgroundColor: Colors.black54,

          leading: IconButton(
            tooltip: 'Agregar o quitar de favoritos',
            onPressed: onFavoriteToggle,
            icon: Icon(
              product.isFavorite
                  ? Icons.favorite
                  : Icons.favorite_border,
              color: product.isFavorite
                  ? Colors.redAccent
                  : Colors.white,
            ),
          ),

          title: Text(
            product.title,
            textAlign: TextAlign.center,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 14,
            ),
          ),

          trailing: Text(
            product.price,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 13,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),

        child: InkWell(
          onTap: () {
            Navigator.of(context).pushNamed(
              ProductDetailScreen.routeName,
              arguments: product,
            );
          },
          child: Image.network(
            product.imageUrl01,
            width: double.infinity,
            height: double.infinity,
            fit: BoxFit.cover,

            loadingBuilder: (
              context,
              child,
              loadingProgress,
            ) {
              if (loadingProgress == null) {
                return child;
              }

              return const Center(
                child: CircularProgressIndicator(),
              );
            },

            errorBuilder: (
              context,
              error,
              stackTrace,
            ) {
              return Container(
                color: Colors.grey.shade200,
                child: const Center(
                  child: Icon(
                    Icons.directions_car,
                    size: 75,
                    color: Colors.grey,
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
