import 'package:drape/controllers/closet_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class FilterChipList extends StatelessWidget {
  const FilterChipList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ClosetController controller = Get.find();
    return Obx(
      () => Wrap(
        spacing: 8.0,
        children: controller.appliedFilters.entries
            .expand(
              (element) => element.value.map(
                (e) => InputChip(
                  label: Text(e),
                  labelStyle: const TextStyle(fontSize: 12.0),
                  onDeleted: () {
                    controller.appliedFilters[element.key]!.remove(e);
                    controller.appliedFilters.refresh();
                  },
                ),
              ),
            )
            .toList(),
      ),
    );
  }
}
