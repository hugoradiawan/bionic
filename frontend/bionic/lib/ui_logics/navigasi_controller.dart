import 'package:bionic/uis/base_navigation/bottom_menus/dokument_page.dart';
import 'package:bionic/uis/base_navigation/bottom_menus/gallery_page.dart';
import 'package:bionic/uis/base_navigation/bottom_menus/map_page.dart';
import 'package:bionic/uis/base_navigation/bottom_menus/notif_page.dart';
import 'package:bionic/uis/base_navigation/bottom_menus/search_page/search_page.dart';
import 'package:bionic/ui_logics/nav_item.dart';
import 'package:bionic/business_logics/location_tracker_controller.dart';
import 'package:expandable_bottom_sheet/expandable_bottom_sheet.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class NavigasiController extends GetxController
    with GetTickerProviderStateMixin {
  final List<NavItem> navDataList = [
    const NavItem(Icons.photo, "Gallery", GalleryPage()),
    const NavItem(Icons.pages, "Document", DokumentPage()),
    const NavItem(Icons.pin_drop, "Location", MapPage()),
    const NavItem(
      Icons.person,
      "Contact",
      SearchPage(
        label: "Contact",
      ),
    ),
    const NavItem(
      Icons.play_arrow,
      "Audio",
      SearchPage(
        label: "Audio",
      ),
    ),
    const NavItem(
      Icons.text_snippet_outlined,
      "Notif",
      NotifPage(),
    ),
  ];
  GlobalKey<ExpandableBottomSheetState> key = GlobalKey();
  late TabController tabController;
  int currentindex = 0;

  @override
  void onInit() {
    tabController = TabController(length: navDataList.length, vsync: this);
    super.onInit();
  }

  @override
  void dispose() {
    tabController.dispose();
    super.dispose();
  }

  Future<void> onTap(int index) async {
    if (index == 2) {
      if (Get.find<LocationTracker>().position.value == null) {
        Get.find<LocationTracker>().determinePosition();
      }
    }
    tabController.animateTo(index);
    key.currentState?.expand();
    currentindex = index;
    update();
  }

  List<Widget> get pages => navDataList.map((e) => e.screen).toList();

  List<BottomNavigationBarItem> get tabs => navDataList
      .map((e) => BottomNavigationBarItem(
            icon: Icon(e.icon),
            label: e.label,
          ))
      .toList();
}
