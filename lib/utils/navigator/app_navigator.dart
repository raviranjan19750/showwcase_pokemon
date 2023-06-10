import 'package:flutter/material.dart';
import 'package:pokemon/main.dart';
import 'package:pokemon/utils/navigator/app_routes.dart';
import 'package:pokemon/utils/navigator/route_generator.dart';

class AppNavigator extends RouterDelegate<List<RouteSettings>>
    with ChangeNotifier, PopNavigatorRouterDelegateMixin<List<RouteSettings>> {



  @override
  Widget build(BuildContext context) {
    return Navigator(
      key: MyApp.navigatorKey,
      initialRoute: AppRoutes.splashScreen,
      onGenerateRoute: generateNestedRoute,
    );
  }

  @override
  Future<bool> popRoute() async {
    return popPage();
  }

  @override
  final GlobalKey<NavigatorState> navigatorKey = MyApp.navigatorKey;

  @override
  Future<void> setNewRoutePath(List<RouteSettings> configuration) async {}
}
