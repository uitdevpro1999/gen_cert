import 'dart:async';

import 'package:gen_cert/flavors.dart';
import 'package:gen_cert/start.dart';

FutureOr<void> main() async {
  F.appFlavor = Flavor.prod;
  await start();
}
