import 'package:flutter/material.dart';
import 'package:pokemon/main.dart';

class AppRoutes {
  static const splashScreen = '/';
  static const loginScreen = '/loginScreen';
  static const homeScreen = '/homeScreen';
  static const pokemonListingScreen = '/pokemonListingScreen';
  static const pokemonDetailsScreen = '/pokemonDetails';
  static const addPokemonScreen = '/addPokemonScreen';
}

bool popPage({dynamic result}) {
  bool canPop = MyApp.navigatorKey.currentState?.canPop() ?? false;

  if (canPop) {
    MyApp.navigatorKey.currentState?.pop(result);
  }


  return canPop;
}

void popUntilRoute({required String route}) {
  MyApp.navigatorKey.currentState?.popUntil(ModalRoute.withName(route));
}

Future<dynamic>? openBottomSheet(
    {required Widget widget,
    bool isDismissible = true,
    Color backgroundColor = Colors.white,
    bool isScrollControlled = true,
    ShapeBorder? shape}) {
  return showModalBottomSheet(
      context: MyApp.navigatorKey.currentContext!,
      isDismissible: isDismissible,
      isScrollControlled: isScrollControlled,
      shape: shape,
      backgroundColor: backgroundColor,
      builder: (context) {
        return Padding(
          padding: MediaQuery.of(context).viewInsets,
          child: widget,
        );
      });
}

Future<dynamic> openDialog(
    {required Widget widget,
    bool barrierDismissible = true,
    dynamic arguments}) {
  return showDialog(
    context: MyApp.navigatorKey.currentContext!,
    builder: (_) => widget,
    barrierDismissible: barrierDismissible,
  );
}

Future<dynamic>? navigateToNamedRoute(
    {required String name, dynamic arguments}) {
  return MyApp.navigatorKey.currentState?.pushNamed(name, arguments: arguments);
}

Future<dynamic>? navigateOffNamedRoute(
    {required String name, dynamic arguments, bool preventDuplicates = true}) {
  return MyApp.navigatorKey.currentState
      ?.popAndPushNamed(name, arguments: arguments);
}

Future<dynamic>? navigateOffAllNamedRoute(
    {required String name, dynamic arguments, bool preventDuplicates = true}) {
  return MyApp.navigatorKey.currentState?.pushNamedAndRemoveUntil(
      name, ModalRoute.withName('/'),
      arguments: arguments);
}

Future<dynamic>? navigateOffNamedUntilRoute(
    {required String name, required String offName, dynamic arguments}) {
  return MyApp.navigatorKey.currentState?.pushNamedAndRemoveUntil(
      name, ModalRoute.withName(offName),
      arguments: arguments);
}
