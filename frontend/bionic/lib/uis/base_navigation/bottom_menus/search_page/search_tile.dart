import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SearchTile extends StatelessWidget {
  const SearchTile(this.onChanged, {Key? key, required this.label})
      : super(key: key);

  final void Function(String) onChanged;
  final String label;

  @override
  Widget build(_) => Container(
        margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30),
          color: Get.theme.primaryColor,
        ),
        child: Row(children: [
          const Expanded(
            flex: 2,
            child: Icon(Icons.search),
          ),
          Expanded(
            flex: 9,
            child: TextField(
              decoration: InputDecoration(
                border: InputBorder.none,
                hintText: "Search $label",
              ),
              onChanged: onChanged,
            ),
          ),
        ]),
      );
}
