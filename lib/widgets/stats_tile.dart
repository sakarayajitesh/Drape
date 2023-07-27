import 'package:drape/main.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/stats_controller.dart';

class StatsTile extends StatelessWidget {
  const StatsTile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(StatsController(databaseProvider));
    return Obx(
      () => controller.stats.isNotEmpty
          ? SizedBox(
              width: double.infinity,
              child: Card(
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Row(
                    children: controller.stats.map((element) {
                      return Expanded(
                        child: Column(
                          children: [
                            Text(
                              "${element["count(type)"]}",
                              style: Theme.of(context).textTheme.titleLarge,
                            ),
                            Text(
                              element["type"] as String,
                              style: Theme.of(context).textTheme.bodySmall,
                            ),
                          ],
                        ),
                      );
                    }).toList(),
                  ),
                ),
              ),
            )
          : const SizedBox(),
    );
  }
}
