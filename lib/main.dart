import 'package:flutter/material.dart';
import 'package:pokemon/utils/app_theme.dart';
import 'package:pokemon/utils/navigator/app_navigator.dart';

Future<void> main() async{


  WidgetsFlutterBinding.ensureInitialized();

  runApp( const MyApp());


}

class MyApp extends StatelessWidget {
  static final GlobalKey<NavigatorState> navigatorKey =
      GlobalKey<NavigatorState>();

  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
        title: 'Pokemon',
        theme: AppTheme.main,
        darkTheme: AppTheme.mainDark,
        routerDelegate: AppNavigator());
  }
}
