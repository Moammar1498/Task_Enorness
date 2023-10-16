import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class SalesReportChart extends StatelessWidget {
  final List<String>? yData;
  final List<double>? xData;

  const SalesReportChart({super.key, required this.yData, required this.xData});

  @override
  Widget build(BuildContext context) {
    return SfCartesianChart(
      plotAreaBorderWidth: 0,
      primaryXAxis: CategoryAxis(),
      primaryYAxis: NumericAxis(
        minimum: 0, // Minimum value on the y-axis
        maximum: 100, // Maximum value on the y-axis
        axisLabelFormatter: (axisLabelRenderArgs) {
          return ChartAxisLabel(
              '${axisLabelRenderArgs.value}%',
              const TextStyle(
                color: Colors.black,
                fontSize: 16,
              ));
        },
      ),
      series: <ChartSeries>[
        AreaSeries<double, String>(
          dataSource: List.generate(yData!.length, (index) => xData![index]),
          xValueMapper: (double sales, _) => yData?[xData!.indexOf(sales)],
          yValueMapper: (double sales, _) => sales,
          gradient: LinearGradient(
            colors: [Colors.green, Colors.green.shade300],
            stops: const [0.0, 1.0],
          ),
          borderDrawMode: BorderDrawMode.excludeBottom,
        )
      ],
    );
  }
}
