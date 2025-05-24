import 'package:get/get.dart';
import 'package:new_pokedex_project/common/routes/app_routes.dart';
import 'package:new_pokedex_project/modules/pokedex/pokedex_binding.dart';
import 'package:new_pokedex_project/modules/pokedex/pokedex_page.dart';
import 'package:new_pokedex_project/modules/pokemon-detail/pokemon_detail_binding.dart';
import 'package:new_pokedex_project/modules/pokemon-detail/pokemon_detail_page.dart';
import 'package:new_pokedex_project/modules/splash/splash_binding.dart';
import 'package:new_pokedex_project/modules/splash/splash_page.dart';

class AppPages {
  static const initialRoute = AppRoutes.splash;

  static final routes = [
    GetPage(
      name: AppRoutes.splash,
      page: () => const SplashPage(),
      binding: SplashBinding(),
    ),
    GetPage(
      name: AppRoutes.pokedex,
      page: () => const PokedexPage(),
      binding: PokedexBinding(),
    ),
    GetPage(
      name: AppRoutes.pokemonDetail,
      page: () => const PokemonDetailPage(),
      binding: PokemonDetailBinding(),
    ),
  ];
}
