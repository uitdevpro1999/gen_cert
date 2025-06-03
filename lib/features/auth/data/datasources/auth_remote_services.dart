import 'package:dio/dio.dart';
import 'package:gen_cert/core/common/bases/model/base_response.dart';
import 'package:gen_cert/core/network/endpoint/endpoint.dart';
import 'package:gen_cert/features/auth/data/models/request/login_request.dart';
import 'package:gen_cert/features/auth/data/models/response/auth_response.dart';
import 'package:retrofit/retrofit.dart';
part 'auth_remote_services.g.dart';

@RestApi()
abstract class AuthRemoteServices {
  factory AuthRemoteServices(Dio dio, {String baseUrl}) = _AuthRemoteServices;
  @POST(Endpoint.login)
  Future<BaseResponse<AuthResponse>> login(@Body() LoginRequest request);
}
