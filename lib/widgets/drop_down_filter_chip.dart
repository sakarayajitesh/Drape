import 'package:flutter/material.dart';

class DropDownFilterChip extends StatefulWidget {
  final List<String> menuList;
  final String hint;
  final Function(String? value) onSelected;

  const DropDownFilterChip({
    Key? key,
    required this.menuList,
    required this.hint,
    required this.onSelected,
  }) : super(key: key);

  @override
  State<DropDownFilterChip> createState() => _DropDownFilterChipState();
}

class _DropDownFilterChipState extends State<DropDownFilterChip> {
  var _selected = "";

  @override
  Widget build(BuildContext context) {
    return MenuAnchor(
      builder: (context, menuController, child) {
        return RawChip(
          deleteIcon: const Icon(
            Icons.arrow_drop_down_sharp,
          ),
          onDeleted: () {
            if (menuController.isOpen) {
              menuController.close();
            } else {
              menuController.open();
            }
          },
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8.0),
          ),
          label: Text(_selected.isEmpty ? widget.hint : _selected),
          selected: _selected.isNotEmpty,
          onSelected: (value) {
            if (menuController.isOpen) {
              menuController.close();
            } else {
              menuController.open();
            }
          },
        );
      },
      menuChildren: widget.menuList
          .map((e) => MenuItemButton(
                style: MenuItemButton.styleFrom(
                  backgroundColor: _selected == e ? Colors.black12 : null,
                ),
                child: SizedBox(
                  width: 80.0,
                  child: Text(e),
                ),
                onPressed: () {
                  if (_selected == e) {
                    _selected = "";
                    widget.onSelected(null);
                  } else {
                    _selected = e;
                    widget.onSelected(e);
                  }
                  setState(() {});
                },
              ))
          .toList(),
    );
  }
}
