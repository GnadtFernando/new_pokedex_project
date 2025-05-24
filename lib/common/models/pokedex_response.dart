import 'dart:convert';

PokedexResponse pokedexResponseFromJson(String str) =>
    PokedexResponse.fromJson(json.decode(str));

String pokedexResponseToJson(PokedexResponse data) =>
    json.encode(data.toJson());

class PokedexResponse {
  List<PokemonData>? results;

  PokedexResponse({this.results});

  factory PokedexResponse.fromJson(Map<String, dynamic> json) =>
      PokedexResponse(
        results: json["results"] == null
            ? []
            : List<PokemonData>.from(
                json["results"]!.map((x) => PokemonData.fromJson(x)),
              ),
      );

  Map<String, dynamic> toJson() => {
    "results": results == null
        ? []
        : List<dynamic>.from(results!.map((x) => x.toJson())),
  };
}

class PokemonData {
  String? name;
  String? url;
  String? imageUrl;

  PokemonData({this.name, this.url, this.imageUrl});

  factory PokemonData.fromJson(Map<String, dynamic> json) =>
      PokemonData(name: json["name"], url: json["url"]);

  Map<String, dynamic> toJson() => {"name": name, "url": url};
}
