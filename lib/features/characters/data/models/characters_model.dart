import 'package:hive/hive.dart';
import 'package:rick_and_morty_app/core/utils/api_const.dart';
import 'package:rick_and_morty_app/features/characters/data/models/location.dart';
import 'package:rick_and_morty_app/features/characters/data/models/origin.dart';

part 'characters_model.g.dart';

@HiveType(typeId: 0)
class CharactersModel {
  @HiveField(0)
  final int id;
  @HiveField(1)
  final String name;
  @HiveField(2)
  final String status;
  @HiveField(3)
  final String kind;
  @HiveField(4)
  final String gender;
  @HiveField(5)
  final String? type;
  @HiveField(6)
  final String image;
  @HiveField(7)
  final List<dynamic> episodes;
  @HiveField(8)
  final Origin origin;
  @HiveField(9)
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
      id: jsonFile[ApiKeys.id],
      name: jsonFile[ApiKeys.name],
      status: jsonFile[ApiKeys.status],
      kind: jsonFile[ApiKeys.species],
      gender: jsonFile[ApiKeys.gender],
      type: jsonFile[ApiKeys.type],
      image: jsonFile[ApiKeys.image],
      episodes: jsonFile[ApiKeys.episode],
      origin: Origin.fromJson(jsonFile[ApiKeys.origin]),
      location: Location.fromJson(jsonFile[ApiKeys.location]),
    );
  }
}
