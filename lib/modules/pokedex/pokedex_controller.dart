import 'dart:developer';

import 'package:get/get.dart';
import 'package:new_pokedex_project/common/models/pokedex_response.dart';
import 'package:new_pokedex_project/common/services/pokedex_service.dart';

class PokedexController extends GetxController {
  RxBool isLoading = true.obs;
  final _pokedexService = PokedexService();
  RxList<PokemonData> pokemonList = <PokemonData>[].obs;

  @override
  void onInit() async {
    log('Pagina pokedex iniciado');
    await fetchPokemonList();
    isLoading.value = false;
    super.onInit();
  }

  Future<void> fetchPokemonList() async {
    final result = await _pokedexService.fetchPokemonList();
    pokemonList.value = result;
    log('Pokemons: ${pokemonList.length}');
  }
}
