import 'dart:convert';
import 'dart:developer';

import 'package:basic_pokemon_card_list/models/pokemon_resp_model.dart';
import 'package:basic_pokemon_card_list/service/service_provider.dart';
import 'package:flutter/material.dart';

class HomeProvider extends ChangeNotifier {
  bool loading = false;
  bool isSearch = false;
  bool hasMore = true;
  TextEditingController searchCtrl = TextEditingController();
  ServiceProvider serviceProvider = ServiceProvider();
  List<PokemonData> pokemonList = [];
  int pageNumber = 1;
  ScrollController scrollController = ScrollController();

  HomeProvider(){
    WidgetsBinding.instance.addPostFrameCallback((_) {
      scrollController.addListener(getPokemonData);
    });
    getAllPokemon(pageNumber);
  }

  getPokemonData() async{
    if (scrollController.position.pixels ==
        scrollController.position.maxScrollExtent) {
      pageNumber++;
      if(hasMore){
        await getAllPokemon(pageNumber);
      }
    }
  }


  setSearch(bool val)async{
    isSearch = val;
    pokemonList.clear();
    await getAllPokemon(1);
    notifyListeners();
  }
  setLoading(bool val){
    loading = val;
    notifyListeners();
  }

  Future<void> getAllPokemon(int pageNumber) async{
    setLoading(true);
    try{
      final url = 'https://api.pokemontcg.io/v2/cards?page=$pageNumber&pageSize=10';
      log('Url: $url');
      final resp = await serviceProvider.get(url);
      if(resp.isNotEmpty){
        final PokemonRespModel model = PokemonRespModel.fromMap(jsonDecode(resp));
        pokemonList.addAll(model.data!.toList());
        log('Resp : ${pokemonList.length}');
      }else{
        hasMore = false;
      }
    }catch(e, st){
      log('Exception : getAllPokemon: $e , $st');
    }
    setLoading(false);
  }

  Future<void> getSearchPokemonList(String name) async{
    setLoading(true);
    try{
      final url = 'https://api.pokemontcg.io/v2/cards?q=set.name:$name';
      final resp = await serviceProvider.get(url);
      if(resp.isNotEmpty){
        pokemonList.clear();
        final PokemonRespModel model = PokemonRespModel.fromMap(jsonDecode(resp));
        pokemonList.addAll(model.data!.toList());
        log('Resp : ${pokemonList.length}');
      }else{
        hasMore = false;
      }
    }catch(e, st){
      log('Exception : getAllPokemon: $e , $st');
    }
    setLoading(false);
  }



  @override
  void dispose() {
    scrollController.dispose();
    super.dispose();
  }

}
