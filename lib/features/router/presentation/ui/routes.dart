import 'package:flutter/material.dart';
import 'package:kindergarden/features/app/presentation/controller/app_controller.dart';
import 'package:kindergarden/features/app/presentation/ui/app_screen.dart';
import 'package:get/get.dart';
import 'package:get_it/get_it.dart';
import 'package:kindergarden/features/chefboard/presentation/ui/chefboard_screen.dart';
import 'package:kindergarden/features/login/presentation/controller/login_controller.dart';
import 'package:kindergarden/features/login/presentation/ui/login_screen.dart';

import '../../../chefboard/presentation/controller/chefboard_controller.dart';

final inject = GetIt.instance;
final routes = [
  Route(
    title: '',
    name: '/',
    page: () => const AppScreen(),
    binding: BindingsBuilder(() {
      Get.put<AppController>(AppController(inject(), inject()), permanent: true);
    }),
  ),
  Route(
    title: 'login',
    name: '/login',
    page: () => const LoginScreen(),
    binding: BindingsBuilder(() {
      Get.put<LoginController>(LoginController(inject(), inject()), permanent: true);
    }),
  ),
  Route(
    title: 'chefboard',
    name: '/chefboard',
    page: () => const ChefboardScreen(),
    binding: BindingsBuilder(() {
      Get.put<ChefboardController>(ChefboardController(inject(), inject()), permanent: true);
    }),
  ),
];

final appRoute = routes[0];
final loginRoute = routes[1];
final chefboardRoute = routes[2];

class Route extends GetPage {
  final IconData? icon;

  Route({required super.title, required super.name, required super.page, required super.binding, this.icon});
}
