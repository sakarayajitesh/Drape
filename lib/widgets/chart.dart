import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

import '../controllers/analytics_controller.dart';

class Chart extends StatefulWidget {
  const Chart({super.key});

  @override
  State<Chart> createState() => _ChartState();
}

class _ChartState extends State<Chart> {
  @override
  Widget build(BuildContext context) {
    final AnalyticsController controller = Get.find();
    controller.chartData.listen((p0) {
      if (mounted) {
        setState(() {});
      }
    });
    return Card(
      margin: EdgeInsets.zero,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 16.0, right: 16.0, top: 16.0),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  "Clothes",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Container(
                  padding: const EdgeInsets.all(8.0),
                  decoration: BoxDecoration(
                    color: const Color(0xffeaddff),
                    borderRadius: BorderRadius.circular(16.0),
                    border: Border.all(color: Colors.black12),
                  ),
                  child: Obx(
                    () => DropdownButton<String>(
                      isDense: true,
                      underline: Container(),
                      icon: const Icon(
                        Icons.keyboard_arrow_down,
                        color: Colors.black87,
                      ),
                      style: const TextStyle(
                        fontSize: 14.0,
                        color: Colors.black87,
                      ),
                      value: controller.chartOptionSelected.value,
                      items: controller.chartOptions.entries
                          .map(
                            (e) => DropdownMenuItem(
                              value: e.key,
                              child: Text(e.value),
                            ),
                          )
                          .toList(),
                      onChanged: (value) {
                        if (value != null) {
                          controller.onChartOptionSelectedChange(value);
                        }
                      },
                    ),
                  ),
                ),
              ],
            ),
          ),
          SfCircularChart(
            series: <CircularSeries<dynamic, String>>[
              DoughnutSeries<dynamic, String>(
                animationDuration: 500,
                radius: "60%",
                dataSource: controller.chartData,
                dataLabelMapper: (dynamic data, _) {
                  return "${data["type"] ?? "Others"} (${data["count"]})";
                },
                dataLabelSettings: const DataLabelSettings(
                  isVisible: true,
                  showZeroValue: false,
                  textStyle: TextStyle(
                    color: Colors.black87,
                    fontSize: 10.0,
                  ),
                  labelPosition: ChartDataLabelPosition.outside,
                  labelIntersectAction: LabelIntersectAction.shift,
                  connectorLineSettings:
                      ConnectorLineSettings(type: ConnectorType.curve),
                ),
                xValueMapper: (dynamic data, _) => data["type"] ?? "Others",
                yValueMapper: (dynamic data, _) => data["count"],
              )
            ],
          ),
        ],
      ),
    );
  }
}
