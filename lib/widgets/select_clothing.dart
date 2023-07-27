import 'package:drape/widgets/item_tile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:get/get.dart';

import '../model/item.dart';

class SelectClothing extends StatelessWidget {
  final List<Item> items;
  final String category;

  const SelectClothing(this.items, this.category, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(category),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: MasonryGridView.count(
          crossAxisCount: 3,
          itemCount: items.length,
          itemBuilder: (context, index) {
            return InkWell(
              onTap: () {
                Get.back(result: items[index]);
              },
              child: ItemTile(item: items[index]),
            );
          },
        ),
      ),
    );
  }
}
