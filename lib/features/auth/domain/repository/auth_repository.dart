import 'package:gen_cert/core/common/bases/base_repository.dart';
import 'package:gen_cert/core/network/api/api_result.dart';
import 'package:gen_cert/features/auth/data/models/request/login_request.dart';
import 'package:gen_cert/features/auth/domain/entities/auth_entity.dart';

abstract class AuthRepository extends BaseRepository {
  Future<ApiResult<Auth>> login(LoginRequest request);
}
