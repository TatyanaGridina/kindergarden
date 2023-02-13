import 'package:kindergarden/usecases/router/go_off_usecase.dart';
import 'package:kindergarden/usecases/state/get_state_usecase.dart';

class AppUsecases {
  final GetStateUsecase getState;
  final GoOffUsecase goOff;

  AppUsecases(this.getState, this.goOff);
}