import 'dart:developer';

import 'package:get/get.dart';
import 'package:new_pokedex_project/common/models/pokemon_detail_response.dart';
import 'package:new_pokedex_project/common/services/pokemon_detail_service.dart';

class PokemonDetailController extends GetxController {
  RxBool isLoading = true.obs;
  final _pokemonDetailService = PokemonDetailService();
  RxString pokemonUrl = ''.obs;
  Rx<PokemonDetailResponse?> pokemonDetail = PokemonDetailResponse().obs;

  @override
  void onInit() async {
    Get.arguments != null
        ? pokemonUrl.value = Get.arguments['url']
        : log('Error: Pokemon URL is null');
    await fetchPokemonDetail();
    isLoading.value = false;
    super.onInit();
  }

  Future<void> fetchPokemonDetail() async {
    final result = await _pokemonDetailService.fetchPokemonList(
      url: pokemonUrl.value,
    );
    pokemonDetail.value = result;
  }
}
