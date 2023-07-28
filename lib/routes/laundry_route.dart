import 'package:drape/controllers/laundry_controller.dart';
import 'package:drape/controllers/laundry_list_view_controller.dart';
import 'package:drape/widgets/image_tile.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LaundryRoute extends GetView<LaundryController> {
  const LaundryRoute({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    controller.fetchData();
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            TabBar.secondary(
              controller: controller.tabController,
              tabs: [
                Obx(() => LaundryTabOption(
                      title: 'Fresh',
                      count: controller.freshList.length,
                    )),
                Obx(() => LaundryTabOption(
                      title: 'Hanger',
                      count: controller.hangerList.length,
                    )),
                Obx(() => LaundryTabOption(
                      title: 'Basket',
                      count: controller.basketList.length,
                    )),
              ],
            ),
            const SizedBox(height: 16.0),
            Expanded(
              child: TabBarView(
                controller: controller.tabController,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    child: LaundryListView(list: controller.freshList),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    child: LaundryListView(list: controller.hangerList),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    child: controller.basketList.isNotEmpty ? Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        LaundryListView(list: controller.basketList),
                        Padding(
                          padding: const EdgeInsets.only(bottom: 16.0),
                          child: SizedBox(
                            height: 50.0,
                            width: double.infinity,
                            child: FilledButton(
                              onPressed: () {},
                              child: const Text('Wash'),
                            ),
                          ),
                        ),
                      ],
                    ) : LaundryListView(list: controller.basketList),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class LaundryTabOption extends StatelessWidget {
  final String title;
  final int count;

  const LaundryTabOption({super.key, required this.title, required this.count});

  @override
  Widget build(BuildContext context) {
    return Tab(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(title),
          const SizedBox(width: 8.0),
          CircleAvatar(
            radius: 12.0,
            child: Center(
              child: Text(
                count.toString(),
                style: const TextStyle(fontSize: 12.0),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class LaundryListView extends GetView<LaundryListViewController>   {
  final List list;

  const LaundryListView({super.key, required this.list});

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => list.isNotEmpty
          ? Wrap(
              spacing: controller.rowSpacing,
              runSpacing: 8.0,
              children: list
                  .map(
                    (element) => SizedBox(
                      width: controller.width,
                      child: ImageTile(image: element.image),
                    ),
                  )
                  .toList(),
            )
          : const SizedBox(
              height: 100,
              child: Center(child: Text("No items here")),
            ),
    );
  }
}
