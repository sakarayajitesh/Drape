import 'dart:io';

import 'package:flutter/material.dart';

import '../helpers.dart';
import '../model/item.dart';

class ItemTile extends StatelessWidget {
  final Item item;

  const ItemTile({
    Key? key,
    required this.item,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    precacheImage(FileImage(File(item.image)), context);
    return Hero(
      tag: item.image,
      child: Card(
        // elevation: 0.0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(myCardCorner),
        ),
        margin: const EdgeInsets.all(2.0),
        clipBehavior: Clip.antiAlias,
        child: IntrinsicHeight(
          child: Stack(
            alignment: Alignment.bottomCenter,
            children: [
              SizedBox(
                child: FadeInImage(
                  placeholder: const AssetImage('assets/placeholder.png'),
                  image: FileImage(File(item.image)),
                  fit: BoxFit.cover,
                ),
              ),
              Container(
                height: 60.0,
                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.bottomRight,
                    colors: [Colors.black54, Colors.transparent],
                  ),
                ),
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    item.name,
                    style: const TextStyle(
                      color: Colors.white,
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
