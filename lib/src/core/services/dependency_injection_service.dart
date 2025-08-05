

import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:revision/src/features/home/domain/use_cases/home_use_cases.dart';
import 'package:revision/src/features/home/presentation/home/bloc/home_bloc.dart';
import 'package:revision/src/features/login/login/domain/use_cases/login_use_case.dart';

import '../../features/home/data/data_sources/home_remote_data_source.dart';
import '../../features/home/data/repositories_imp/home_repo_imp.dart';
import '../../features/home/domain/repositories/home_repo.dart';
import '../../features/login/login/data/data_sources/base_auth_remote_data_source.dart';
import '../../features/login/login/data/repositories_impl/auth_repository_Imp.dart';
import '../../features/login/login/domain/repositories/base_auth_repository.dart';
import '../../features/login/login/presentation/bloc/login_bloc.dart';
import '../network/dio_factory.dart';

final di = GetIt.instance;

class DependencyInjectionService {
  static Future<void> init() async {
    // Dio Factory

    di.registerLazySingleton<DioFactory>(() => DioFactory());
    di.registerLazySingleton<Dio>(() => di<DioFactory>().dio);
    // Remote Data Source
    di.registerLazySingleton<HomeRemoteDataSource>(
          () => HomeRemoteDataSourceImp(
            di<Dio>(),
      ),
    );
    di.registerLazySingleton<BaseAuthenticationRemoteDataSource>(
          () => AuthenticationRemoteDataSourceImp(
            di<Dio>(),
      ),
    );
    // Repository

    di.registerLazySingleton<BaseAuthRepository>(
          () => AuthenticationRepositoryImpl(
            di<BaseAuthenticationRemoteDataSource>(),
      ),
    );
    di.registerLazySingleton<HomeRepo>(
          () => HomeRepoImp(
            di<HomeRemoteDataSource>(),
      ),
    );

    // Use Cases
    di.registerLazySingleton(() => HomeUseCases(di()));
    di.registerLazySingleton(() => LoginUseCase(di()));

    // bloc
    di.registerLazySingleton(() => HomeBloc(di()));
    di.registerFactory<LoginBloc>(
            () => LoginBloc(loginUC: di()));



  }
}