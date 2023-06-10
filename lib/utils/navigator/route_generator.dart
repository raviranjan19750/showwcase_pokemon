import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pokemon/bloc/login_bloc/login_bloc.dart';
import 'package:pokemon/bloc/pkemon_detail_bloc/pokemon_detail_bloc.dart';
import 'package:pokemon/bloc/pokemon_listing_bloc/pokemon_listing_bloc.dart';
import 'package:pokemon/screens/add_pokemon_screen.dart';
import 'package:pokemon/screens/home_screen.dart';
import 'package:pokemon/screens/login_screen/login_screen.dart';
import 'package:pokemon/screens/pokemon_detail_screen/pokemon_detail_screen.dart';
import 'package:pokemon/screens/pokemon_listing_screen/pokemon_listing_screen.dart';
import 'package:pokemon/screens/splash_screen.dart';
import 'package:pokemon/utils/navigator/app_routes.dart';

import '../../bloc/splash_screen/splash_screen_bloc.dart';

Route? generateNestedRoute(RouteSettings settings) {
  String name = settings.name ?? '';

  dynamic arguments = settings.arguments;

  switch (name) {
    case AppRoutes.addPokemonScreen:
      return MaterialPageRoute(builder: (context) => AddPokemonScreen());

    case AppRoutes.splashScreen:
      return MaterialPageRoute(
          builder: (context) => BlocProvider(
              create: (context) => SplashScreenBloc(),
              child: const SplashScreen()));

    case AppRoutes.loginScreen:
      return MaterialPageRoute(
          builder: (context) => BlocProvider(
              create: (context) => LoginBloc(), child: LoginScreen()));

    case AppRoutes.homeScreen:
      return MaterialPageRoute(
          builder: (context) => BlocProvider(
              create: (context) => PokemonListingBloc(),
              child: const HomeScreen()));
    case AppRoutes.pokemonListingScreen:
      return MaterialPageRoute(
          builder: (context) => BlocProvider(
              create: (context) => PokemonListingBloc(),
              child: const PokemonListingScreen()));
    case AppRoutes.pokemonDetailsScreen:
      return MaterialPageRoute(
          builder: (context) => BlocProvider(
                create: (context) => PokemonDetailBloc(),
                child: PokemonDetailScreen(
                  pokemonListDetail: arguments,
                ),
              ));

    default:
      return MaterialPageRoute(
          builder: (context) => const Scaffold(
                body: Center(child: Text('No Routes Found')),
              ));
  }
}
