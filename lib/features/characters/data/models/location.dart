import 'package:rick_and_morty_app/core/utils/api_const.dart';

class Location {
  final String name;
  Location({required this.name});
  factory Location.fromJson(jsonFile) {
    return Location(name: jsonFile[ApiKeys.name]);
  }
}
