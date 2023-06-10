import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lottie/lottie.dart';
import 'package:pokemon/bloc/splash_screen/splash_screen_bloc.dart';
import 'package:pokemon/utils/text_styles.dart';

import '../bloc/splash_screen/splash_screen_event.dart';
import '../utils/assets_images.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);


  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  late SplashScreenBloc bloc;
  @override
  void initState() {
    bloc = BlocProvider.of<SplashScreenBloc>(context);
    bloc.add(SplashScreenRunningEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [

          Container(
            height: 400,
              padding: const EdgeInsets.symmetric(horizontal: 32),
              child: Lottie.asset(AssetsImages.introLottie, repeat: true, fit: BoxFit.scaleDown)),


          const SizedBox(
            height: 56,
          ),

          Container(
              alignment: Alignment.center,

              child: Text("P O K E M O N",textAlign: TextAlign.center, style: title3Bold,))

        ],
      ),
    );
  }
}
