import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pokemon/bloc/login_bloc/login_bloc.dart';
import 'package:pokemon/bloc/login_bloc/login_event.dart';
import 'package:pokemon/bloc/login_bloc/login_state.dart';
import 'package:pokemon/utils/app_colors.dart';
import 'package:pokemon/utils/text_styles.dart';

import '../../utils/assets_images.dart';

class LoginScreen extends StatefulWidget {
  LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController userNameTextEditingController = TextEditingController();

  TextEditingController passwordTextEditingController = TextEditingController();

  late LoginBloc bloc;

  @override
  void initState() {
    bloc = BlocProvider.of<LoginBloc>(context);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<LoginBloc, LoginState>(
        builder: (_, state) {
          if (state is LoginInitialState) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  height: 100,
                  width: 100,
                  padding:
                      const EdgeInsets.symmetric(horizontal: 24, vertical: 24),
                  child: Image.asset(
                    AssetsImages.psyduck,
                  ),
                ),
                Container(
                  margin:
                      const EdgeInsets.symmetric(horizontal: 32, vertical: 12),
                  padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 0),
                  decoration: BoxDecoration(
                      border: Border.all(color: Colors.red.withOpacity(0.5),),

                      borderRadius: const BorderRadius.all(Radius.circular(16))),
                  child: TextField(
                    controller: userNameTextEditingController,
                    cursorColor: Colors.red.withOpacity(0.5),
                    style:  TextStyle(
                      fontSize: 14,
                      color: primaryDark,
                    ),
                    decoration: InputDecoration(
                        border: InputBorder.none,
                        labelText: "User name",
                        labelStyle: TextStyle(color: Colors.red.withOpacity(0.5),)),
                  ),
                ),
                const SizedBox(
                  height: 16,
                ),
                Container(
                  margin:
                      const EdgeInsets.symmetric(horizontal: 32, vertical: 12),
                  padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 0),
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.red.withOpacity(0.5),),
                      borderRadius: const BorderRadius.all(Radius.circular(16))),
                  child: TextField(
                    controller: passwordTextEditingController,
                    cursorColor: Colors.red.withOpacity(0.5),
                    style:  TextStyle(
                      fontSize: 14,
                      color: primaryDark,
                    ),
                    decoration: InputDecoration(
                        border: InputBorder.none,
                        labelText: "Password",
                        labelStyle: TextStyle(color:Colors.red.withOpacity(0.5),)),
                  ),
                ),


                const SizedBox(
                  height: 32,
                ),

                InkWell(
                  onTap: () {
                    // redirect to home screen
                    bloc.add(LoggingInEvent(username: userNameTextEditingController.text.trim(), password: passwordTextEditingController.text.trim()));
                  },
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                    decoration: BoxDecoration(
                      color: Colors.red.withOpacity(0.5),
                      borderRadius: const BorderRadius.all(Radius.circular(16))
                    ),
                    child: Text(
                      "login".toUpperCase(),
                      style: title3Bold?.copyWith(color: Colors.white),
                    ),
                  ),
                ),
              ],
            );
          }
          return const Center(child: CircularProgressIndicator());
        },
      ),
    );
  }
}
