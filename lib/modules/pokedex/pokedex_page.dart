import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:new_pokedex_project/common/widgets/error_custom_widget.dart';
import 'package:new_pokedex_project/common/widgets/serch_custom_input_widget.dart';
import 'package:new_pokedex_project/modules/pokedex/pokedex_controller.dart';
import 'package:new_pokedex_project/modules/pokedex/widgets/pokemon_widget.dart';

class PokedexPage extends GetView<PokedexController> {
  const PokedexPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.red,
        centerTitle: false,
        title: Padding(
          padding: EdgeInsets.only(left: 10),
          child: Text(
            'Pokedéx',
            style: TextStyle(color: Colors.white, fontSize: 24.sp),
          ),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 12.h),
        child: Obx(
          () => controller.isLoading.isTrue
              ? Center(
                  child: Lottie.asset(
                    'assets/lottie_file/pokeball_animation.json',
                    width: 100.w,
                    height: 100.h,
                    fit: BoxFit.fill,
                  ),
                )
              : controller.pokemonList.isEmpty
              ? ErrorCustomWidget()
              : Column(
                  children: [
                    Expanded(flex: 1, child: SerchCustomInputWidget()),
                    Expanded(
                      flex: 16,
                      child: GridView.count(
                        crossAxisCount: 2,
                        crossAxisSpacing: 12,
                        mainAxisSpacing: 12,
                        children: controller.pokemonList
                            .map(
                              (e) => GestureDetector(
                                onTap: () {
                                  log(e.name!);
                                },
                                child: PokemonItemWidget(
                                  pokemon: e,
                                  index: controller.pokemonList.indexOf(e),
                                ),
                              ),
                            )
                            .toList(),
                      ),
                    ),
                  ],
                ),
        ),
      ),
    );
  }
}
