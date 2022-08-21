enum TradeDirection {
  buy,
  sell,
}

class Trade {
  final TradeDirection tradeDirection;
  final String date;
  final double amount;

  Trade({
    required this.tradeDirection,
    required this.date,
    required this.amount,
  });
}
