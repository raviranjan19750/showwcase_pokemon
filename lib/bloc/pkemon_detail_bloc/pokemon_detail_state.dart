import 'package:equatable/equatable.dart';
import 'package:pokemon/api/model/pokemon/pokemon_detail.dart';

abstract class PokemonDetailState extends Equatable {}

class InitialPokemonDetailState extends PokemonDetailState {
  @override
  List<Object?> get props => [];
}

class LoadingState extends PokemonDetailState {
  @override
  List<Object?> get props => [];
}

class FetchedState extends PokemonDetailState {
  final PokemonDetail pokemon;

  FetchedState({required this.pokemon});

  @override
  List<Object?> get props => [pokemon];
}
