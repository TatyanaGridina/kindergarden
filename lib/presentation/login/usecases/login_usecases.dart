import 'package:kindergarden/features/router/usecases/go_off_usecase.dart';
import 'package:kindergarden/features/state/usecases/get_state_usecase.dart';

class LoginUsecases {
  final GetStateUsecase getState;
  final GoOffUsecase goOff;

  LoginUsecases(this.getState, this.goOff);
}