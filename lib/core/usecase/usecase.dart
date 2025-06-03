
import 'package:gen_cert/core/network/api/api_result.dart';

abstract interface class UseCase<T, Params> {
  Future<ApiResult<T>> call(Params params);
}

abstract interface class NoInputUseCase<T> {
  Future<ApiResult<T>> call();
}
