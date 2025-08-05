import 'package:revision/src/features/home/data/models/home_model.dart';

import '../../../../core/base/base_repository.dart';

abstract class HomeRepo {
  ResultFuture<List<HomeModel>> getData();
}