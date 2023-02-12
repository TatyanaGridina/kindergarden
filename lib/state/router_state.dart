import 'package:kindergarden/presentation/router/ui/routes.dart';
import 'package:get/get.dart';

class RouterState {
  final GetPage currentRoute;
  final int currentRouteIndex;

  RouterState({GetPage? currentRoute, int? currentRouteIndex})
      : currentRoute = currentRoute ?? routes[0],
        currentRouteIndex = currentRouteIndex ?? 0;

  RouterState copyWith({GetPage? currentRoute, int? currentRouteIndex}) => RouterState(
        currentRoute: currentRoute ?? this.currentRoute,
        currentRouteIndex: currentRouteIndex ?? this.currentRouteIndex,
      );
}
