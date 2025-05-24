import 'dart:developer';

import 'package:get/get.dart';
import 'package:new_pokedex_project/common/models/pokemon_detail_response.dart';
import 'package:new_pokedex_project/common/services/pokemon-detail-service/pokemon_detail_service.dart';

class PokemonDetailController extends GetxController {
  final PokemonDetailService _pokemonDetailService;
  final RxBool isLoading = true.obs;
  final RxString _pokemonUrl;
  final Rx<PokemonDetailResponse?> pokemonDetail = Rx<PokemonDetailResponse?>(
    null,
  );

  String get pokemonUrl => _pokemonUrl.value;

  PokemonDetailController({
    required String pokemonUrl,
    PokemonDetailService? pokemonDetailService,
  }) : _pokemonUrl = pokemonUrl.obs,
       _pokemonDetailService = pokemonDetailService ?? PokemonDetailService();

  @override
  void onInit() {
    super.onInit();
    if (_pokemonUrl.value.isEmpty) {
      isLoading.value = false;
      return;
    }
    fetchPokemonDetail();
  }

  Future<void> fetchPokemonDetail() async {
    try {
      isLoading.value = true;
      final result = await _pokemonDetailService.fetchPokemonList(
        url: _pokemonUrl.value,
      );

      pokemonDetail.value = result;
    } catch (e, st) {
      log('Pokemon detail: $e', stackTrace: st);
      pokemonDetail.value = null;
    } finally {
      isLoading.value = false;
    }
  }
}
