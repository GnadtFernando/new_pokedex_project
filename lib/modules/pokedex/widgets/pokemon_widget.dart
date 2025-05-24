import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:new_pokedex_project/common/consts/app_colors.dart';
import 'package:new_pokedex_project/common/models/pokedex_response.dart';

class PokemonItemWidget extends StatelessWidget {
  final PokemonData pokemon;
  final int index;

  const PokemonItemWidget({
    super.key,
    required this.pokemon,
    required this.index,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          decoration: BoxDecoration(
            color: AppColors.base,
            borderRadius: BorderRadius.circular(16.r),
          ),
          child: Padding(
            padding: EdgeInsets.all(12.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Flexible(
                      child: Text(
                        pokemon.name ?? '',
                        style: TextStyle(
                          color: AppColors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 16.sp,
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 12.h),
                // Espaço reservado para a imagem
                Align(
                  alignment: Alignment.bottomRight,
                  child: SizedBox(
                    width: 100.w,
                    height: 100.h,
                    child: CachedNetworkImage(
                      imageUrl: pokemon.imageUrl ?? '',
                      fit: BoxFit.contain,
                      placeholder: (context, url) => Center(
                        child: CircularProgressIndicator(strokeWidth: 2),
                      ),
                      errorWidget: (context, url, error) => Icon(Icons.error),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
