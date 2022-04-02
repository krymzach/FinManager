import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';

class LineGraphWidget extends StatefulWidget {
  const LineGraphWidget({Key? key}) : super(key: key);


  @override
  State<LineGraphWidget> createState() => LineGraphWidgetState();
}

class LineGraphWidgetState extends State<LineGraphWidget> {

  List<Color> gradientColors = [
    const Color(0xff23b6e6),
    const Color(0xff02d39a),
  ];

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Align(
          alignment: Alignment.bottomLeft,
          child: Padding(
            padding: EdgeInsets.only(bottom: MediaQuery.of(context).size.height * 0.012, left: MediaQuery.of(context).size.width * 0.015),
            child: const Text(
              "Wealth Over Past Year",
              style: TextStyle(
                color: Colors.white,
                fontSize: 24,
                fontWeight: FontWeight.w400
              ),
            ),
          )
        ),
        Align(
          alignment: Alignment.centerLeft,
          child: Padding(
            padding: const EdgeInsets.only(bottom: 24, left: 15),
            child: SizedBox(
              width: MediaQuery.of(context).size.width * 0.7,
              height: MediaQuery.of(context).size.height * 0.35,
              child: LineChart(
                mainData(),
              ),
            ),
          ),
        ),
      ]
    );
  }
  LineChartData mainData() {
    return LineChartData(
      gridData: FlGridData(
        show: true,
        drawVerticalLine: true,
        getDrawingHorizontalLine: (value) {
          return FlLine(
            color: const Color.fromRGBO(122, 95, 0, 1),
            strokeWidth: 2,
            dashArray: [3, 5]
          );
        },
        getDrawingVerticalLine: (value) {
          return FlLine(
            color: const Color.fromRGBO(122, 95, 0, 1),
            strokeWidth: 0,
          );
        },
      ),
      titlesData: FlTitlesData(
        show: true,
        rightTitles: SideTitles(showTitles: false),
        topTitles: SideTitles(showTitles: false),
        bottomTitles: SideTitles(
          showTitles: true,
          reservedSize: 22,
          interval: 1,
          getTextStyles: (context, value) => const TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 16),
          getTitles: (value) {
            switch (value.toInt()) {
              case 0:
                return 'JAN';
              case 1:
                return 'FEB';
              case 2:
                return 'MAR';
              case 3:
                return 'APR';
              case 4:
                return 'MAY';
              case 5:
                return 'JUN';
              case 6:
                return 'JUL';
              case 7:
                return 'AUG';
              case 8:
                return 'SEP';
              case 9:
                return 'OCT';
              case 10:
                return 'NOV';
              case 11:
                return 'DEC';
            }
            return '';
          },
          margin: 8,
        ),
        leftTitles: SideTitles(
          showTitles: true,
          interval: 1,
          getTextStyles: (context, value) => const TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 15,
          ),
          getTitles: (value) {
            switch (value.toInt()) {
              case 1:
                return '\$10k';
              case 3:
                return '\$30k';
              case 5:
                return '\$50k';
            }
            return '';
          },
          reservedSize: 45,
          margin: 12,
        ),
      ),
      borderData: FlBorderData(
          show: true,
          border: const Border(left: BorderSide(color: Colors.white, width: 3), bottom: BorderSide(color: Colors.white, width: 3))),
      minX: 0,
      maxX: 11,
      minY: 0,
      maxY: 6,
      lineBarsData: [
        LineChartBarData(
          spots: const [
            FlSpot(0, 1.4),
            FlSpot(0.5, 2),
            FlSpot(1, 2.1),
            FlSpot(1.5, 3.1),
            FlSpot(2, 2.7),
            FlSpot(2.5, 2.9),
            FlSpot(3, 4),
            FlSpot(3.5, 4.6),
            FlSpot(4, 5.1),
            FlSpot(4.5, 4.5),
            FlSpot(5, 4),
            FlSpot(5.5, 5.1),
            FlSpot(6, 4.6),
            FlSpot(6.5, 4.1),
            FlSpot(7, 4.3),
            FlSpot(7.5, 3.2),
            FlSpot(8, 2.8),
            FlSpot(8.5, 3.5),
            FlSpot(9, 4),
            FlSpot(9.5, 4.2),
            FlSpot(10, 4.5),
            FlSpot(10.5, 4.9),
            FlSpot(11, 5.3),
          ],
          isCurved: true,
          colors: gradientColors,
          barWidth: 5,
          isStrokeCapRound: true,
          dotData: FlDotData(
            show: false,
          ),
          belowBarData: BarAreaData(
            show: true,
            colors: gradientColors.map((color) => color.withOpacity(0.3)).toList(),
          ),
        ),
      ],
    );
  }
}