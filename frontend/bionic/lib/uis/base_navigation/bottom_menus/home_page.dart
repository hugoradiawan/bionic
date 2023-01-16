import 'package:bionic/ui_logics/navigasi_controller.dart';
import 'package:expandable_bottom_sheet/expandable_bottom_sheet.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(_) => GetBuilder<NavigasiController>(
        init: NavigasiController(),
        builder: (nc) => SingleChildScrollView(
          child: SizedBox(
            height: Get.height,
            width: Get.width,
            child: Scaffold(
              appBar: AppBar(
                  leading: IconButton(
                    icon: const Icon(Icons.arrow_back_ios),
                    onPressed: () {},
                  ),
                  title: Row(children: [
                    const CircleAvatar(child: Icon(Icons.person)),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8),
                      child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: const [
                            Text(
                              "Arif Yusuf",
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text(
                              "last seen",
                              style: TextStyle(
                                fontSize: 15,
                                color: Colors.grey,
                              ),
                            ),
                          ]),
                    )
                  ]),
                  actions: [
                    IconButton(
                      onPressed: () {},
                      icon: const Icon(Icons.phone),
                    ),
                    IconButton(
                      onPressed: () {},
                      icon: const Icon(Icons.menu),
                    )
                  ]),
              body: Stack(
                children: [
                  Container(color: Colors.amber),
                  const ExpandedMenuSheet(),
                ],
              ),
              bottomNavigationBar: BottomNavigationBar(
                onTap: nc.onTap,
                type: BottomNavigationBarType.fixed,
                currentIndex: nc.currentindex,
                selectedItemColor: Colors.orange,
                items: nc.tabs,
                backgroundColor: Get.theme.primaryColor,
              ),
            ),
          ),
        ),
      );
}

class ExpandedMenuSheet extends GetView<NavigasiController> {
  const ExpandedMenuSheet({super.key});

  @override
  Widget build(_) => ExpandableBottomSheet(
        key: controller.key,
        background: Container(color: Colors.white),
        persistentHeader: Container(
          height: 30,
          decoration: const BoxDecoration(
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                color: Colors.grey,
                offset: Offset(0.0, 1.0),
                blurRadius: 5.0,
              )
            ],
            border: Border(
              top: BorderSide(
                color: Colors.grey,
                width: 1,
              ),
            ),
          ),
          child: Center(
            child: Container(
              height: 10,
              width: 120,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30),
                color: Get.theme.primaryColor.withOpacity(0.6),
              ),
            ),
          ),
        ),
        expandableContent: SizedBox(
          height: Get.height * .6,
          child: TabBarView(
            controller: controller.tabController,
            children: controller.pages,
          ),
        ),
      );
}
