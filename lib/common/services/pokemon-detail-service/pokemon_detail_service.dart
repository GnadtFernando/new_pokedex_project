import 'dart:developer';
import 'package:flutter/foundation.dart';
import 'package:dio/dio.dart';
import 'package:new_pokedex_project/common/models/pokemon_detail_response.dart';
import 'package:new_pokedex_project/common/services/pokemon-detail-service/pokemon_detail_parser.dart';

class PokemonDetailService {
  final Dio _dio;

  PokemonDetailService({Dio? dio}) : _dio = dio ?? Dio();

  Future<PokemonDetailResponse?> fetchPokemonList({required String url}) async {
    try {
      final response = await _dio.get(url);
      if (response.statusCode != 200) {
        return null;
      }
      return await compute<Map<String, dynamic>, PokemonDetailResponse>(
        parsePokemonDetailResponse,
        response.data as Map<String, dynamic>,
      );
    } on DioException catch (e) {
      log(e.toString());
      return null;
    }
  }
}
