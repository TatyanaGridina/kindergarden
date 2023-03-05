import 'package:kindergarden/usecases/router/go_to_usecase.dart';
import 'package:kindergarden/usecases/state/set_router_state_usecase.dart';

class RouterUsecases {
  final SetRouterStateUsecase setState;
  final GoToUsecase goTo;

  RouterUsecases(this.setState, this.goTo);
}