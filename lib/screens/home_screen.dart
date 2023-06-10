

import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:pokemon/screens/pokemon_listing_screen/pokemon_listing_screen.dart';
import 'package:pokemon/utils/app_colors.dart';
import 'package:pokemon/utils/assets_images.dart';

import '../utils/navigator/app_routes.dart';
import 'favorite_pokemon_screen/favorite_pokemon_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(

        body: DefaultTabController(
            initialIndex: 0,
            length: 2,
            child: NestedScrollView(
              headerSliverBuilder: (context, value) {
                return[
                  SliverAppBar(
                    floating: true,
                    pinned: false,
                    snap: false,
                    elevation: 0,
                    flexibleSpace:  Stack(
                      clipBehavior: Clip.none,
                      children: [
                        Positioned.fill(
                          child: Container(
                            color: Colors.red.withOpacity(0.5),
                            padding: const EdgeInsets.only(top: 32),
                              child: Lottie.asset(AssetsImages.pikachuLottie, repeat: true, fit: BoxFit.scaleDown)),
                        ),
                      ],
                    ),

                    backgroundColor:  ThemeData.light().scaffoldBackgroundColor,
                    expandedHeight:150,
                  ),
                  SliverPadding(
                    padding: const EdgeInsets.all(0),
                    sliver: SliverList(
                      delegate: SliverChildListDelegate(
                          [

                          ]
                      ),
                    ),
                  )
                ];
              },
              body:  Container(
                color: Colors.red.withOpacity(0.5),
                padding: const EdgeInsets.only(top: 16),

                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [

                    const SizedBox(height: 16,),
                    Align(
                      alignment: Alignment.centerRight,
                      child: Container(

                        decoration: const BoxDecoration(
                          color: Colors.white,
                          boxShadow: [
                          ],
                          borderRadius: BorderRadius.only(
                              topRight: Radius.circular(32.0),
                              bottomRight: Radius.circular(0.0),
                              topLeft: Radius.circular(32.0),
                              bottomLeft: Radius.circular(32.0)),
                        ),
                        child:   TabBar(
                          indicatorColor: Theme.of(context).indicatorColor,
                          padding: EdgeInsets.zero,
                          indicatorPadding: EdgeInsets.zero,
                          labelPadding:
                          const EdgeInsets.symmetric(
                              horizontal: 24, vertical: 0),
                          isScrollable: true,
                          unselectedLabelColor: Colors.black45,
                          indicatorWeight: 1,
                          indicatorSize: TabBarIndicatorSize.label,
                          labelColor: primaryDark,
                          unselectedLabelStyle: const TextStyle(
                              fontWeight: FontWeight.w400,
                              fontSize: 14,
                              color: Colors.grey),
                          labelStyle:
                          const TextStyle(fontWeight: FontWeight.w500,
                              fontSize: 14),
                          tabs: const [
                            Tab(
                              text: "Pokemon",
                            ),
                            Tab(
                              text: "Favorite pokemon",
                            ),
                          ],
                        ),
                      ),
                    ),


                    Expanded(child: Container(

                      decoration:   BoxDecoration(
                        color: Colors.red.withOpacity(0.5),

                        borderRadius: const BorderRadius.only(
                            topRight: Radius.circular(0.0),
                            bottomRight: Radius.circular(0.0),
                            topLeft: Radius.circular(32.0),
                            bottomLeft: Radius.circular(0.0)),
                      ),
                      child: TabBarView(
                        children: [

                          Container(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 16, vertical: 0),
                              child:  const PokemonListingScreen()),
                          Container(
                              margin: const EdgeInsets.symmetric(
                                  horizontal: 16, vertical: 0),
                              child: const FavoritePokemonScreen())

                        ],
                      ),
                    ))
                  ],
                ),
              ),

            )
        ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endDocked,
      floatingActionButton: Padding(
        padding: const EdgeInsets.only(bottom: 8.0),
        child: FloatingActionButton(
          onPressed: () {
            navigateToNamedRoute(
                name: AppRoutes.addPokemonScreen);
          },
          backgroundColor: Colors.white,

          child: Icon(Icons.add, color: Colors.red.withOpacity(0.5),),

        ),
      ),

    );
  }
}
