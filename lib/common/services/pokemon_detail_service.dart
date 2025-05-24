import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:new_pokedex_project/common/models/pokemon_detail_response.dart';

class PokemonDetailService {
  final Dio _dio;

  PokemonDetailService({Dio? dio}) : _dio = dio ?? Dio();

  Future<PokemonDetailResponse?> fetchPokemonList({required String url}) async {
    try {
      final response = await _dio.get(url);
      if (response.statusCode != 200) {
        return null;
      }
      return PokemonDetailResponse.fromJson(response.data);
    } on DioException catch (e) {
      log(e.toString());
      return null;
    }
  }
}
