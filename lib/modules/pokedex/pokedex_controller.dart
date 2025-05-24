import 'dart:developer';

import 'package:get/get.dart';
import 'package:new_pokedex_project/common/models/pokedex_response.dart';
import 'package:new_pokedex_project/common/services/pokedex-service/pokedex_service.dart';

class PokedexController extends GetxController {
  final RxBool isLoading = false.obs;
  final PokedexService _pokedexService;
  final RxList<PokemonData> pokemonList = <PokemonData>[].obs;

  PokedexController({required PokedexService pokedexService})
    : _pokedexService = pokedexService;

  @override
  void onInit() {
    super.onInit();
    log('Pagina pokedex iniciado');
    fetchPokemonList();
  }

  Future<void> fetchPokemonList() async {
    if (isLoading.value) return;
    isLoading.value = true;
    try {
      final result = await _pokedexService.fetchPokemonList();
      pokemonList.assignAll(result);
      log('Pokemons: ${pokemonList.length}');
    } catch (e, st) {
      log('Erro ao buscar pokemons: $e', stackTrace: st);
    } finally {
      isLoading.value = false;
    }
  }
}
