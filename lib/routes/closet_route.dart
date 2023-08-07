import 'package:drape/controllers/closet_controller.dart';
import 'package:drape/widgets/filter_chip_list.dart';
import 'package:drape/widgets/filter_layout.dart';
import 'package:drape/widgets/item_tile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:get/get.dart';

import '../model/item.dart';

class ClosetRoute extends StatelessWidget {
  const ClosetRoute({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(ClosetController());

    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
      floatingActionButton: Wrap(
        direction: Axis.vertical,
        crossAxisAlignment: WrapCrossAlignment.end,
        children: [
          Obx(() => controller.items.isNotEmpty
              ? FloatingActionButton.small(
                  heroTag: "fab1",
                  onPressed: () async {
                    await Get.dialog(const FilterLayout());
                  },
                  child: controller.hasFiltersApplied.value
                      ? const Badge(child: Icon(Icons.filter_alt))
                      : const Icon(Icons.filter_alt),
                )
              : const SizedBox()),
          const SizedBox(
            height: 16.0,
          ),
          Obx(
            () => Visibility.maintain(
              visible: controller.filteredItems.isNotEmpty &&
                  controller.isFabVisible.value,
              child: FloatingActionButton.extended(
                heroTag: "fab2",
                onPressed: controller.onClickAddClothing,
                label: const Text("Clothing"),
                icon: const Icon(Icons.add),
              ),
            ),
          ),
        ],
      ),
      body: SafeArea(
        child: Obx(
          () => controller.items.isNotEmpty
              ? Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    if (controller.hasFiltersApplied.value)
                      const Padding(
                        padding: EdgeInsets.all(12.0),
                        child: FilterChipList(),
                      ),
                    Expanded(
                      child: MasonryGridView.count(
                        controller: controller.scrollController,
                        itemCount: controller.filteredItems.length,
                        itemBuilder: (context, index) {
                          final Item item = controller.filteredItems[index];
                          return InkWell(
                            onTap: () {
                              controller.onItemSelected(item);
                            },
                            onDoubleTap: () {
                              controller.addToOutfit(item);
                            },
                            child: ItemTile(
                              item: item,
                            ),
                          );
                        },
                        crossAxisCount: 4,
                      ),
                    ),
                  ],
                )
              : _emptyState(controller),
        ),
      ),
    );
  }

  Widget _emptyState(controller) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text("Your closet appears to be empty!"),
          const SizedBox(height: 16.0),
          FloatingActionButton.extended(
            key: controller.coachMarksController.key2,
            heroTag: "fab2",
            onPressed: controller.onClickAddClothing,
            label: const Text("Clothing"),
            icon: const Icon(Icons.add),
          ),
        ],
      ),
    );
  }
}
