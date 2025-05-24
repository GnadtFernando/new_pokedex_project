import 'package:get/get.dart';
import 'package:new_pokedex_project/modules/pokemon-detail/pokemon_detail_controller.dart';

class PokemonDetailBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(PokemonDetailController());
  }
}
