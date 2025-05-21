import 'package:hive/hive.dart';
import 'package:rick_and_morty_app/core/utils/api_const.dart';

part 'location.g.dart';

@HiveType(typeId: 2)
class Location {
  @HiveField(0)
  final String name;
  Location({required this.name});
  factory Location.fromJson(jsonFile) {
    return Location(name: jsonFile[ApiKeys.name]);
  }
}
