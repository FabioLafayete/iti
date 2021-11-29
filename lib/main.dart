import 'package:app/util/bearer_token.dart';
import 'package:app/util/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:get/get.dart';
import 'config/app_config.dart';
import 'config/app_translation.dart';
import 'modules/base/base_overlay_view_model.dart';
import 'route/page_router.dart';
import 'route/page_router_controller.dart';
import 'route/pages_names.dart';
import 'route/pages_routes.dart';
import 'util/assets.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await _preload();
  runApp(
      GetMaterialApp(
        debugShowCheckedModeBanner: false,
        initialRoute: PagesNames.home,
        defaultTransition: Transition.topLevel,
        getPages: PagesRoutes.pages,
        locale: Locale('pt', 'BR'),
        theme: Themes().lightTheme,
        darkTheme: Themes().darkTheme,
        translationsKeys: (Get.find<AppTranslation>().map).map(
              (key, value) => MapEntry(
            key,
            value.cast<String, String>(),
          ),
        ),
        localizationsDelegates: [
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
        ],
      )
  );
}

Future _preload() async {
  await SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);

  Get.put<BaseOverlayViewModel>(BaseOverlayViewModel(), permanent: true);
  Get.put<BearerToken>(BearerToken.instance);
  Get.put(PageRouter.instance(routeControl: PageRouterController()), permanent: true);
  Get.put(Assets.instance(assetBundle: rootBundle));
  Get.put(AppConfig.instance);
  Get.put(AppTranslation());
  await TranslationApi.loadTranslations();

  await Future.wait([
    AppConfig().load(),
  ]);

}