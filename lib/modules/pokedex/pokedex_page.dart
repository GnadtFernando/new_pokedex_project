import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:new_pokedex_project/common/routes/app_routes.dart';
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
          padding: EdgeInsets.only(left: 10.w),
          child: Text(
            'Pokedéx',
            style: TextStyle(color: Colors.white, fontSize: 24.sp),
          ),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 12.h),
        child: Obx(() {
          if (controller.isLoading.value) {
            return Center(
              child: Lottie.asset(
                'assets/lottie_file/pokeball_animation.json',
                width: 100.w,
                height: 100.h,
                fit: BoxFit.fill,
              ),
            );
          }

          if (controller.pokemonList.isEmpty) {
            return ErrorCustomWidget();
          }

          return Column(
            children: [
              Expanded(flex: 1, child: SerchCustomInputWidget()),
              Expanded(
                flex: 16,
                child: RefreshIndicator(
                  onRefresh: () => controller.fetchPokemonList(),
                  child: GridView.builder(
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      crossAxisSpacing: 12.w,
                      mainAxisSpacing: 12.h,
                    ),
                    itemCount: controller.pokemonList.length,
                    itemBuilder: (context, index) {
                      final e = controller.pokemonList[index];
                      return GestureDetector(
                        onTap: () {
                          Get.toNamed(
                            AppRoutes.pokemonDetail,
                            arguments: {'url': e.url},
                          );
                        },
                        child: PokemonItemWidget(pokemon: e, index: index),
                      );
                    },
                  ),
                ),
              ),
            ],
          );
        }),
      ),
    );
  }
}
