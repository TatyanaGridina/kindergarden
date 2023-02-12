import 'package:kindergarden/features/app/models/_models.dart';
import 'package:get/get.dart';
import 'package:kindergarden/state/action.dart';
import 'package:kindergarden/state/logic/actions/set_state_action.dart';
import 'package:kindergarden/state/logic/repositories/get_state_local_repository.dart';
import 'package:kindergarden/state/state/state.dart';

class GetStateAction extends Action {
  final IGetStateLocalRepository _getStateLocalRepository;

  GetStateAction(Rx<State> state, SetStateAction setAppStateAction, this._getStateLocalRepository)
      : super(state, setAppStateAction);

  call() async {
    try {
      onStartActionHandler(runtimeType);
      await _restoreState();
    } catch (e) {
      onErrorActionHandler(e);
    } finally {
      onEndActionHandler();
    }
  }

  _restoreState() async {
    final result = _getStateLocalRepository();

    if (result is Ok && result.data != null) {
      final newState = result.data!;
      await setState(newState.copyWith(
        action: runtimeType,
      ));
    } else if (result is Err) {
      throw result.error!;
    }
  }
}
