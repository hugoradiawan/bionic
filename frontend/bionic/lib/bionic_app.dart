import 'package:bionic/uis/base_navigation/bottom_menus/home_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BionicApp extends StatelessWidget {
  const BionicApp({super.key});

  @override
  Widget build(_) => GetMaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(primarySwatch: Colors.lightGreen),
        home: const HomePage(),
      );
}