import 'package:kindergarden/usecases/router/go_to_usecase.dart';
import '../../../usecases/router/go_back_usecase.dart';

class GroupsUsecases {
  final GoToUsecase goTo;
  final GoBackUsecase goBack;

  GroupsUsecases(
      this.goTo,
      this.goBack
  );
}
