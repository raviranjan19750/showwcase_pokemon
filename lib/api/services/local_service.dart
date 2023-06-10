


import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../utils/shared_prefrences_key.dart';
import '../model/pokemon/pokemon_list_details.dart';


class SharedPref {
  SharedPref();

  saveLoginData({required String username, required String password}) async {

    try{
      final instance =
      await SharedPreferences.getInstance();
      instance.setString(SharedPreferenceKey.userName, username);
      instance.setString(SharedPreferenceKey.password, password);
    }catch(e){
      debugPrint(e.toString());
    }
  }

  Future<bool> isUserLoggedIn() async{

    try{
      final instance =
      await SharedPreferences.getInstance();
      if(!instance.containsKey(SharedPreferenceKey.userName) || instance.getString(SharedPreferenceKey.userName) == null) {
        return false;
      }

    }catch(e){
      debugPrint(e.toString());
    }

    return true;
  }

  savePokemonData({required List<PokemonListDetail> favoritePokemonList})async {

    try{
      final instance = await SharedPreferences.getInstance();
      String jsonString = jsonEncode(favoritePokemonList);
      await instance.setString("data", jsonString);
    }catch(e){
      debugPrint(e.toString());
    }

  }

  Future<List<PokemonListDetail>> retrievePokemonData() async{

    final instance = await SharedPreferences.getInstance();
    String? jsonString = instance.getString("data");
    List<dynamic> mapData = jsonDecode(jsonString??"[]");

    List<PokemonListDetail> pokemonDetailList = mapData.map((e) => PokemonListDetail.fromJson(e)).toList();
    return pokemonDetailList;

  }

  Future<bool> clearData() async {
    final instance = await SharedPreferences.getInstance();
    return instance.clear();
  }

  Future<bool> containsData() async{
    final instance = await SharedPreferences.getInstance();
    String? data = instance.getString('data');
    List<dynamic> mapData = jsonDecode(data??"[]");

    List<PokemonListDetail> petDataList = mapData.map((e) => PokemonListDetail.fromJson(e)).toList();
    if (petDataList.isEmpty) {
      return false;
    } else {
      return true;
    }
  }
}