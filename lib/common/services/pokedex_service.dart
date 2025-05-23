import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:new_pokedex_project/common/consts/base_url.dart';
import 'package:new_pokedex_project/common/models/pokedex_response.dart';

class PokedexService {
  final Dio _dio;

  PokedexService({Dio? dio}) : _dio = dio ?? Dio();

  Future<List<PokemonData>> fetchPokemonList() async {
    final String baseUrl = BaseUrl.apiUrl;

    try {
      final response = await _dio.get(baseUrl);
      if (response.statusCode != 200) {
        return List<PokemonData>.empty();
      }
      return PokedexResponse.fromJson(response.data).results ??
          List<PokemonData>.empty();
    } on DioException catch (e) {
      log(e.toString());
      return List<PokemonData>.empty();
    }
  }
}
