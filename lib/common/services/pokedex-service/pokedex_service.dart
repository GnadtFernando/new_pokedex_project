import 'dart:developer';
import 'package:flutter/foundation.dart';
import 'package:dio/dio.dart';
import 'package:new_pokedex_project/common/consts/base_url.dart';
import 'package:new_pokedex_project/common/models/pokedex_response.dart';
import 'package:new_pokedex_project/common/services/pokedex-service/pokedex_parser.dart';

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

      return await compute<Map<String, dynamic>, List<PokemonData>>(
        parsePokemonData,
        response.data as Map<String, dynamic>,
      );
    } on DioException catch (e) {
      log(e.toString());
      return List<PokemonData>.empty();
    }
  }
}
