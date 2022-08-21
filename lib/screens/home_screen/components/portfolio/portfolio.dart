import 'package:flutter/material.dart';

import '../../../../mocks/mock_portfolio.dart';
import 'portfolio_item.dart';

class Portfolio extends StatelessWidget {
  const Portfolio({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 24),
          child: Text(
            'My Portfolio',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        const SizedBox(height: 24),
        SizedBox(
          height: 160,
          child: ListView.separated(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            scrollDirection: Axis.horizontal,
            separatorBuilder: (_, __) => const SizedBox(width: 24),
            itemCount: MockPortfolio.data.length,
            itemBuilder: (_, index) => PortfolioItem(
              currency: MockPortfolio.data[index],
            ),
          ),
        ),
      ],
    );
  }
}
