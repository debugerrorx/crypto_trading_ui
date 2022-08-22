import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../models/currency.dart';
import '../../models/trade.dart';
import '../../utils/constants.dart';
import 'components/currency_chart.dart';
import 'components/trade_button.dart';
import 'components/trade_item.dart';

class CurrencyDetailsScreen extends StatelessWidget {
  final Currency currency;

  const CurrencyDetailsScreen({
    Key? key,
    required this.currency,
  }) : super(key: key);

  Widget appBar(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 4, right: 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          IconButton(
            onPressed: () => Navigator.of(context).pop(),
            icon: const Icon(
              FontAwesomeIcons.chevronLeft,
            ),
          ),
          const Spacer(),
          SizedBox(
            height: 32,
            child: currency.icon,
          ),
          const SizedBox(width: 12),
          Text(
            currency.name,
            style: const TextStyle(
              fontSize: 28,
              fontWeight: FontWeight.bold,
            ),
          ),
          const Spacer(),
          IconButton(
            onPressed: () {},
            icon: const Icon(
              FontAwesomeIcons.solidStar,
              color: Color(0xFFFFD029),
            ),
          ),
        ],
      ),
    );
  }

  Widget price() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            currency.currentPriceString,
            style: const TextStyle(
              fontSize: 28,
              fontWeight: FontWeight.bold,
            ),
          ),
          Container(
            padding: const EdgeInsets.fromLTRB(6, 6, 8, 6),
            decoration: BoxDecoration(
              color: currency.priceChange >= 0
                  ? const Color(0xFF409166)
                  : const Color(0xFFC84747),
              borderRadius: BorderRadius.circular(30),
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Icon(
                  currency.priceChange >= 0
                      ? FontAwesomeIcons.caretUp
                      : FontAwesomeIcons.caretDown,
                  size: 16,
                ),
                const SizedBox(width: 2),
                Text(currency.priceChangeString),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget timeFrames() {
    final timeFrameList = [
      '1H',
      '8H',
      '1D',
      '1W',
      '1M',
      '3M',
      '6M',
      '1Y',
    ];

    return SizedBox(
      height: 30,
      child: ListView.separated(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        scrollDirection: Axis.horizontal,
        separatorBuilder: (_, __) => const SizedBox(width: 16),
        itemCount: timeFrameList.length,
        itemBuilder: (_, index) => Container(
          width: 48,
          height: 28,
          decoration: BoxDecoration(
            border: Border.all(
              color: index == 0 ? kPrimaryTextColor : Colors.transparent,
            ),
            borderRadius: BorderRadius.circular(20),
            color: kPrimaryColor,
          ),
          child: Center(
            child: Text(timeFrameList[index]),
          ),
        ),
      ),
    );
  }

  Widget tradingHistory() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Trading History',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 24),
          for (final trade in currency.tradeHistory) ...[
            TradeItem(
              currencyCode: currency.code,
              trade: trade,
            ),
            const SizedBox(height: 16),
          ],
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          ListView(
            padding: const EdgeInsets.only(top: 50, bottom: 80),
            children: [
              appBar(context),
              const SizedBox(height: 36),
              price(),
              const SizedBox(height: 36),
              timeFrames(),
              const SizedBox(height: 24),
              CurrencyChart(priceHistory: currency.priceHistory),
              const SizedBox(height: 36),
              if (currency.tradeHistory.isNotEmpty) tradingHistory(),
            ],
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const [
                TradeButton(tradeDirection: TradeDirection.sell),
                TradeButton(tradeDirection: TradeDirection.buy),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
