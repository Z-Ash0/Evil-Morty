import 'package:rick_and_morty_app/core/utils/api.dart';

class CharactersModel {
  final int id;
  final String name;
  final String status;
  final String kind;
  final String gender;
  final String? type;
  final String image;
  final List<dynamic> episodes;
  final Origin origin;
  final Location location;

  CharactersModel(
      {required this.id,
      required this.name,
      required this.status,
      required this.kind,
      required this.gender,
      required this.type,
      required this.image,
      required this.episodes,
      required this.origin,
      required this.location});

  factory CharactersModel.fromJson(Map<String, dynamic> jsonFile) {
    return CharactersModel(
      id: jsonFile[Api.id],
      name: jsonFile[Api.name],
      status: jsonFile[Api.status],
      kind: jsonFile[Api.species],
      gender: jsonFile[Api.gender],
      type: jsonFile[Api.type],
      image: jsonFile[Api.image],
      episodes: jsonFile[Api.episode],
      origin: Origin.fromJson(jsonFile[Api.origin]),
      location: Location.fromJson(jsonFile[Api.location]),
    );
  }
}

class Origin {
  final String name;
  Origin({required this.name});
  factory Origin.fromJson(jsonFile) {
    return Origin(name: jsonFile[Api.name]);
  }
}

class Location {
  final String name;
  Location({required this.name});
  factory Location.fromJson(jsonFile) {
    return Location(name: jsonFile[Api.name]);
  }
}
