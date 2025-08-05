

import '../../../../../core/base/base_repository.dart';

abstract class BaseAuthRepository {
  ResultFuture<void> login(String email, String password);
}