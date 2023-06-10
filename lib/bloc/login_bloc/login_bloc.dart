import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:pokemon/bloc/login_bloc/login_event.dart';
import 'package:pokemon/bloc/login_bloc/login_state.dart';

import '../../api/services/local_service.dart';
import '../../utils/navigator/app_routes.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LoginBloc() : super(LoginInitialState()) {
    Map<String, String> loginCredentials = {
      'ravi': '123',
      'username': 'password',
    };

    on<LoggingInEvent>((event, emit) async {
      String userName = event.username;
      String password = event.password;

      if (!loginCredentials.containsKey(userName)) {
        Fluttertoast.showToast(
            msg: "Credentials does not match", backgroundColor: Colors.red);
      } else if (loginCredentials.containsKey(userName) &&
          loginCredentials[userName] == password) {

        SharedPref sharedPref = SharedPref();
        sharedPref.saveLoginData(username: userName, password: password);

        Fluttertoast.showToast(
            msg: "Successful", backgroundColor: Colors.green);

        navigateOffAllNamedRoute(name: AppRoutes.homeScreen);
      } else {
        Fluttertoast.showToast(
            msg: "Credentials does not match", backgroundColor: Colors.red);
      }
    });
  }
}
