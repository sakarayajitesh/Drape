import 'package:drape/controllers/detail_controller.dart';
import 'package:drape/main.dart';
import 'package:drape/widgets/image_tile.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../helpers/store.dart';

class ItemDetail extends StatelessWidget {
  ItemDetail({Key? key}) : super(key: key);

  final DetailController controller = Get.put(
    DetailController(databaseProvider),
  );

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        actions: [
          PopupMenuButton(
            onSelected: (value) {
              if (value == "outfit") {
                controller.addToOutfit();
              } else if (value == "laundry") {
                controller.addToLaundry();
              }
            },
            itemBuilder: (context) => <PopupMenuEntry>[
              const PopupMenuItem(
                value: "laundry",
                child: Text('Add to laundry'),
              ),
              const PopupMenuItem(
                value: "outfit",
                child: Text('Add to outfit'),
              ),
              const PopupMenuItem(
                value: "delete",
                child: Text('Delete'),
              ),
            ],
          )
        ],
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(
            16.0,
          ),
          child: Column(
            children: [
              Expanded(
                child: Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      SizedBox(
                        height: MediaQuery.of(context).size.height / 3,
                        child: ImageTile(image: controller.item.image),
                      ),
                      const SizedBox(height: 16.0),
                      TextFormField(
                        initialValue: controller.item.name,
                        onSaved: (value) {
                          if (value != null) {
                            controller.item.name = value;
                          }
                        },
                        decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: 'Name',
                        ),
                      ),
                      const SizedBox(height: 16.0),
                      Row(
                        children: [
                          Expanded(
                            child: DropdownButtonFormField<String>(
                              value: controller.item.type,
                              onSaved: (value) {
                                controller.item.type = value;
                              },
                              decoration: const InputDecoration(
                                border: OutlineInputBorder(),
                                labelText: 'Type',
                              ),
                              onChanged: (e) {},
                              items: Store.typeList.map((value) {
                                return DropdownMenuItem(
                                  value: value,
                                  child: Text(value),
                                );
                              }).toList(),
                            ),
                          ),
                          const SizedBox(
                            width: 16.0,
                          ),
                          Expanded(
                            child: DropdownButtonFormField<String>(
                              value: controller.item.occasion,
                              onSaved: (value) {
                                controller.item.occasion = value;
                              },
                              decoration: const InputDecoration(
                                border: OutlineInputBorder(),
                                labelText: 'Occasion',
                              ),
                              onChanged: (e) {},
                              items: Store.occasionList.map((value) {
                                return DropdownMenuItem(
                                  value: value,
                                  child: Text(value),
                                );
                              }).toList(),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 16.0,
                      ),
                      TextFormField(
                        initialValue: controller.item.color,
                        onSaved: (value) {
                          controller.item.color = value;
                        },
                        decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: 'Color',
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                width: double.infinity,
                height: 44.0,
                child: ElevatedButton(
                  onPressed: () {
                    _formKey.currentState?.save();
                    controller.onClickSave();
                  },
                  child: const Text("Save"),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
