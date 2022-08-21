import 'package:crypto_trading_ui/mocks/mock_favorites.dart';
import 'package:flutter/material.dart';

import 'favorites_item.dart';

class Favorites extends StatelessWidget {
  const Favorites({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Favorites',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 24),
          for (final currency in MockFavorites.data) ...[
            FavoritesItem(currency: currency),
            const SizedBox(height: 16),
          ],
        ],
      ),
    );
  }
}
