import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'core/http_client/client.dart';
import 'core/network/network_info.dart';
import 'core/network/network_info_impl.dart';
import 'features/user/data/datasources/user_remote_datasource.dart';
import 'features/user/data/repositories/user_repository_impl.dart';
import 'features/user/domain/repositories/user_repository.dart';
import 'features/user/domain/usecases/user_usecase.dart';
import 'features/user/presentation/bloc/user/user_bloc.dart';

GetIt sl = GetIt.instance;

Future<void> initializeDependencies() async {
  // Core / Services
  sl.registerLazySingleton<Connectivity>(() => Connectivity());
  sl.registerLazySingleton<NetworkInfo>(() => NetworkInfoImpl(sl()));


  // Bloc
  sl.registerFactory(() => UserBloc(useCase: sl(), prefs: sl(),networkInfo: sl(),));

  // Use cases
  sl.registerLazySingleton(() => UserUseCase(repository: sl()));

  // Repositories
  sl.registerLazySingleton<UserRepository>(
      () => UserRepositoryImpl(remoteDataSource: sl()));
  // Data sources
  sl.registerLazySingleton<UserRemoteDataSource>(
      () => UserRemoteDataSourceImpl(client: sl()));
  // Http service
  sl.registerLazySingleton<BaseApiClient>(() => BaseApiClient());
  // SharedPreferences
  sl.registerSingleton<SharedPreferences>(await SharedPreferences.getInstance());
}
