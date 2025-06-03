import 'package:gen_cert/core/constants/constants.dart';

class BasePaginationRequest {
  final int page;
  final int pageSize;

  BasePaginationRequest(this.page, {this.pageSize = Consts.defaultPageSize});
}
