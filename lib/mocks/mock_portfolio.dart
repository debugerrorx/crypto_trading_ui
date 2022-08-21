import 'package:flutter/material.dart';

import '../models/currency.dart';
import '../models/trade.dart';

class MockPortfolio {
  static final data = [
    Currency(
      code: 'BTC',
      name: 'Bitcoin',
      icon: Image.asset('assets/images/btc_icon.png'),
      currentAmount: 0.0928,
      profit: 0.0738,
      priceHistory: [
        23884.20,
        23866.39,
        23791.06,
        23929.66,
        24017.48,
        24000.00,
        23956.67,
        23945.00,
        23933.71,
        24095.75,
        24015.13,
        23734.48,
        23526.43,
        23714.98,
        24044.44,
        24021.08,
        23868.90,
        23794.80,
        23931.23,
        23899.15,
        23950.77,
        23837.79,
        23959.53,
        23785.31,
      ],
      tradeHistory: [
        Trade(
          tradeDirection: TradeDirection.buy,
          date: '2022-07-29',
          amount: 0.0462,
        ),
        Trade(
          tradeDirection: TradeDirection.sell,
          date: '2022-07-21',
          amount: 0.0186,
        ),
        Trade(
          tradeDirection: TradeDirection.buy,
          date: '2022-04-16',
          amount: 0.0745,
        ),
        Trade(
          tradeDirection: TradeDirection.buy,
          date: '2022-04-11',
          amount: 0.0154,
        ),
      ],
    ),
    Currency(
      code: 'ETH',
      name: 'Ethereum',
      icon: Image.asset('assets/images/eth_icon.png'),
      currentAmount: 1.08,
      profit: 0.1165,
      priceHistory: [
        1727.19,
        1717.50,
        1713.61,
        1727.28,
        1741.16,
        1729.92,
        1716.35,
        1716.68,
        1720.14,
        1728.94,
        1720.44,
        1682.86,
        1666.68,
        1699.64,
        1724.64,
        1722.46,
        1691.95,
        1695.87,
        1722.95,
        1724.28,
        1732.05,
        1716.33,
        1742.81,
        1723.62,
      ],
      tradeHistory: [
        Trade(
          tradeDirection: TradeDirection.buy,
          date: '2022-07-27',
          amount: 0.712,
        ),
        Trade(
          tradeDirection: TradeDirection.buy,
          date: '2022-06-19',
          amount: 0.236,
        ),
        Trade(
          tradeDirection: TradeDirection.sell,
          date: '2022-06-14',
          amount: 0.394,
        ),
        Trade(
          tradeDirection: TradeDirection.buy,
          date: '2022-05-07',
          amount: 0.526,
        ),
      ],
    ),
  ];
}
