import 'package:flutter/material.dart';
import 'package:kindergarden/features/app/presentation/controller/app_controller.dart';
import 'package:kindergarden/features/app/presentation/ui/app_screen.dart';
import 'package:get/get.dart';
import 'package:get_it/get_it.dart';
import 'package:kindergarden/features/auth/presentation/controller/login_controller.dart';
import 'package:kindergarden/features/auth/presentation/ui/login_screen.dart';

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
];

final appRoute = routes[0];
final loginRoute = routes[1];

class Route extends GetPage {
  final IconData? icon;

  Route({required super.title, required super.name, required super.page, required super.binding, this.icon});
}
