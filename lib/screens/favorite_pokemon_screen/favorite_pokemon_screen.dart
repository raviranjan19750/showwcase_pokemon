
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pokemon/bloc/pokemon_listing_bloc/pokemon_listing_event.dart';

import '../../api/model/pokemon/pokemon_list_details.dart';
import '../../bloc/pkemon_detail_bloc/pokemon_detail_state.dart';
import '../../bloc/pokemon_listing_bloc/pokemon_listing_bloc.dart';
import '../../bloc/pokemon_listing_bloc/pokemon_listing_state.dart';
import '../../utils/navigator/app_routes.dart';
import '../empty_state_screen.dart';
import '../pokemon_listing_screen/widgets/pokemon_item.dart';

class FavoritePokemonScreen extends StatefulWidget {
  const FavoritePokemonScreen({Key? key}) : super(key: key);

  @override
  State<FavoritePokemonScreen> createState() => _FavoritePokemonScreenState();
}

class _FavoritePokemonScreenState extends State<FavoritePokemonScreen> {

  late PokemonListingBloc bloc;

  List<PokemonListDetail> pokemonList = [];
  
  @override
  void initState() {
    bloc = BlocProvider.of<PokemonListingBloc>(context);
    bloc.add(FetchFavoritePokemon());
    super.initState();
  }



  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(

        extendBodyBehindAppBar: true,
        body: BlocBuilder<PokemonListingBloc, PokemonListingState>(
          builder: (_, state) {
            if (state is LoadingState) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }

            if (state is PokemonListingFetchedState) {

              return Column(
                children: [

                  Expanded(

                    child: state.pokemonList.isNotEmpty? ListView.builder(
                        itemCount: state.pokemonList.length,
                        shrinkWrap: true,
                        itemBuilder: (_, index) {
                          PokemonListDetail detail = state.pokemonList.elementAt(index);

                          return Container(
                            margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
                            child: PokemonItem(
                              pokemonImageURL: detail.url,
                              pokemonName: detail.name,
                            ),
                          );
                        }): EmptyStateScreen(title: "List is empty",),
                  ),
                ],
              );
            }

            return const SizedBox();
          },
        ),
      ),
    );
  }

}
