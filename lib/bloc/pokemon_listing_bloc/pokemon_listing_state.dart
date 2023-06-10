import 'package:equatable/equatable.dart';

import '../../api/model/pokemon/pokemon_list_details.dart';

abstract class PokemonListingState extends Equatable {}

class PokemonListingInitialState extends PokemonListingState {
  @override
  List<Object?> get props => [];
}

class PokemonListingLoadingState extends PokemonListingState {
  @override
  List<Object?> get props => [];
}

class PokemonListingFetchedState extends PokemonListingState {
  final int totalItem;
  final List<PokemonListDetail> pokemonList;
  final bool isPaginating;
  PokemonListingFetchedState(
      {this.pokemonList = const [],
      this.isPaginating = false,
      this.totalItem = 0});

  @override
  List<Object?> get props => [pokemonList];
}
