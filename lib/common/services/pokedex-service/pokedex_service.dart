import 'dart:developer';
import 'package:flutter/foundation.dart';
import 'package:dio/dio.dart';
import 'package:new_pokedex_project/common/consts/base_url.dart';
import 'package:new_pokedex_project/common/models/pokedex_response.dart';
import 'package:new_pokedex_project/common/services/pokedex-service/pokedex_parser.dart';
import 'package:pool/pool.dart';

class PokedexService {
  final Dio _dio;
  final Map<String, PokemonData> _cache = {};

  static const int _concurrentLimit = 15;

  PokedexService({Dio? dio}) : _dio = dio ?? Dio();

  Future<List<PokemonData>> fetchPokemonList() async {
    try {
      final response = await _dio.get(BaseUrl.apiUrl);

      if (response.statusCode != 200) return [];

      final List<PokemonData> baseList = await compute(
        parsePokemonData,
        response.data as Map<String, dynamic>,
      );

      final pool = Pool(_concurrentLimit);
      final List<Future<PokemonData>> futures = baseList.map((pokemon) {
        return pool.withResource(() => fetchPokemonImgAndId(pokemon));
      }).toList();

      final detailedList = await Future.wait(futures);
      await pool.close();

      return detailedList;
    } catch (e, stack) {
      log('Erro ao buscar lista de pokémons: $e');
      debugPrintStack(stackTrace: stack);
      return [];
    }
  }

  Future<PokemonData> fetchPokemonImgAndId(PokemonData pokemon) async {
    final name = pokemon.name;
    if (name.isEmpty) return pokemon;
    if (_cache.containsKey(name)) {
      return _cache[name]!;
    }
    try {
      final urlPokemon = '${BaseUrl.urlPokemon}${name.toLowerCase()}';
      final response = await _dio.get(urlPokemon);

      final imageUrl = response.data["sprites"]["front_default"] as String?;
      final id = response.data["id"] as int?;

      final detailedPokemon = pokemon.copyWith(imageUrl: imageUrl, id: id);
      _cache[name] = detailedPokemon;
      return detailedPokemon;
    } catch (e, stack) {
      log('Erro ao buscar detalhes de $name: $e');
      debugPrintStack(stackTrace: stack);
      return pokemon;
    }
  }
}
