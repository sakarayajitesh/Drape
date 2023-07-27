import 'dart:io';

import 'package:drape/controllers/todays_outfit_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TodaysOutfit extends StatelessWidget {
  const TodaysOutfit({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = TodaysOutfitController();
    return SizedBox(
      height: 150.0,
      child: Card(
        child: Padding(
          padding: const EdgeInsets.only(bottom: 16.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                flex: 2,
                child: Padding(
                  padding: const EdgeInsets.only(
                    left: 16.0,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        "Today's Outfit",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      MenuAnchor(
                        menuChildren: [
                          MenuItemButton(
                            onPressed: () {},
                            child: const Text("Show all"),
                          ),
                        ],
                        builder: (BuildContext context,
                            MenuController controller, Widget? child) {
                          return IconButton(
                            padding: EdgeInsets.zero,
                            icon: const Icon(Icons.more_vert),
                            onPressed: () {
                              if (controller.isOpen) {
                                controller.close();
                              } else {
                                controller.open();
                              }
                            },
                          );
                        },
                      ),
                    ],
                  ),
                ),
              ),
              Expanded(
                flex: 3,
                child: Obx(
                  () => controller.outfits.isNotEmpty
                      ? ListView.builder(
                          scrollDirection: Axis.horizontal,
                          shrinkWrap: true,
                          itemCount: controller.outfits.length,
                          itemBuilder: (context, index) {
                            double paddingLeft = 8.0;
                            double paddingRight = 0.0;
                            if (index == 0) {
                              paddingLeft = 16.0;
                            } else if (index == controller.outfits.length - 1) {
                              paddingRight = 16.0;
                            }
                            final outfit = controller.outfits[index];
                            return Padding(
                              padding: EdgeInsets.only(
                                left: paddingLeft,
                                right: paddingRight,
                              ),
                              child: Card(
                                margin: EdgeInsets.zero,
                                clipBehavior: Clip.antiAlias,
                                child: Image.file(
                                  File(outfit.image),
                                  fit: BoxFit.cover,
                                  width: 50.0,
                                ),
                              ),
                            );
                          },
                        )
                      : const Center(
                          child: Text(
                            "No outfits selected",
                            style: TextStyle(color: Colors.grey),
                          ),
                        ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
