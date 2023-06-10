import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pokemon/api/services/local_service.dart';
import 'package:pokemon/bloc/splash_screen/splash_screen_event.dart';
import 'package:pokemon/bloc/splash_screen/splash_screen_state.dart';

import '../../utils/navigator/app_routes.dart';

class SplashScreenBloc extends Bloc<SplashScreenEvent, SplashScreenState> {
  SplashScreenBloc() : super(InitialSplashScreenState()) {
    on<SplashScreenRunningEvent>((event, emit) {
      Future.delayed(const Duration(milliseconds: 3000), () async {

        SharedPref sharedPref = SharedPref();
        if(await sharedPref.isUserLoggedIn()){
          navigateOffAllNamedRoute(name: AppRoutes.homeScreen);
        }else{
          navigateOffAllNamedRoute(name: AppRoutes.loginScreen);
        }


      });
    });
  }
}
