import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kindergarden/presentation/router/controller/on_tap_menu_item.dart';
import 'package:kindergarden/presentation/router/controller/router_controller.dart';
import 'package:kindergarden/presentation/router/ui/routes.dart';

import '../../app/ui/styles.dart';

class MyMenuItem extends GetView<RouterController> {
  final IconData icon;
  final String topic;
  final int? count;
  final MyRoute route;

  const MyMenuItem({
    super.key,
    required this.icon,
    required this.topic,
    this.count,
    required this.route,
  });

  @override
  Widget build(BuildContext context) {
    return Obx(
      () {
        final backgroundColor = route.name == controller.state.currentRoute.name
            ? MyColors.accentColor
            : Colors.transparent;

        return Container(
          decoration: BoxDecoration(
              color: backgroundColor,
              borderRadius: const BorderRadius.only(topRight: Radius.circular(35), bottomRight: Radius.circular(35))),
          child: ListTile(
            onTap: () => controller.onTapMenuItem(route, context),
            title: Text(topic, style: MyTextStyles.mediumSecondary),
            subtitle: Text(count != null ? 'Кількість: $count' : '',
                style: MyTextStyles.mediumSecondary),
            leading: Icon(
              icon,
              color: MyColors.textSecondary,
            ),
          ),
        );
      },
    );
  }
}
