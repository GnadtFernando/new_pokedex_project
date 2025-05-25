import 'package:new_pokedex_project/common/models/pokedex_response.dart';

List<PokemonData> parsePokemonData(Map<String, dynamic> json) {
  final results = json['results'] as List<dynamic>? ?? [];
  return results.map((item) {
    final pokemonMap = item as Map<String, dynamic>? ?? {};
    return PokemonData.fromJson(pokemonMap);
  }).toList();
}
