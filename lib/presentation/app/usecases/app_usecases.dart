import 'package:kindergarden/features/router/usecases/go_off_action.dart';
import 'package:kindergarden/features/state/usecases/get_state_usecase.dart';

class AppUsecases {
  final GetStateUsecase getState;
  final GoOffUsecase goOff;

  AppUsecases(this.getState, this.goOff);
}