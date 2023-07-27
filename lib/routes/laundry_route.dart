import 'package:drape/controllers/laundry_controller.dart';
import 'package:drape/widgets/image_tile.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LaundryRoute extends StatelessWidget {
  const LaundryRoute({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = LaundryController();
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "Hanger",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16.0,
                      ),
                    ),
                    const Divider(),
                    const SizedBox(
                      height: 16.0,
                    ),
                    Obx(
                      () => controller.hangerList.isNotEmpty
                          ? Wrap(
                              spacing: 8.0,
                              runSpacing: 8.0,
                              children: controller.hangerList
                                  .map(
                                    (element) => SizedBox(
                                      height: 100.0,
                                      child: ImageTile(image: element.image),
                                    ),
                                  )
                                  .toList(),
                            )
                          : const SizedBox(
                              height: 100,
                              child: Center(
                                child: Text("No items here"),
                              ),
                            ),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 16.0,
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "Basket",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16.0,
                      ),
                    ),
                    const Divider(),
                    const SizedBox(
                      height: 16.0,
                    ),
                    Obx(
                      () => controller.basketList.isNotEmpty
                          ? Wrap(
                              spacing: 8.0,
                              runSpacing: 8.0,
                              children: controller.basketList
                                  .map(
                                    (element) => SizedBox(
                                      height: 100.0,
                                      child: ImageTile(image: element.image),
                                    ),
                                  )
                                  .toList(),
                            )
                          : const SizedBox(
                              height: 100,
                              child: Center(
                                child: Text("No items here"),
                              ),
                            ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
