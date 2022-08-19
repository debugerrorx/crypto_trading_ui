import 'package:crypto_trading_ui/utils/constants.dart';
import 'package:flutter/material.dart';

import 'components/balance_card/balance_card.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  Widget header() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: const [
              Text(
                'Welcome',
                style: TextStyle(
                  fontSize: 20,
                  color: kSecondaryTextColor,
                ),
              ),
              SizedBox(height: 2),
              Text(
                'Jack Brown',
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          const CircleAvatar(
            foregroundImage: AssetImage('assets/images/jack_brown.png'),
            backgroundColor: kBackgroundColor,
            radius: 30,
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        padding: const EdgeInsets.only(top: 64, bottom: 24),
        children: [
          header(),
          const SizedBox(height: 36),
          const BalanceCard(),
        ],
      ),
    );
  }
}
