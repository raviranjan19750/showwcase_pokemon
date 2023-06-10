import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pokemon/api/model/pokemon/pokemon_list_details.dart';
import 'package:pokemon/bloc/pkemon_detail_bloc/pokemon_detail_state.dart';
import 'package:pokemon/bloc/pokemon_listing_bloc/pokemon_listing_bloc.dart';
import 'package:pokemon/bloc/pokemon_listing_bloc/pokemon_listing_event.dart';
import 'package:pokemon/bloc/pokemon_listing_bloc/pokemon_listing_state.dart';
import 'package:pokemon/screens/pokemon_listing_screen/widgets/pokemon_item.dart';
import 'package:pokemon/utils/navigator/app_routes.dart';
import 'package:pokemon/utils/pagination_mixin.dart';

class PokemonListingScreen extends StatefulWidget {
  const PokemonListingScreen({super.key});

  @override
  State<PokemonListingScreen> createState() => _PokemonListingScreenState();
}

class _PokemonListingScreenState extends State<PokemonListingScreen>
    with PaginationMixin {
  late PokemonListingBloc bloc;

  List<PokemonListDetail> pokemonList = [];

  @override
  void initState() {
    bloc = BlocProvider.of<PokemonListingBloc>(context);
    initListener();
    reloadData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(

        backgroundColor: Colors.transparent,
        body: BlocBuilder<PokemonListingBloc, PokemonListingState>(
          builder: (_, state) {
            if (state is LoadingState) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }

            if (state is PokemonListingFetchedState) {
              if (!state.isPaginating) {
                totalItems = state.totalItem;

                if (currentPage == 1) {
                  pokemonList.clear();
                }

                pokemonList.addAll(state.pokemonList);

                currentPageLength = pokemonList.length;
              }

              return Column(
                children: [

                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                    height: 56,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      border: Border.all(
                        color: Theme.of(context).dividerColor,
                        width: 1,
                      ),
                      borderRadius:
                      const BorderRadius.all(Radius.circular(12)),
                    ),
                    child: Row(
                      children: [
                        const Icon(Icons.search),
                        const SizedBox(width: 8,),
                        Expanded(
                          child: TextField(
                            cursorColor: Colors.black,
                            style: const TextStyle(
                              fontSize: 14,
                              color: Colors.grey,
                            ),
                            decoration: const InputDecoration(
                              border: InputBorder.none,
                              hintText: "Search pokemon by name",
                              hintStyle: TextStyle(
                                color: Colors.grey
                              )
                            ),
                            onChanged: (query){
                              bloc.add(SearchPokemonListing(searchQuery: query));
                            },
                          ),
                        ),
                      ],
                    ),
                  ),

                  const SizedBox(height: 16,),
                  Expanded(

                    child: ListView.builder(
                        itemCount: pokemonList.length,
                        controller: scrollController,
                        shrinkWrap: true,
                        itemBuilder: (_, index) {
                          PokemonListDetail detail = pokemonList.elementAt(index);

                          return InkWell(
                            onTap: (){
                              navigateToNamedRoute(
                                  name: AppRoutes.pokemonDetailsScreen,
                                  arguments: detail)?.then((value) {
                                    if (value == true) {
                                      bloc.add(MarkAsFavoritePokemon(pokemonDetail: detail));

                                    }
                              });
                            },
                            child: PokemonItem(
                              pokemonImageURL: detail.url,
                              pokemonName: detail.name,
                            ),
                          );
                        }),
                  ),
                  Visibility(
                      visible: state.isPaginating,
                      child: const Padding(
                        padding: EdgeInsets.all(16),
                        child: Center(
                          child: CircularProgressIndicator(),
                        ),
                      ))
                ],
              );
            }

            return const SizedBox();
          },
        ),
      ),
    );
  }

  @override
  Future<void> reloadData() async {
    await super.reloadData();
    bloc.add(FetchPokemonListing(limit: limit, offset: currentPageLength));
  }
}
