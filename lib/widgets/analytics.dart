import 'package:drape/controllers/analytics_controller.dart';
import 'package:drape/widgets/chart.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Analytics extends StatelessWidget {
  const Analytics({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(AnalyticsController());
    final cardWidth = MediaQuery.of(context).size.width / 3;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          "Analytics",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 16.0),
        SizedBox(
          height: 80.0,
          child: Obx(
            () => ListView.separated(
              scrollDirection: Axis.horizontal,
              itemCount: controller.dataEntries.length,
              itemBuilder: (context, index) {
                final map = controller.dataEntries[index];
                if (map.value.isNotEmpty) {
                  return SizedBox(
                    width: cardWidth,
                    child: Card(
                      margin: EdgeInsets.zero,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            map.key,
                            style: const TextStyle(
                              fontSize: 10.0,
                              color: Colors.black87,
                            ),
                          ),
                          Text(
                            map.value,
                            style: const TextStyle(
                              fontSize: 24.0,
                              fontWeight: FontWeight.bold,
                              letterSpacing: 1.0,
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                } else {
                  return const SizedBox();
                }
              },
              separatorBuilder: (context, index) {
                return const SizedBox(width: 8.0);
              },
            ),
          ),
        ),
        const SizedBox(height: 16.0),
        const Chart(),
      ],
    );
  }
}
