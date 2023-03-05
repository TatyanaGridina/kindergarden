import 'package:kindergarden/usecases/router/go_back_usecase.dart';
import 'package:kindergarden/usecases/router/go_to_usecase.dart';

class TeachersUsecases {
  final GoToUsecase goTo;
  final GoBackUsecase goBack;

  TeachersUsecases(
      this.goTo,
      this.goBack
  );
}
