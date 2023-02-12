import 'package:kindergarden/features/app/data/providers/dio_provider.dart';
import 'package:kindergarden/features/login/usecases/login_usecase.dart';
import 'package:kindergarden/features/router/usecases/go_off_action.dart';
import 'package:kindergarden/features/router/usecases/go_to_usecase.dart';
import 'package:kindergarden/features/state/usecases/set_garden_state_usecase.dart';
import 'package:kindergarden/features/state/usecases/set_router_state_usecase.dart';
import 'package:kindergarden/features/state/usecases/set_user_state_usecase.dart';
import 'package:kindergarden/presentation/app/state/app_view_state.dart';
import 'package:kindergarden/features/login/data/datasources/login_datasource.dart';
import 'package:kindergarden/features/login/data/repositories/login_repository.dart';
import 'package:kindergarden/features/login/interfaces/login_repository.dart';
import 'package:kindergarden/presentation/app/usecases/app_usecases.dart';
import 'package:kindergarden/presentation/chefboard/state/chefboard_view_state.dart';
import 'package:kindergarden/presentation/chefboard/usecases/chefboard_usecases.dart';
import 'package:kindergarden/presentation/login/state/login_view_state.dart';
import 'package:get/get.dart';
import 'package:get_it/get_it.dart';
import 'package:kindergarden/presentation/login/usecases/login_usecases.dart';
import 'package:kindergarden/presentation/router/state/router_view_state.dart';
import 'package:kindergarden/features/state/data/datasources/hive_datasource.dart';
import 'package:kindergarden/features/state/data/repositories/get_state_local_repository.dart';
import 'package:kindergarden/features/state/data/repositories/save_state_local_repository.dart';
import 'package:kindergarden/features/state/usecases/get_state_usecase.dart';
import 'package:kindergarden/features/state/usecases/set_state_usecase.dart';
import 'package:kindergarden/features/state/interfaces/get_state_local_repository.dart';
import 'package:kindergarden/features/state/interfaces/save_state_local_repository.dart';
import 'package:kindergarden/presentation/router/usecases/router_usecases.dart';
import 'package:kindergarden/state/state.dart';

Future<void> initializeDependencies() async {
  final inject = GetIt.instance;


  // FEATURES

  // APP FEATURE
  // Data providers
  inject.registerSingleton<DioProvider>(DioProvider());

  // STATE FEATURE
  inject.registerSingleton<Rx<State>>(Rx<State>(State()));
  // datasources
  final hiveDatasource = HiveDatasource();
  await hiveDatasource.init();
  inject.registerSingleton<HiveDatasource>(hiveDatasource);
  // repositories
  inject.registerSingleton<IGetStateLocalRepository>(GetStateLocalRepository(inject()));
  inject.registerSingleton<ISaveStateLocalRepository>(SaveStateLocalRepository(inject()));
  // usecases
  inject.registerSingleton<SetStateUsecase>(SetStateUsecase(inject(), inject()));
  inject.registerSingleton<GetStateUsecase>(GetStateUsecase(inject(), inject(), inject()));
  inject.registerSingleton<SetRouterStateUsecase>(SetRouterStateUsecase(inject(), inject()));
  inject.registerSingleton<SetUserStateUsecase>(SetUserStateUsecase(inject(), inject()));
  inject.registerSingleton<SetGardenStateUsecase>(SetGardenStateUsecase(inject(), inject()));

  // ROUTER FEATURE
  // usecases
  inject.registerSingleton<GoToUsecase>(GoToUsecase(inject(), inject()));
  inject.registerSingleton<GoOffUsecase>(GoOffUsecase(inject(), inject()));


  // LOGIN FEATURE
  // datasources
  inject.registerSingleton<LoginDatasource>(LoginDatasource(inject()));
  // repositories
  inject.registerSingleton<ILoginRepository>(LoginRepository(inject()));
  // usecases
  inject.registerSingleton<LoginUsecase>(LoginUsecase(inject(), inject()));

  // PRESENTATION

  // ROUTER VIEW
  // view state
  inject.registerSingleton<RouterViewState>(RouterViewState(inject()));
  // view usecases
  inject.registerSingleton<RouterUsecases>(RouterUsecases(inject()));

  // APP VIEW
  // view state
  inject.registerSingleton<AppViewState>(AppViewState(inject()));
  // view usecases
  inject.registerSingleton<AppUsecases>(AppUsecases(inject(), inject()));

  // LOGIN VIEW
  // view state
  inject.registerSingleton<LoginViewState>(LoginViewState(inject()));
  // view usecases
  inject.registerSingleton<LoginUsecases>(LoginUsecases(inject(), inject()));

  // CHEFBOARD VIEW
  // view state
  inject.registerSingleton<ChefboardViewState>(ChefboardViewState(inject()));
  // view usecases
  inject.registerSingleton<ChefboardUsecases>(ChefboardUsecases());
}