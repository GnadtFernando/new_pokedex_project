import 'dart:developer';

import 'package:get/get.dart';
import 'package:new_pokedex_project/common/models/pokemon_detail_response.dart';
import 'package:new_pokedex_project/common/services/pokemon-detail-service/pokemon_detail_service.dart';

class PokemonDetailController extends GetxController {
  final PokemonDetailService _pokemonDetailService;
  final RxBool isLoading = true.obs;
  final RxString? pokemonUrl;
  final Rx<PokemonDetailResponse?> pokemonDetail = Rx<PokemonDetailResponse?>(
    null,
  );

  PokemonDetailController({
    required this.pokemonUrl,
    PokemonDetailService? pokemonDetailService,
  }) : _pokemonDetailService = pokemonDetailService ?? PokemonDetailService();

  @override
  void onInit() {
    super.onInit();
    if (pokemonUrl == null || pokemonUrl!.isEmpty) {
      isLoading.value = false;
      return;
    }
    fetchPokemonDetail();
  }

  Future<void> fetchPokemonDetail() async {
    try {
      isLoading.value = true;
      final result = await _pokemonDetailService.fetchPokemonList(
        url: pokemonUrl!.value,
      );

      if (result == null) {
        pokemonDetail.value = null;
      } else {
        pokemonDetail.value = result;
      }
    } catch (e, st) {
      log('Pokemon detail: $e', stackTrace: st);
      pokemonDetail.value = null;
    } finally {
      isLoading.value = false;
    }
  }
}
