import 'package:drape/controllers/filter_layout_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class FilterLayout extends StatelessWidget {
  const FilterLayout({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = FilterLayoutController();
    return Dialog.fullscreen(
      child: Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: const Icon(
              Icons.close,
            ),
            onPressed: controller.onClickClose,
          ),
          title: const Text(
            "Filters",
          ),
          actions: [
            TextButton(
              onPressed: controller.onClickClear,
              child: const Text(
                'Clear',
              ),
            ),
          ],
        ),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              Expanded(
                child: ListView.separated(
                  itemCount: controller.filters.entries.length,
                  itemBuilder: (context, index) {
                    final entry = controller.filters.entries.toList()[index];
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          entry.key.toUpperCase(),
                          style: const TextStyle(
                            fontSize: 16.0,
                          ),
                        ),
                        const SizedBox(
                          height: 12.0,
                        ),
                        Wrap(
                          spacing: 8.0,
                          // runSpacing: 8.0,
                          children: entry.value
                              .map(
                                (e) => Obx(
                                  () => FilterChip(
                                    label: Text(e),
                                    selected:
                                        controller.isSelected(entry.key, e),
                                    onSelected: (bool value) {
                                      controller.onSelected(
                                          entry.key, e, value);
                                    },
                                  ),
                                ),
                              )
                              .toList(),
                        )
                      ],
                    );
                  },
                  separatorBuilder: (context, index) {
                    if (index < controller.filters.entries.length - 1) {
                      return const Column(
                        children: [
                          SizedBox(
                            height: 8.0,
                          ),
                          Divider(),
                          SizedBox(
                            height: 8.0,
                          ),
                        ],
                      );
                    } else {
                      return const SizedBox();
                    }
                  },
                ),
              ),
              SizedBox(
                width: double.infinity,
                height: 50.0,
                child: ElevatedButton(
                  onPressed: controller.onClickApply,
                  child: const Text("Apply"),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
