
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pokemon/api/services/local_service.dart';
import 'package:pokemon/api/services/pokemon_service.dart';
import 'package:pokemon/bloc/pokemon_listing_bloc/pokemon_listing_event.dart';
import 'package:pokemon/bloc/pokemon_listing_bloc/pokemon_listing_state.dart';

import '../../api/model/pokemon/pokemon_list_details.dart';

class PokemonListingBloc extends Bloc<PokemonListingEvent, PokemonListingState>
    with PokemonService {
  PokemonListingBloc()
      : super(
          PokemonListingInitialState(),
        ) {
    List<PokemonListDetail> pokemonSearchList = [];
    List<PokemonListDetail> pokemonList = [];
    List<PokemonListDetail> favoritePokemonList = [];
    var result;

    on<FetchPokemonListing>((event, emit) async {
      if (event.offset == 0) {
        emit(PokemonListingLoadingState());
      } else {
        emit(
          PokemonListingFetchedState(isPaginating: true),
        );
      }

      SharedPref sharedPref = SharedPref();
      var list = await sharedPref.retrievePokemonData();
      favoritePokemonList.addAll(list);

      result = await getPokemonList(limit: event.limit, offset: event.offset);

      pokemonSearchList.addAll(result.item1);
      pokemonList.addAll(result.item1);

      emit(
        PokemonListingFetchedState(
            isPaginating: false,
            pokemonList: result.item1,
            totalItem: result.item2),
      );
    });

    on<SearchPokemonListing>((event, emit) async {
      String query = event.searchQuery;

      if (query.isEmpty) {
        pokemonSearchList.clear();
        emit(
          PokemonListingFetchedState(
              isPaginating: false,
              pokemonList: pokemonList,
              totalItem: result.item2),
        );
      } else {
        pokemonSearchList.clear();
        pokemonSearchList = pokemonList
            .where((element) =>
                element.name.toLowerCase().contains(query.toLowerCase()))
            .toList();
        emit(
          PokemonListingFetchedState(
              isPaginating: false,
              pokemonList: pokemonSearchList,
              totalItem: pokemonSearchList.length),
        );
      }
    });

    on<MarkAsFavoritePokemon>((event, emit) async {
      PokemonListDetail pokemonDetail = event.pokemonDetail;

      if (favoritePokemonList.contains(pokemonDetail)) {
        favoritePokemonList.remove(pokemonDetail);
      } else {
        favoritePokemonList.add(pokemonDetail);
      }

      SharedPref sharedPref = SharedPref();
      sharedPref.savePokemonData(favoritePokemonList: favoritePokemonList);
    });

    on<FetchFavoritePokemon>((event, emit) async {
      favoritePokemonList.clear();
      SharedPref sharedPref = SharedPref();
      var list = await sharedPref.retrievePokemonData();
      favoritePokemonList.addAll(list);

      emit(
        PokemonListingFetchedState(
            isPaginating: false,
            pokemonList: favoritePokemonList,
            totalItem: favoritePokemonList.length),
      );
    });
  }
}
