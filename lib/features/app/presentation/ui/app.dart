import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:kindergarden/features/router/presentation/controller/router_controller.dart';
import 'package:kindergarden/features/router/presentation/ui/routes.dart';
import 'package:kindergarden/features/app/presentation/ui/styles.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_framework/responsive_framework.dart';

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      localizationsDelegates: GlobalMaterialLocalizations.delegates,
      supportedLocales: const [
        Locale('en', 'US'), // English
        Locale('ua', 'UA'), // Thai
      ],
      enableLog: false,
      popGesture: false,
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      initialBinding: BindingsBuilder(() {
        Get.put(
          RouterController(
            inject(),
            inject(),
          ),
          permanent: true,
        );
      }),
      routingCallback: (routing) {
        if (routing?.current != '/') {
          RouterController controller = Get.find();
          controller.actions.setCurrentRouteAction(path: routing?.current);
        }
      },
      getPages: routes,
      scrollBehavior: MyCustomScrollBehavior().copyWith(scrollbars: true),
      builder: (context, widget) => ResponsiveWrapper.builder(
        defaultScaleFactor: 1,
        defaultScale: false,
        backgroundColor: MyColors.backgroundSecondary,
        ClampingScrollWrapper.builder(context, widget!),
      ),
      theme: Theme.of(context).copyWith(
        primaryColor: MyColors.primary,
        scaffoldBackgroundColor: MyColors.backgroundSecondary,
        textSelectionTheme: const TextSelectionThemeData(cursorColor: MyColors.textSecondary),
      ),
      defaultTransition: Transition.fadeIn,
    );
  }
}

class MyCustomScrollBehavior extends MaterialScrollBehavior {
  // Override behavior methods and getters like dragDevices
  @override
  Set<PointerDeviceKind> get dragDevices => {
        PointerDeviceKind.touch,
        PointerDeviceKind.mouse,
        PointerDeviceKind.stylus,
        // etc.
      };
}
