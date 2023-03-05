import 'package:flutter/material.dart';
import 'package:kindergarden/presentation/router/controller/router_controller.dart';
import 'package:kindergarden/presentation/router/ui/routes.dart';

extension OnTapMenuItem on RouterController {
  onTapMenuItem(MyRoute route, BuildContext context) {
    Scaffold.of(context).closeDrawer();
    usecases.goTo(route: route);
  }
}
