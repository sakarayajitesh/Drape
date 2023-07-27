import 'package:drape/controllers/explore_controller.dart';
import 'package:drape/main.dart';
import 'package:drape/widgets/stats_tile.dart';
import 'package:drape/widgets/todays_outfit.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ExploreRoute extends StatelessWidget {
  const ExploreRoute({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(ExploreController(databaseProvider));

    return Scaffold(
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {},
        label: const Text("Outfit"),
        icon: const Icon(Icons.add),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Padding(
                padding: EdgeInsets.only(left: 8.0),
                child: Text(
                  "Hey there!",
                  style: TextStyle(fontSize: 24.0, color: Colors.black87),
                ),
              ),
              const SizedBox(
                height: 16.0,
              ),
              InkWell(
                onTap: controller.onClickTodaysOutfit,
                child: const TodaysOutfit(),
              ),
              const SizedBox(
                height: 16.0,
              ),
              const StatsTile()
            ],
          ),
        ),
      ),
    );
  }
}
