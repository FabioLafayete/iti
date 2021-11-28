import 'package:app/route/page_router.dart';
import 'package:get/get.dart';

class BaseController extends GetxController {
  final PageRouter router = PageRouter();

  Future toNamed(String route, [dynamic payload]) => router.toNamed(route, payload: payload);
  Future offNamed(String route, [dynamic payload]) => router.toNamed(route, payload: payload);
  Future offAllNamed(String route, [dynamic payload]) => router.toNamed(route, payload: payload);
  Future offNamedUntil(String route, String until, [dynamic payload]) {
    router.until(until);
    return router.toNamed(route, payload: payload);
  }
  void until(String route) => router.until(route);
  void back([bool result]) => router.back();
}
