import 'package:revision/src/core/base/base_use_case.dart';

import '../../../../../core/base/base_repository.dart';
import '../../../../../core/base/parameters.dart';
import '../repositories/base_auth_repository.dart';

class LoginUseCase extends UseCaseWithParams<void, LoginParameterUC> {
  final BaseAuthRepository baseAuthRepository;

  LoginUseCase(this.baseAuthRepository);
  @override
  ResultFuture<void> call(LoginParameterUC params) {
    return baseAuthRepository.login(params.email, params.password);
  }
}
