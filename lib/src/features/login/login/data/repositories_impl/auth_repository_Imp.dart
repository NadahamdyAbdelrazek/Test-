import 'package:revision/src/core/base/base_repository.dart';
import 'package:revision/src/features/login/login/domain/repositories/base_auth_repository.dart';

import '../../../../../core/utils/cache/hive_manager.dart';
import '../../../../../core/utils/cache/keys_manager.dart';
import '../data_sources/base_auth_remote_data_source.dart';

class AuthenticationRepositoryImpl extends BaseAuthRepository {
  final BaseAuthenticationRemoteDataSource remoteDataSource;

  AuthenticationRepositoryImpl(this.remoteDataSource);

  @override
  ResultFuture<void> login(String email, String password) async {
    return execute(() async {
      final response = await remoteDataSource.login(email, password);
      await HiveManager().save<String>(
        KeysManager.userBox,
        KeysManager.loginAccounts,
        response.data??"",
      );
    });
  }
}

