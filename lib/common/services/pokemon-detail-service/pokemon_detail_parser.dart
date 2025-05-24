import 'package:new_pokedex_project/common/models/pokemon_detail_response.dart';

PokemonDetailResponse parsePokemonDetailResponse(Map<String, dynamic> json) {
  return PokemonDetailResponse.fromJson(json);
}
