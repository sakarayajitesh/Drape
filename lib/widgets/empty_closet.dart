import 'package:flutter/material.dart';

class EmptyCloset extends StatelessWidget {
  const EmptyCloset({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "Get Started",
            style: Theme.of(context).textTheme.titleLarge,
          ),
          const SizedBox(
            height: 4.0,
          ),
          const Text(
            "Start adding clothes here.",
          ),
        ],
      ),
    );
  }
}
