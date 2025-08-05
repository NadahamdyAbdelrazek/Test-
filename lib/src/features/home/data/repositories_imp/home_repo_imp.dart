
import 'package:revision/src/features/home/data/models/home_model.dart';

import '../../../../core/base/base_repository.dart';
import '../../domain/repositories/home_repo.dart';
import '../data_sources/home_remote_data_source.dart';


class HomeRepoImp extends HomeRepo {
  final HomeRemoteDataSource remoteDataSource;

  HomeRepoImp(this.remoteDataSource);

  @override
  ResultFuture<List<HomeModel>> getData() {
    return execute(() => remoteDataSource.getData());
  }
}
