
import 'package:dio/dio.dart';
import 'package:revision/src/core/constants/end_points.dart';
import 'package:revision/src/features/home/data/models/home_model.dart';

abstract class HomeRemoteDataSource {
  Future<List<HomeModel>> getData();
}

class HomeRemoteDataSourceImp extends HomeRemoteDataSource {
  final Dio dio;

  HomeRemoteDataSourceImp(this.dio);

  @override
  Future<List<HomeModel>> getData() async {
    final response = await dio.get(EndPoints.getData);

    final List data = response.data;
    return data.map((json) => HomeModel.fromJson(json)).toList();
  }
}