import 'package:app/modules/home/home_binding.dart';
import 'package:app/modules/home/home_page.dart';
import 'package:app/route/pages_names.dart';
import 'package:get/get.dart';

abstract class PagesRoutes {
  static final pages = [
    GetPage(
        name: PagesNames.home,
        page: () => HomePage(),
        binding: HomeBindings()
    ),
  ];
}