import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';
import 'package:kindergarden/presentation/groups/controller/go_to_new_group.dart';
import 'package:kindergarden/presentation/router/ui/drawer.dart';
import '../../app/ui/styles.dart';
import '../../app/ui/widgets/my_floating_action_button.dart';
import '../controller/groups_controller.dart';

class GroupsScreen extends GetView<GroupsController> {
  GroupsScreen({Key? key}) : super(key: key);

  final groups = [
    {'name': 'Альфа', 'category': 'Молодша', 'image': '1'},
    {'name': 'Бета', 'category': 'Молодша', 'image': '2'},
    {'name': 'Альфа', 'category': 'Середня', 'image': '3'},
    {'name': 'Бета', 'category': 'Середня', 'image': '4'},
    {'name': 'Альфа', 'category': 'Старша', 'image': '5'},
    {'name': 'Бета', 'category': 'Старша', 'image': '6'},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const MainDrawer(),
      appBar: AppBar(
        title: const Text('ГРУПИ'),
        centerTitle: true,
        flexibleSpace: Container(
          decoration: const BoxDecoration(
              color: MyColors.primaryColor
          ),
        ),
      ),
      floatingActionButton: MyFloatingActionButton(icon: Icons.add, onPressed: controller.goToNewGroup),
      body: ListView.separated(
        separatorBuilder: (BuildContext context, int index) => const Divider(
            indent: 80,
            ),
        itemBuilder: (BuildContext context, int index) => ListTile(
          key: UniqueKey(),
          title: Text(groups[index]['name'] ?? '', style: MyTextStyles.largePrimaryBold),
          subtitle:
          Text(groups[index]['category'] ?? '', style: MyTextStyles.largePrimary),
          leading: Container(
            height: 50,
            width: 50,
             child: Image(image: AssetImage(
                'lib/presentation/app/ui/assets/sun${groups[index]['image']}.png'),),
          ),
          trailing:
          const Icon(Icons.keyboard_arrow_right, color: MyColors.accentColor),
        ),
        itemCount: groups.length,
      ),
    );
  }
}


