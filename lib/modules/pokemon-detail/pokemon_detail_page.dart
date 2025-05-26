import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:new_pokedex_project/common/consts/assets_strings.dart';
import 'package:new_pokedex_project/common/widgets/error_custom_widget.dart';
import 'package:new_pokedex_project/modules/pokemon-detail/pokemon_detail_controller.dart';
import 'package:new_pokedex_project/modules/pokemon-detail/widgets/pokemon_detail_widget.dart';

class PokemonDetailPage extends GetView<PokemonDetailController> {
  const PokemonDetailPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Obx(() {
        if (controller.isLoading.value) {
          return Center(
            child: Lottie.asset(
              AssetsStrings.pokeballAnimation,
              width: 100.w,
              height: 100.h,
              fit: BoxFit.fill,
            ),
          );
        }

        if (controller.pokemonDetail.value == null) {
          return const ErrorCustomWidget();
        }

        return PokemonDetailWidget(pokemon: controller.pokemonDetail.value);
      }),
    );
  }
}
