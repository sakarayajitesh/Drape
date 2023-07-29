import 'package:drape/controllers/home_controller.dart';
import 'package:drape/routes/closet_route.dart';
import 'package:drape/routes/explore_route.dart';
import 'package:drape/routes/manage_route.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeRoute extends StatelessWidget {
  HomeRoute({Key? key}) : super(key: key);

  final destinations = [
    const ExploreRoute(),
    const ClosetRoute(),
    const ManageRoute(),
  ];

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(HomeController());
    return Scaffold(
      bottomNavigationBar: Obx(
        () => NavigationBar(
          onDestinationSelected: (value) {
            controller.selectedIndex.value = value;
          },
          selectedIndex: controller.selectedIndex.value,
          destinations: const <Widget>[
            NavigationDestination(
              selectedIcon: Icon(Icons.explore),
              icon: Icon(Icons.explore_outlined),
              label: 'Explore',
            ),
            NavigationDestination(
              selectedIcon: ImageIcon(AssetImage("assets/icons/closet_filled.png")),
              icon: ImageIcon(AssetImage("assets/icons/closet.png")),
              label: 'Closet',
            ),
            NavigationDestination(
              selectedIcon: ImageIcon(AssetImage("assets/icons/shirt_filled.png")),
              icon: ImageIcon(AssetImage("assets/icons/shirt.png")),
              label: 'Manage',
            ),
          ],
        ),
      ),
      body: Obx(() => destinations[controller.selectedIndex.value]),
    );
  }
}
