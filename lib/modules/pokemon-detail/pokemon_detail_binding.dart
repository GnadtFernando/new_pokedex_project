import 'package:get/get.dart';
import 'package:new_pokedex_project/modules/pokemon-detail/pokemon_detail_controller.dart';

class PokemonDetailBinding extends Bindings {
  @override
  void dependencies() {
    final args = Get.arguments;
    final url = args != null ? args['url'] as String? : null;

    Get.put<PokemonDetailController>(
      PokemonDetailController(pokemonUrl: url?.obs),
    );
  }
}
