import 'package:hive/hive.dart';
import 'package:kindergarden/entities/garden.dart';
import 'package:kindergarden/state/state/garden_state.dart';

part 'garden_state_local.g.dart';

@HiveType(typeId: 2)
class GardenStateLocal extends HiveObject implements Garden {
  @override
  @HiveField(0)
  final String name;

  GardenStateLocal({
    required this.name,
  });

  factory GardenStateLocal.fromGardenState(GardenState state) {
    return GardenStateLocal(
      name: state.name,
    );
  }

  toGardenState() => GardenState(name: name);
}
