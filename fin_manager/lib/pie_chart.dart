import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';

class PieChartWidget extends StatefulWidget {
  const PieChartWidget({Key? key}) : super(key: key);


  @override
  State<PieChartWidget> createState() => PieChartWidgetState();
}

class PieChartWidgetState extends State<PieChartWidget> {

  double total = 11199.19;
  double food = 4029.36;
  double housing = 6000.00;
  double miscellaneous = 737.02;
  double entertainment = 432.81;
  int touchedIndex = 0;

  List<Color> pieChartColors = [
    const Color.fromRGBO(237, 93, 93, 1), // Red
    const Color.fromRGBO(205, 129, 58, 1), // Orange
    const Color.fromRGBO(205, 175, 69, 1), // Yellow
    const Color.fromRGBO(53, 173, 87, 1), // Green
    const Color.fromRGBO(36, 146, 153, 1), // Blue
    const Color.fromRGBO(139, 80, 159, 1), // Purple
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
              "Spending",
              style: TextStyle(
                color: Colors.white,
                fontSize: 24,
                fontWeight: FontWeight.w400
              ),
            ),
          )
        ),
        Padding(
          padding: const EdgeInsets.only(bottom: 24),
          child: Center(
            child: Container(
              width: (MediaQuery.of(context).size.height * 0.3) + 10,
              height: (MediaQuery.of(context).size.height * 0.3) + 10,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular((MediaQuery.of(context).size.height * 0.15) + 5)
              ),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(bottom: 24),
          child: PieChart(
            PieChartData(
              pieTouchData: PieTouchData(
                touchCallback: (FlTouchEvent event, pieTouchResponse) {
                  setState(() {
                    if (!event.isInterestedForInteractions || pieTouchResponse == null || pieTouchResponse.touchedSection == null) {
                      touchedIndex = -1;
                      return;
                    }
                    touchedIndex =pieTouchResponse.touchedSection!.touchedSectionIndex;
                  });
                }
              ),
              borderData: FlBorderData(
                show: false
              ),
              sectionsSpace: 5,
              centerSpaceRadius: 0,
              sections: showingSections()
            ),
          ),
        ),
      ]
    );
  }
  List<PieChartSectionData> showingSections() {
    return List.generate(4, (i) {
      final isTouched = i == touchedIndex;
      final fontSize = isTouched ? 20.0 : 0.0;
      final radius = MediaQuery.of(context).size.height * 0.15;

      switch (i) {
        case 0: // Food
          return PieChartSectionData(
            color: pieChartColors[0],
            value: food / total,
            title: (food / total) > 0.2 ? 'Food\n\$${food.toInt()}' : '',
            radius: radius,
            titleStyle: TextStyle(
                fontSize: fontSize,
                fontWeight: FontWeight.bold,
                color: const Color(0xffffffff)),
          );
        case 1: // Housing
          return PieChartSectionData(
            color: pieChartColors[1],
            value: housing / total,
            title: (housing / total) > 0.2 ? 'Housing\n\$${housing.toInt()}' : '',
            radius: radius,
            titleStyle: TextStyle(
                fontSize: fontSize,
                fontWeight: FontWeight.bold,
                color: const Color(0xffffffff)),
          );
        case 2: // Entertainment
          return PieChartSectionData(
            color: pieChartColors[2],
            value: entertainment / total,
            title: (entertainment / total) > 0.2 ? 'Entertainment\n\$${entertainment.toInt()}' : '',
            radius: radius,
            titleStyle: TextStyle(
                fontSize: fontSize,
                fontWeight: FontWeight.bold,
                color: const Color(0xffffffff)),
          );
        case 3: // Miscellaneous
          return PieChartSectionData(
            color: pieChartColors[3],
            value: miscellaneous / total,
            title: (miscellaneous / total) > 0.2 ? 'Miscellaneous\n\$${miscellaneous.toInt()}' : '',
            radius: radius,
            titleStyle: TextStyle(
                fontSize: fontSize,
                fontWeight: FontWeight.bold,
                color: const Color(0xffffffff)),
          );
        default:
          throw 'Oh no';
      }
    });
  }
}