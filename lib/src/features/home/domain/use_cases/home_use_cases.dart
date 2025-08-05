import 'package:revision/src/core/base/base_repository.dart';
import 'package:revision/src/core/base/base_use_case.dart';
import 'package:revision/src/features/home/data/models/home_model.dart';

import '../repositories/home_repo.dart';



class HomeUseCases extends UseCaseWithoutParams<List<HomeModel>> {
  final HomeRepo _repo;

  HomeUseCases(this._repo);

  @override
  ResultFuture<List<HomeModel>> call() {
    return _repo.getData();
  }
}

