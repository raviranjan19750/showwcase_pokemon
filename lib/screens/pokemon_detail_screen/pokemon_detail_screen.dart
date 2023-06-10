import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:pokemon/api/model/pokemon/pokemon_detail.dart';
import 'package:pokemon/api/model/pokemon/pokemon_list_details.dart';
import 'package:pokemon/bloc/pkemon_detail_bloc/pokemon_detail_bloc.dart';
import 'package:pokemon/bloc/pkemon_detail_bloc/pokemon_detail_event.dart';
import 'package:pokemon/bloc/pkemon_detail_bloc/pokemon_detail_state.dart';
import 'package:pokemon/utils/navigator/app_routes.dart';

class PokemonDetailScreen extends StatefulWidget {

  final PokemonListDetail pokemonListDetail;
  const PokemonDetailScreen({super.key, required this.pokemonListDetail});

  @override
  State<PokemonDetailScreen> createState() => _PokemonDetailScreenState();
}

class _PokemonDetailScreenState extends State<PokemonDetailScreen> {
  late PokemonDetailBloc pokemonDetailBloc;

  @override
  void initState() {
    pokemonDetailBloc = BlocProvider.of<PokemonDetailBloc>(context);
    pokemonDetailBloc.add(FetchPokemonDetail(id: widget.pokemonListDetail.id));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: BlocBuilder<PokemonDetailBloc, PokemonDetailState>(
          builder: (context, state) {
        if (state is FetchedState) {
          return Scaffold(
              appBar: AppBar(
                backgroundColor: Colors.transparent,
                leading: const IconButton(
                  icon: Icon(Icons.arrow_back_ios, color: Colors.white, size: 24,),
                  onPressed: popPage,
                ),
              ),
              extendBodyBehindAppBar: true,
              body: pokemonDetailsWidget(pokemon: state.pokemon
              ));
        }

        return const Center(
          child: CircularProgressIndicator(),
        );
      }),
    );
  }

  Widget pokemonDetailsWidget({required PokemonDetail pokemon}) {
    return Container(
      color: Colors.black,
      child: Stack(
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(
                height: 120,
              ),
              Container(
                height: 200,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: Colors.transparent,
                  shape: BoxShape.circle,
                  boxShadow: [
                    BoxShadow(
                      color: Colors
                          .primaries[Random().nextInt(Colors.primaries.length)],
                      offset: const Offset(0.0, 0.0),
                      blurRadius: 300,
                      spreadRadius: 60,
                    ),
                  ],
                ),
                child: SvgPicture.network(
                  pokemon.sprites?.other?.dreamWorld?.frontDefault ?? "",
                  fit: BoxFit.scaleDown,
                ),
              ),
              const SizedBox(
                height: 56,
              ),
              Text(
                pokemon.name?.toUpperCase() ?? "",
                style: const TextStyle(
                    color: Colors.white,
                    fontSize: 24,
                    fontWeight: FontWeight.w600),
              ),
              const SizedBox(
                height: 32,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    padding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      border: Border.all(
                        width: 1,
                        color: Colors.primaries[
                        Random().nextInt(Colors.primaries.length)],
                      ),
                      borderRadius: const BorderRadius.all(Radius.circular(64)),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        const Icon(
                          Icons.height,
                          size: 16,
                          color: Colors.black,
                        ),
                        const SizedBox(
                          width: 8,
                        ),
                        Text(
                          "Height ${pokemon.height}",
                          style: TextStyle(
                            fontWeight: FontWeight.w400,
                            fontSize: 12,
                            color: Colors.primaries[
                            Random().nextInt(Colors.primaries.length)],
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    width: 8,
                  ),
                  Container(
                    padding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      border: Border.all(
                        width: 1,
                        color: Colors.primaries[
                        Random().nextInt(Colors.primaries.length)],
                      ),
                      borderRadius: const BorderRadius.all(Radius.circular(64)),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        const Icon(
                          Icons.line_weight_sharp,
                          size: 16,
                          color: Colors.black,
                        ),
                        const SizedBox(
                          width: 8,
                        ),
                        Text(
                          "Weight ${pokemon.weight}",
                          style: TextStyle(
                            fontWeight: FontWeight.w400,
                            fontSize: 12,
                            color: Colors.primaries[
                            Random().nextInt(Colors.primaries.length)],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 56,),

              InkWell(
                onTap: () {
                  popPage(result: true);
                },
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 16),
                  margin: const EdgeInsets.symmetric(horizontal: 32),
                  decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                          color: Colors.primaries[Random().nextInt(Colors.primaries.length)].withOpacity(0.8),
                          offset: const Offset(0.0, 0.0),
                          blurRadius: 10,
                          spreadRadius: 10,
                        ),
                      ],
                      color: Colors.red,
                      borderRadius: const BorderRadius.all(Radius.circular(64))
                  ),
                  child: const Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [

                      Icon(Icons.catching_pokemon, color: Colors.white,),
                      SizedBox(width: 8,),
                      Text("Mark As Favorie", style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w500,
                          fontSize: 16
                      ),),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
