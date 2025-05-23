import 'package:get/get.dart';
import 'package:new_pokedex_project/modules/pokedex/pokedex_controller.dart';

class PokedexBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(PokedexController());
  }
}
