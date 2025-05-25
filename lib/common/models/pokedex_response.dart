import 'dart:convert';

PokedexResponse pokedexResponseFromJson(String str) =>
    PokedexResponse.fromJson(json.decode(str));

String pokedexResponseToJson(PokedexResponse data) =>
    json.encode(data.toJson());

class PokedexResponse {
  final List<PokemonData> results;

  const PokedexResponse({required this.results});

  factory PokedexResponse.fromJson(Map<String, dynamic> json) {
    final list = json["results"] as List<dynamic>? ?? [];
    return PokedexResponse(
      results: list.map((e) => PokemonData.fromJson(e)).toList(),
    );
  }

  Map<String, dynamic> toJson() => {
    "results": results.map((x) => x.toJson()).toList(),
  };
}

class PokemonData {
  final String name;
  final String url;
  final String? imageUrl;
  final int? id;

  const PokemonData({
    required this.name,
    required this.url,
    this.imageUrl,
    this.id,
  });

  PokemonData copyWith({String? name, String? url, String? imageUrl, int? id}) {
    return PokemonData(
      name: name ?? this.name,
      url: url ?? this.url,
      imageUrl: imageUrl ?? this.imageUrl,
      id: id ?? this.id,
    );
  }

  factory PokemonData.fromJson(Map<String, dynamic> json) {
    return PokemonData(name: json["name"] ?? '', url: json["url"] ?? '');
  }

  Map<String, dynamic> toJson() => {
    "name": name,
    "url": url,
    "imageUrl": imageUrl,
    "id": id,
  };
}
