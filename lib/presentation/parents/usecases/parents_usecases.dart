import 'package:kindergarden/usecases/router/go_to_usecase.dart';
import '../../../usecases/router/go_back_usecase.dart';

class ParentsUsecases {
  final GoToUsecase goTo;
  final GoBackUsecase goBack;

  ParentsUsecases(
      this.goTo,
      this.goBack
  );
}
