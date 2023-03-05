import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kindergarden/presentation/app/ui/styles.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:kindergarden/presentation/router/controller/router_controller.dart';
import 'package:kindergarden/presentation/router/ui/menu_item.dart';
import 'package:kindergarden/presentation/router/ui/routes.dart';

class MainDrawer extends GetView<RouterController> {
  const MainDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
        backgroundColor: MyColors.primaryColor,
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.horizontal(right: Radius.circular(35))),
        child: ListView(
          children: [
            const UserAccountsDrawerHeader(
              decoration: BoxDecoration(
                  image: DecorationImage(
                      fit: BoxFit.scaleDown,
                      image: AssetImage(
                          'lib/presentation/app/ui/assets/mainImage.png')),
                  color: MyColors.backgroundPrimary,
                  borderRadius:
                      BorderRadius.only(topRight: Radius.circular(35))),
              accountName: null,
              accountEmail: null,
            ),
            MyMenuItem(
                icon:
                MaterialCommunityIcons.image_multiple,
                topic: "ЗВІТ",
                route: groupsRoute),
            MyMenuItem(
                icon: MaterialCommunityIcons.school,
                topic: "ВИХОВАТЕЛІ",
                count: 5,
                route: teachersRoute),
            MyMenuItem(
                icon: Icons.family_restroom,
                topic: "БАТЬКИ",
                count: 5,
                route: parentsRoute),
            MyMenuItem(
                icon: Icons.face_retouching_natural,
                topic: "ДІТИ",
                count: 5,
                route: kidsRoute),
            MyMenuItem(
                icon: MaterialCommunityIcons.account_group,
                topic: "ГРУПИ",
                count: 5,
                route: groupsRoute),
            MyMenuItem(
                icon: Icons.schedule,
                topic: "РОЗКЛАД",
                route: groupsRoute),
            MyMenuItem(
                icon: MaterialCommunityIcons.food_apple,
                topic: "МЕНЮ",
                route: groupsRoute),
            MyMenuItem(
                icon: MaterialCommunityIcons.cake_variant,
                topic: "ДНІ НАРОДЖЕННЯ",
                route: groupsRoute),
          ],
        ));
  }
}
