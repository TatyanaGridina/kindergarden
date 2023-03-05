import 'package:kindergarden/usecases/router/go_to_usecase.dart';
import '../../../usecases/router/go_back_usecase.dart';

class KidsUsecases {
  final GoToUsecase goTo;
  final GoBackUsecase goBack;

  KidsUsecases(
      this.goTo,
      this.goBack
  );
}
