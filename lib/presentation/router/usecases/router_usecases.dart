import 'package:kindergarden/features/router/usecases/go_off_usecase.dart';
import 'package:kindergarden/features/state/usecases/get_state_usecase.dart';
import 'package:kindergarden/features/state/usecases/set_router_state_usecase.dart';

class RouterUsecases {
  final SetRouterStateUsecase setState;

  RouterUsecases(this.setState);
}