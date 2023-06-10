import 'dart:math';

import 'package:flutter/material.dart';
import 'package:pokemon/utils/app_colors.dart';
import 'package:pokemon/utils/text_styles.dart';

import '../../../utils/assets_images.dart';

class PokemonItem extends StatelessWidget {
  const PokemonItem(
      {Key? key, required this.pokemonImageURL, required this.pokemonName})
      : super(key: key);

  final String pokemonImageURL;
  final String pokemonName;

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: const EdgeInsets.symmetric(horizontal: 24, vertical: 24),
      decoration: BoxDecoration(
        color: Colors.transparent,
        boxShadow: [
          BoxShadow(
            color: Colors.red.withOpacity(0.8),
            offset: const Offset(0.0, 0.0),
            blurRadius: 200,
            spreadRadius: 30,
          ),
        ],
        borderRadius: const BorderRadius.all(Radius.circular(18),)
      ),
        child: Column(
      children: [
        Container(
          height: 200,
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 24),
          child: Image.asset(AssetsImages.pokeBallLarge,),
        ),
        Text(
          pokemonName.toUpperCase(),
          style: title3Bold?.copyWith(color: surface)
        )
      ],
    ));
  }
}
