import 'package:drape/main.dart';
import 'package:get/get.dart';

class AnalyticsController extends GetxController {
  final data = <String, String>{
    "Clothes": "",
    "Spent": "",
  }.obs;

  final chartData = <dynamic>[
    // {"count": 24, "type": null},
    // {"count": 1, "type": "Shirt"},
    // {"count": 1, "type": "T-Shirt"}
  ].obs;

  final chartOptions = <String, String>{
    "type": "By Type",
    "occasion": "By Occasion"
  };

  late RxString chartOptionSelected = "type".obs;

  List<MapEntry<String, String>> get dataEntries => data.entries.toList();

  AnalyticsController() {
    calculateData();
  }

  calculateData() async {
    final countFuture = databaseProvider.itemExecutor.query(
      columns: ["count(*) as count"],
    );
    final spentFuture = databaseProvider.itemExecutor.query(
      columns: ["sum(price) as spent"],
    );
    final chartDataFuture = databaseProvider.itemExecutor.query(
      columns: ["count(*) as count, ${chartOptionSelected.value} as type"],
      groupBy: chartOptionSelected.value,
    );
    await Future.wait([countFuture, spentFuture, chartDataFuture])
        .then((results) {
      data["Clothes"] = results[0].first["count"].toString();
      data["Spent"] =
          (results[0].first["count"] != 0 ? results[1].first["spent"] : 0)
              .toString();
      chartData.value = results[2];
    });
  }

  _getChart() async {
    databaseProvider.itemExecutor.query(
      columns: ["count(*) as count, ${chartOptionSelected.value} as type"],
      groupBy: chartOptionSelected.value,
    ).then((result) {
      chartData.value = result;
    });
  }

  onChartOptionSelectedChange(String selection) {
    chartOptionSelected.value = selection;
    _getChart();
  }
}
