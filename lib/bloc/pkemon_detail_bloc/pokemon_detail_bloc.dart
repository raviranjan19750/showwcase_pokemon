import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pokemon/api/model/pokemon/pokemon_detail.dart';
import 'package:pokemon/api/services/pokemon_service.dart';
import 'package:pokemon/bloc/pkemon_detail_bloc/pokemon_detail_event.dart';
import 'package:pokemon/bloc/pkemon_detail_bloc/pokemon_detail_state.dart';

class PokemonDetailBloc extends Bloc<PokemonDetailEvent, PokemonDetailState>
    with PokemonService {
  PokemonDetailBloc() : super(InitialPokemonDetailState()) {
    on<FetchPokemonDetail>((event, emit) async {
      emit(LoadingState());

      PokemonDetail detail = await getPokemonById(id: event.id);

      emit(FetchedState(pokemon: detail));
    });
  }
}
