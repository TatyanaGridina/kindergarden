part of 'dashboard_view_state.dart';

class DashboardViewState extends DashboardViewStateAbstract {
  Rx<State> get state => super._state;
  Error? get error => super._error.value;
  String get title => super._title.value;

  DashboardViewState(Rx<State> state)
      : super(
          state,
          Rx<Error?>(state.value.error),
          RxString(state.value.dashboard.title),
        );

  onChangeState(_) {
    _error.value = _state.value.error;
    _title.value = _state.value.dashboard.title;
  }
}
