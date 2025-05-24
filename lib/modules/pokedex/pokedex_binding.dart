import 'package:get/get.dart';
import 'package:new_pokedex_project/common/services/pokedex-service/pokedex_service.dart';
import 'package:new_pokedex_project/modules/pokedex/pokedex_controller.dart';

class PokedexBinding extends Bindings {
  @override
  void dependencies() {
    Get.put<PokedexService>(PokedexService());
    Get.put<PokedexController>(
      PokedexController(pokedexService: Get.find<PokedexService>()),
    );
  }
}
