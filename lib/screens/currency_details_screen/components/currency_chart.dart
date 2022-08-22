import 'dart:math' as math;

import 'package:crypto_trading_ui/utils/constants.dart';
import 'package:flutter/material.dart';

import '../../../components/chart.dart';

class CurrencyChart extends StatelessWidget {
  final List<double> priceHistory;

  const CurrencyChart({
    Key? key,
    required this.priceHistory,
  }) : super(key: key);

  double getInterval(double minPrice, double maxPrice) {
    final split = (maxPrice - minPrice) / 5;
    final List<double> intervals = [0.005, 0.01, 0.1, 1, 10, 20, 50, 100, 200];
    for (final interval in intervals) {
      if (split < interval) {
        return interval;
      }
    }
    return 500;
  }

  String getFormat(double interval) {
    if (interval < 0.006) {
      return '\$#,##0.0000';
    } else if (interval <= 1) {
      return '\$#,##0.00';
    } else {
      return '\$#,###';
    }
  }

  @override
  Widget build(BuildContext context) {
    final minPrice = priceHistory.reduce(math.min);
    final maxPrice = priceHistory.reduce(math.max);
    final interval = getInterval(minPrice, maxPrice);

    final minPriceRounded = minPrice - (minPrice % interval);
    final List<String> horizontalLines = [];
    for (var v = minPriceRounded; v < maxPrice + interval; v += interval) {
      horizontalLines.add(v.toStringAsFixed(4));
    }

    return Padding(
      padding: const EdgeInsets.only(left: 16),
      child: ShaderMask(
        shaderCallback: (bounds) => LinearGradient(
          begin: Alignment.centerLeft,
          end: const Alignment(-0.7, 0),
          colors: [
            kBackgroundColor.withOpacity(0),
            kBackgroundColor,
          ],
        ).createShader(bounds),
        blendMode: BlendMode.dstATop,
        child: SizedBox(
          height: 200,
          child: Chart(
            data: priceHistory,
            minData: minPrice,
            maxData: maxPrice,
            paddingTop: 0,
            thickness: 2,
            gradientColors: [
              kSecondaryColor,
              kSecondaryColor.withOpacity(0),
            ],
            initialData: minPrice + (maxPrice - minPrice) / 2,
            interval: interval,
            horizontalLines: horizontalLines,
            format: getFormat(interval),
            showTouchTooltip: true,
          ),
        ),
      ),
    );
  }
}
