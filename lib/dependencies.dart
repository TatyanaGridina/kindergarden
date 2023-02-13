import 'package:kindergarden/usecases/app/data/providers/dio_provider.dart';
import 'package:kindergarden/usecases/login/data/repositories/login_repository.dart';
import 'package:kindergarden/usecases/login/login_usecase.dart';
import 'package:kindergarden/usecases/login/send_email_usecase.dart';
import 'package:kindergarden/usecases/login/signup_usecase.dart';
import 'package:kindergarden/usecases/router/go_off_usecase.dart';
import 'package:kindergarden/usecases/router/go_to_usecase.dart';
import 'package:kindergarden/usecases/state/set_router_state_usecase.dart';
import 'package:kindergarden/presentation/app/state/app_view_state.dart';
import 'package:kindergarden/usecases/login/data/datasources/login_datasource.dart';
import 'package:kindergarden/usecases/login/login_interface.dart';
import 'package:kindergarden/presentation/app/usecases/app_usecases.dart';
import 'package:kindergarden/presentation/chefboard/state/chefboard_view_state.dart';
import 'package:kindergarden/presentation/chefboard/usecases/chefboard_usecases.dart';
import 'package:kindergarden/presentation/login/state/login_view_state.dart';
import 'package:get/get.dart';
import 'package:get_it/get_it.dart';
import 'package:kindergarden/presentation/login/usecases/login_usecases.dart';
import 'package:kindergarden/presentation/router/state/router_view_state.dart';
import 'package:kindergarden/usecases/state/data/datasources/hive_datasource.dart';
import 'package:kindergarden/usecases/state/data/repositories/get_state_local_repository.dart';
import 'package:kindergarden/usecases/state/data/repositories/save_state_local_repository.dart';
import 'package:kindergarden/usecases/state/get_state_usecase.dart';
import 'package:kindergarden/usecases/state/set_state_usecase.dart';
import 'package:kindergarden/presentation/router/usecases/router_usecases.dart';
import 'package:kindergarden/state/state.dart';
import 'package:kindergarden/usecases/state/state_interface.dart';

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
  inject.registerSingleton<SendEmailUsecase>(SendEmailUsecase(inject(), inject()));
  inject.registerSingleton<SignupUsecase>(SignupUsecase(inject(), inject()));
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
  inject.registerSingleton<LoginUsecases>(LoginUsecases(inject(), inject(), inject(), inject()));

  // CHEFBOARD VIEW
  // view state
  inject.registerSingleton<ChefboardViewState>(ChefboardViewState(inject()));
  // view usecases
  inject.registerSingleton<ChefboardUsecases>(ChefboardUsecases());
}