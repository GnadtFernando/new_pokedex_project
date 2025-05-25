import 'dart:developer';
import 'package:flutter/foundation.dart';
import 'package:dio/dio.dart';
import 'package:new_pokedex_project/common/consts/base_url.dart';
import 'package:new_pokedex_project/common/models/pokedex_response.dart';
import 'package:new_pokedex_project/common/services/pokedex-service/pokedex_parser.dart';
import 'package:pool/pool.dart';

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

      final List<PokemonData> baseList = await compute(
        parsePokemonData,
        response.data as Map<String, dynamic>,
      );

      final pool = Pool(12);
      final futures = baseList.map((pokemon) async {
        return pool.withResource(() => fetchPokemonDetails(pokemon));
      });

      final detailedList = await Future.wait(futures);
      await pool.close();

      return detailedList;
    } catch (e) {
      log(e.toString());
      return List<PokemonData>.empty();
    }
  }

  Future<PokemonData> fetchPokemonDetails(PokemonData pokemon) async {
    try {
      if (pokemon.url == null) return pokemon;
      final response = await _dio.get(pokemon.url!);

      final imageUrl = response.data["sprites"]["front_default"] as String?;
      final id = response.data["id"] as int?;
      return pokemon.copyWith(imageUrl: imageUrl, id: id);
    } catch (e) {
      log('Erro ao buscar detalhes de ${pokemon.name}: $e');
      return pokemon;
    }
  }
}
