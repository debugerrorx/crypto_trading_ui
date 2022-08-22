import 'package:crypto_trading_ui/utils/constants.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class Chart extends StatefulWidget {
  final List<double> data;
  final double minData;
  final double maxData;
  final double? minY;
  final double? maxY;
  final double paddingTop;
  final double thickness;
  final List<Color> gradientColors;
  final double? initialData;
  final double? interval;
  final List<String> horizontalLines;
  final String format;
  final bool showTouchTooltip;

  const Chart({
    Key? key,
    required this.data,
    required this.minData,
    required this.maxData,
    this.minY,
    this.maxY,
    this.paddingTop = 100,
    this.thickness = 3,
    this.gradientColors = const [
      Color(0xFFFFFFFF),
      Color(0x00FFFFFF),
    ],
    this.initialData,
    this.interval,
    this.horizontalLines = const [],
    this.format = '',
    this.showTouchTooltip = false,
  }) : super(key: key);

  @override
  State<Chart> createState() => _ChartState();
}

class _ChartState extends State<Chart> {
  var dataAnimated = [];

  @override
  void initState() {
    dataAnimated =
        List.filled(widget.data.length, widget.initialData ?? widget.minData);

    Future.delayed(const Duration(milliseconds: 200)).then((_) {
      setState(() {
        dataAnimated = widget.data;
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: widget.paddingTop),
      child: LineChart(
        swapAnimationCurve: Curves.easeInOut,
        swapAnimationDuration: const Duration(milliseconds: 400),
        LineChartData(
          minX: 0,
          maxX: widget.data.length - 1,
          minY: widget.minY ?? widget.minData,
          maxY: widget.maxY ?? widget.maxData,
          titlesData: FlTitlesData(
            leftTitles: AxisTitles(
              sideTitles: SideTitles(showTitles: false),
            ),
            topTitles: AxisTitles(
              sideTitles: SideTitles(showTitles: false),
            ),
            bottomTitles: AxisTitles(
              sideTitles: SideTitles(showTitles: false),
            ),
            rightTitles: AxisTitles(
              sideTitles: SideTitles(
                  showTitles: widget.horizontalLines.isNotEmpty,
                  reservedSize: NumberFormat(widget.format)
                          .format(widget.minData)
                          .length *
                      11.0,
                  interval: widget.interval,
                  getTitlesWidget: (value, meta) {
                    String title = widget.horizontalLines
                            .contains(value.toStringAsFixed(4))
                        ? NumberFormat(widget.format).format(value)
                        : '';
                    return SideTitleWidget(
                      axisSide: meta.axisSide,
                      child: Text(title),
                    );
                  }),
            ),
          ),
          lineTouchData: LineTouchData(
            enabled: widget.showTouchTooltip,
            touchTooltipData: LineTouchTooltipData(
              tooltipBgColor: kPrimaryColor,
              getTooltipItems: (touchedSpots) => touchedSpots
                  .map(
                    (spot) => LineTooltipItem(
                      '${NumberFormat.simpleCurrency().format(spot.y)}\n'
                      '${spot.x.toInt()}:00',
                      const TextStyle(),
                    ),
                  )
                  .toList(),
            ),
          ),
          gridData: FlGridData(
            drawVerticalLine: false,
            drawHorizontalLine: widget.interval != null,
            horizontalInterval: widget.interval,
            getDrawingHorizontalLine: (_) => FlLine(
              color: kSecondaryTextColor,
              strokeWidth: 0.5,
            ),
          ),
          borderData: FlBorderData(
            show: false,
          ),
          lineBarsData: [
            LineChartBarData(
              spots: [
                for (int i = 0; i < dataAnimated.length; i++)
                  FlSpot(i.toDouble(), dataAnimated[i])
              ],
              isCurved: true,
              barWidth: widget.thickness,
              isStrokeCapRound: true,
              gradient: const LinearGradient(
                begin: Alignment.centerLeft,
                end: Alignment.centerRight,
                colors: [
                  Color(0x00FFFFFF),
                  Color(0xFFFFFFFF),
                ],
              ),
              dotData: FlDotData(show: false),
              belowBarData: BarAreaData(
                show: true,
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: widget.gradientColors,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
