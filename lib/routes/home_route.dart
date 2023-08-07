import 'package:drape/controllers/home_controller.dart';
import 'package:drape/routes/closet_route.dart';
import 'package:drape/routes/explore_route.dart';
import 'package:drape/routes/laundry_route.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeRoute extends GetView<HomeController> {
  HomeRoute({Key? key}) : super(key: key);

  final destinations = [
    const ExploreRoute(),
    const ClosetRoute(),
    const LaundryRoute(),
  ];

  @override
  Widget build(BuildContext context) {
    controller.checkCoachMarks(context);
    return Scaffold(
      bottomNavigationBar: Obx(
        () => NavigationBar(
          onDestinationSelected: (value) {
            controller.selectedIndex.value = value;
          },
          selectedIndex: controller.selectedIndex.value,
          destinations: <Widget>[
            const NavigationDestination(
              selectedIcon: Icon(Icons.explore),
              icon: Icon(Icons.explore_outlined),
              label: 'Explore',
            ),
            NavigationDestination(
              key: controller.coachMarksController.key1,
              icon: const Icon(Icons.commute),
              label: 'Closet',
            ),
            const NavigationDestination(
              selectedIcon: Icon(Icons.local_laundry_service),
              icon: Icon(Icons.local_laundry_service_outlined),
              label: 'Laundry',
            ),
          ],
        ),
      ),
      body: Obx(() => destinations[controller.selectedIndex.value]),
    );
  }
}
