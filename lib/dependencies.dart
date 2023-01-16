import 'package:kindergarden/data/providers/dio_provider.dart';
import 'package:kindergarden/features/_state/logic/repositories/get_state_local_repository.dart';
import 'package:kindergarden/features/_state/logic/repositories/save_state_local_repository.dart';
import 'package:kindergarden/features/app/presentation/actions/app_view_actions.dart';
import 'package:kindergarden/features/_state/data/datasources/hive_datasource.dart';
import 'package:kindergarden/features/_state/data/repositories/get_state_local_repository.dart';
import 'package:kindergarden/features/_state/data/repositories/save_state_local_repository.dart';
import 'package:kindergarden/features/_state/logic/actions/get_state_action.dart';
import 'package:kindergarden/features/_state/logic/actions/set_state_action.dart';
import 'package:kindergarden/features/app/presentation/state/app_view_state.dart';
import 'package:kindergarden/features/dashboard/data/datasources/dashboard_datasource.dart';
import 'package:kindergarden/features/dashboard/data/repositories/dashboard_repository.dart';
import 'package:kindergarden/features/dashboard/logic/actions/set_dashboard_state_action.dart';
import 'package:kindergarden/features/dashboard/logic/repositories/dashboard_repository.dart';
import 'package:kindergarden/features/dashboard/presentation/actions/dashboard_view_actions.dart';
import 'package:kindergarden/features/dashboard/presentation/state/dashboard_view_state.dart';
import 'package:kindergarden/features/auth/data/datasources/login_datasource.dart';
import 'package:kindergarden/features/auth/data/repositories/login_repository.dart';
import 'package:kindergarden/features/auth/logic/actions/set_auth_state_action.dart';
import 'package:kindergarden/features/auth/logic/repositories/login_repository.dart';
import 'package:kindergarden/features/auth/presentation/actions/login_view_actions.dart';
import 'package:kindergarden/features/auth/presentation/state/login_view_state.dart';
import 'package:kindergarden/features/router/logic/actions/go_off_action.dart';
import 'package:kindergarden/features/router/logic/actions/go_to_action.dart';
import 'package:kindergarden/features/router/logic/actions/set_current_route_action.dart';
import 'package:kindergarden/features/_state/state/_state.dart';
import 'package:get/get.dart';
import 'package:get_it/get_it.dart';
import 'package:kindergarden/features/router/presentation/actions/router_view_actions.dart';
import 'package:kindergarden/features/router/presentation/state/router_view_state.dart';

Future<void> initializeDependencies() async {
  final inject = GetIt.instance;

  // Data providers
  inject.registerSingleton<DioProvider>(DioProvider());

  // STATE
  inject.registerSingleton<Rx<State>>(Rx<State>(State()));
  // datasources
  final hiveDatasource = HiveDatasource();
  await hiveDatasource.init();
  inject.registerSingleton<HiveDatasource>(hiveDatasource);
  // repositories
  inject.registerSingleton<IGetStateLocalRepository>(GetStateLocalRepository(inject()));
  inject.registerSingleton<ISaveStateLocalRepository>(SaveStateLocalRepository(inject()));
  // actions
  inject.registerSingleton<SetStateAction>(SetStateAction(inject(), inject()));
  inject.registerSingleton<GetStateAction>(GetStateAction(inject(), inject(), inject()));

  // ROUTER FEATURE
  // actions
  inject.registerSingleton<GoToAction>(GoToAction(inject(), inject()));
  inject.registerSingleton<GoOffAction>(GoOffAction(inject(), inject()));
  inject.registerSingleton<SetCurrentRouteAction>(SetCurrentRouteAction(inject(), inject()));
  // view state
  inject.registerSingleton<RouterViewState>(RouterViewState(inject()));
  // view actions
  inject.registerSingleton<RouterViewActions>(RouterViewActions(inject(), inject(), inject()));

  // APP FEATURE
  // actions
  // view state
  inject.registerSingleton<AppViewState>(AppViewState(inject()));
  // view actions
  inject.registerSingleton<AppViewActions>(AppViewActions(inject(), inject()));

  // LOGIN FEATURE
  // datasources
  inject.registerSingleton<LoginDatasource>(LoginDatasource(inject()));
  // repositories
  inject.registerSingleton<ILoginRepository>(LoginRepository(inject()));
  // actions
  inject.registerSingleton<SetAuthStateAction>(SetAuthStateAction(inject(), inject()));
  // view state
  inject.registerSingleton<LoginViewState>(LoginViewState(inject()));
  // view actions
  inject.registerSingleton<LoginViewActions>(LoginViewActions(inject()));

  // DASHBOARD FEATURE
  // datasources
  inject.registerSingleton<DashboardDatasource>(DashboardDatasource(inject()));
  // repositories
  inject.registerSingleton<IDashboardRepository>(DashboardRepository(inject()));
  // actions
  inject.registerSingleton<SetDashboardStateAction>(SetDashboardStateAction(inject(), inject()));
  // view state
  inject.registerSingleton<DashboardViewState>(DashboardViewState(inject()));
  // view actions
  inject.registerSingleton<DashboardViewActions>(DashboardViewActions(inject()));
}
