import 'package:bionic/uis/base_navigation/bottom_menus/search_page/search_tile.dart';
import 'package:flutter/material.dart';

class SearchPage extends StatelessWidget {
  const SearchPage({
    required this.label,
    super.key,
  });

  final String label;

  @override
  Widget build(_) => Column(children: [
        Expanded(
          child: SearchTile((val) {}, label: label),
        ),
        Expanded(
          flex: 9,
          child: ListView(children: [
            if (label == "Contact")
              for (int i = 0; i < 20; i++)
                const ListTile(
                  leading: CircleAvatar(child: Icon(Icons.person)),
                  title: Text("Hugo Radiawan"),
                  subtitle: Text('Test 123'),
                )
            else
              for (int i = 0; i < 20; i++)
                const ListTile(
                  leading: CircleAvatar(child: Icon(Icons.play_arrow)),
                  title: Text("Name of File audio"),
                  subtitle: Text('Description of audio file'),
                )
          ]),
        ),
      ]);
}
