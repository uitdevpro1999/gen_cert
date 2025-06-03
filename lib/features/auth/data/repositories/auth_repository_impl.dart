import 'package:flutter/foundation.dart';
import 'package:gen_cert/core/network/api/api_result.dart';
import 'package:gen_cert/features/auth/data/datasources/auth_remote_data_sources.dart';
import 'package:gen_cert/features/auth/data/models/request/login_request.dart';
import 'package:gen_cert/features/auth/domain/entities/auth_entity.dart';
import 'package:gen_cert/features/auth/domain/repository/auth_repository.dart';
import 'package:injectable/injectable.dart';

@LazySingleton(as: AuthRepository)
class AuthRepositoryImpl extends AuthRepository {
  final AuthRemoteDataSources _src;
  AuthRepositoryImpl(
    this._src,
  );

  @override
  Future<ApiResult<Auth>> login(LoginRequest request) {
    return handleApiResponse(() => _src.login(request));
  }
}
