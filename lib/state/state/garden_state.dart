import 'package:kindergarden/entities/garden.dart';

class GardenState implements Garden {
  @override
  final String name;

  GardenState({
    this.name = '',
  });

  GardenState copyWith({
    String? name,
  }) =>
      GardenState(
        name: name ?? this.name,
      );
}
