import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:kindergarden/presentation/router/controller/router_controller.dart';
import 'package:kindergarden/presentation/router/ui/routes.dart';
import 'package:kindergarden/presentation/app/ui/styles.dart';
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
        Locale('ru', 'RU'), // Thai
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
          controller.usecases.setState(path: routing?.current);
        }
      },
      getPages: routes,
      scrollBehavior: MyCustomScrollBehavior().copyWith(scrollbars: true),
      builder: (context, widget) => ResponsiveWrapper.builder(
        defaultScaleFactor: 1,
        defaultScale: false,
        backgroundColor: MyColors.backgroundPrimary,
        ClampingScrollWrapper.builder(context, widget!),
      ),
      theme: ThemeData(
        // указываем primaryColor и его оттенки
          primaryColor: MyColors.backgroundPrimary,
          //primaryColorLight: Colors.purple[300],
          //primaryColorDark: Colors.purple[800],
          // также указываем accentColor
          accentColor: MyColors.accentColor,
          // настройка Theme для AppBar
          appBarTheme: AppBarTheme(
            shadowColor: Colors.grey.withOpacity(0.8),
            //backgroundColor: MyColors.backgroundAppBar,
            elevation: 10,
          ),
        tabBarTheme: TabBarTheme(
          labelStyle: MyTextStyles.largePrimaryBold.copyWith(fontFamily: 'Caveat'),
          labelColor: MyColors.textPrimary,
          unselectedLabelStyle: MyTextStyles.largeInactiveBold.copyWith(fontFamily: 'Caveat'),
        ),
          // настройка Theme для Text
          textTheme: const TextTheme(
              headline6: MyTextStyles.largeSecondaryBold
          ),
          // указываем наш шрифт для всего приложения
          fontFamily: "Caveat"
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
