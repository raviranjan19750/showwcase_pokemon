abstract class PokemonDetailEvent {}

class FetchPokemonDetail extends PokemonDetailEvent {
  final int id;
  FetchPokemonDetail({required this.id});
}
