import 'package:crypto_trading_ui/mocks/mock_balance.dart';
import 'package:crypto_trading_ui/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:intl/intl.dart';

import 'balance_background.dart';

class BalanceCard extends StatelessWidget {
  const BalanceCard({Key? key}) : super(key: key);

  Widget balanceText() {
    return Padding(
      padding: const EdgeInsets.all(28),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Balance',
            style: TextStyle(fontSize: 18),
          ),
          const SizedBox(height: 4),
          Text(
            NumberFormat.simpleCurrency().format(MockBalance.data.last),
            style: const TextStyle(
              fontSize: 28,
              fontWeight: FontWeight.bold,
            ),
          ),
          const Spacer(),
          const Text(
            'Profit Today',
            style: TextStyle(fontSize: 18),
          ),
          const SizedBox(height: 4),
          const Text(
            '\$201.12',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }

  Widget profitPercent() {
    return Positioned(
      right: 28,
      bottom: 28,
      child: Container(
        padding: const EdgeInsets.fromLTRB(6, 6, 8, 6),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30),
          color: kBackgroundColor.withOpacity(0.4),
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: const [
            Icon(
              FontAwesomeIcons.caretUp,
              size: 16,
            ),
            SizedBox(width: 2),
            Text('+5.2%'),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: SizedBox(
        height: 200,
        child: Stack(
          children: [
            const BalanceBackground(),
            balanceText(),
            profitPercent(),
          ],
        ),
      ),
    );
  }
}
