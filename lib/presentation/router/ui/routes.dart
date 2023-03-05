import 'package:flutter/material.dart';
import 'package:kindergarden/presentation/app/controller/app_controller.dart';
import 'package:kindergarden/presentation/app/ui/app_screen.dart';
import 'package:get/get.dart';
import 'package:get_it/get_it.dart';
import 'package:kindergarden/presentation/groups/controller/groups_controller.dart';
import 'package:kindergarden/presentation/groups/ui/groups_screen.dart';
import 'package:kindergarden/presentation/kids/controller/kids_controller.dart';
import 'package:kindergarden/presentation/kids/ui/kids_screen.dart';
import 'package:kindergarden/presentation/login/controller/login_controller.dart';
import 'package:kindergarden/presentation/login/ui/login_screen.dart';
import 'package:kindergarden/presentation/parents/controller/parents_controller.dart';
import 'package:kindergarden/presentation/parents/ui/parents_screen.dart';
import 'package:kindergarden/presentation/reports/controller/reports_controller.dart';
import 'package:kindergarden/presentation/reports/ui/reports_screen.dart';
import 'package:kindergarden/presentation/teachers/controller/teachers_controller.dart';
import 'package:kindergarden/presentation/teachers/ui/new_teacher_screen.dart';
import 'package:kindergarden/presentation/teachers/ui/teachers_screen.dart';

import '../../groups/ui/new_group_screen.dart';
import '../../kids/ui/new_kid_screen.dart';
import '../../parents/ui/new_parent_screen.dart';

final inject = GetIt.instance;
final routes = [
  MyRoute(
    title: '',
    name: '/',
    page: () => const AppScreen(),
    binding: BindingsBuilder(() {
      Get.put<AppController>(AppController(inject(), inject()), permanent: true);
    }),
  ),
  MyRoute(
    title: 'login',
    name: '/login',
    page: () => const LoginScreen(),
    binding: BindingsBuilder(() {
      Get.put<LoginController>(LoginController(inject(), inject()), permanent: true);
    }),
  ),
  MyRoute(
    title: 'reports',
    name: '/reports',
    page: () => const ReportsScreen(),
    binding: BindingsBuilder(() {
      Get.put<ReportsController>(ReportsController(inject(), inject()), permanent: true);
    }),
  ),
  MyRoute(
    title: 'teachers',
    name: '/teachers',
    page: () => const TeachersScreen(),
    binding: BindingsBuilder(() {
      Get.put<TeachersController>(TeachersController(inject(), inject()), permanent: true);
    }),
  ),
  MyRoute(
    title: 'parents',
    name: '/parents',
    page: () => const ParentsScreen(),
    binding: BindingsBuilder(() {
      Get.put<ParentsController>(ParentsController(inject(), inject()), permanent: true);
    }),
  ),
  MyRoute(
    title: 'kids',
    name: '/kids',
    page: () => const KidsScreen(),
    binding: BindingsBuilder(() {
      Get.put<KidsController>(KidsController(inject(), inject()), permanent: true);
    }),
  ),
  MyRoute(
    title: 'groups',
    name: '/groups',
    page: () => GroupsScreen(),
    binding: BindingsBuilder(() {
      Get.put<GroupsController>(GroupsController(inject(), inject()), permanent: true);
    }),
  ),
  MyRoute(
    title: 'new teacher',
    name: '/teachers/new-teacher',
    page: () => const NewTeacherScreen(),
    binding: BindingsBuilder(() {
      Get.put<TeachersController>(TeachersController(inject(), inject()), permanent: true);
    }),
  ),
  MyRoute(
    title: 'new parent',
    name: '/teachers/new-parent',
    page: () => const NewParentScreen(),
    binding: BindingsBuilder(() {
      Get.put<ParentsController>(ParentsController(inject(), inject()), permanent: true);
    }),
  ),
  MyRoute(
    title: 'new kid',
    name: '/teachers/new-kid',
    page: () => const NewKidScreen(),
    binding: BindingsBuilder(() {
      Get.put<KidsController>(KidsController(inject(), inject()), permanent: true);
    }),
  ),
  MyRoute(
    title: 'new group',
    name: '/teachers/new-group',
    page: () => const NewGroupScreen(),
    binding: BindingsBuilder(() {
      Get.put<GroupsController>(GroupsController(inject(), inject()), permanent: true);
    }),
  ),
];

final appRoute = routes[0];
final loginRoute = routes[1];
final reportsRoute = routes[2];
final teachersRoute = routes[3];
final parentsRoute = routes[4];
final kidsRoute = routes[5];
final groupsRoute = routes[6];
final newTeacherRoute = routes[7];
final newParentRoute = routes[8];
final newKidRoute = routes[9];
final newGroupScreen = routes[10];

class MyRoute extends GetPage {
  final IconData? icon;

  MyRoute({required super.title, required super.name, required super.page, required super.binding, this.icon});
}
