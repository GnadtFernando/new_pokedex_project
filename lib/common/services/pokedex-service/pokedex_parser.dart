import 'package:new_pokedex_project/common/models/pokedex_response.dart';

List<PokemonData> parsePokemonData(Map<String, dynamic> json) {
  final results = json['results'] as List<dynamic>;
  return results.asMap().entries.map((entry) {
    final index = entry.key;
    final item = entry.value as Map<String, dynamic>;

    final pokemon = PokemonData.fromJson(item);
    pokemon.imageUrl =
        'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/${index + 1}.png';

    return pokemon;
  }).toList();
}
