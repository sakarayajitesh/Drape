import 'package:drape/widgets/image_tile.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/outfit_controller.dart';

class OutfitRoute extends StatelessWidget {
  const OutfitRoute({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(OutfitController());
    return Scaffold(
      appBar: AppBar(title: const Text('Outfits'), centerTitle: true),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Obx(
          () => ListView.separated(
            itemBuilder: (BuildContext context, int index) {
              final outfitMap = controller.outfitMap.entries
                  .toList()
                  .reversed
                  .toList()[index];
              return Card(
                margin: EdgeInsets.zero,
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 16.0),
                        child: Text(
                          outfitMap.key,
                          style: const TextStyle(
                            fontSize: 16.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      const SizedBox(height: 16.0),
                      SizedBox(
                        height: 80.0,
                        child: ListView.builder(
                            shrinkWrap: true,
                            scrollDirection: Axis.horizontal,
                            itemCount: outfitMap.value.length,
                            itemBuilder:
                                (BuildContext context, int index) {
                              final outfit = outfitMap.value[index];
                              double paddingLeft = 8.0;
                              double paddingRight = 0.0;
                              if (index == 0) {
                                paddingLeft = 16.0;
                              } else if (index ==
                                  outfitMap.value.length - 1) {
                                paddingRight = 16.0;
                              }
                              return Padding(
                                padding: EdgeInsets.only(
                                  left: paddingLeft,
                                  right: paddingRight,
                                ),
                                child: ImageTile(image: outfit.image),
                              );
                            }),
                      ),
                    ],
                  ),
                ),
              );
            },
            separatorBuilder: (BuildContext context, int index) {
              return const SizedBox(
                height: 8.0,
              );
            },
            itemCount: controller.outfitMap.entries.length,
          ),
        ),
      ),
    );
  }
}
