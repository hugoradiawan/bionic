import 'package:flutter/material.dart';

class DokumentPage extends StatelessWidget {
  const DokumentPage({super.key});

  @override
  Widget build(_) => ListView(children: [
        const ListTile(
          leading: CircleAvatar(child: Icon(Icons.storage)),
          title: Text('internal Storage'),
          subtitle: Text('Cari sistem data anda'),
        ),
        const Divider(),
        const ListTile(
          leading: CircleAvatar(child: Icon(Icons.storage)),
          title: Text('Gallery'),
          subtitle: Text('Kirim gambar tanpa kompresi'),
        ),
        const Divider(),
        const Padding(
          padding: EdgeInsets.all(8.0),
          child: Text('Latest File'),
        ),
        for (int i = 0; i < 20; i++)
          ListTile(
            leading: Container(
              color: Colors.grey,
              height: 50,
              width: 50,
            ),
            title: const Text('Name Of title.file'),
            subtitle: const Text('88,1 mb'),
          ),
      ]);
}
