import 'package:dio/dio.dart';

import '../../../../../core/base/base_response.dart';

abstract class BaseAuthenticationRemoteDataSource {
  Future<BaseResponse<String>> login(String email, String password);

}
class AuthenticationRemoteDataSourceImp extends BaseAuthenticationRemoteDataSource {
  final Dio dio;

  AuthenticationRemoteDataSourceImp(this.dio);

  @override
  Future<BaseResponse<String>> login(String email, String password) async {
    await Future.delayed(Duration(seconds: 1));
    return BaseResponse(
      message: 'Login successful',
      data: 'token_123',
       success:true,
    );
  }
}
