import 'package:rick_and_morty_app/core/utils/api_const.dart';

class Origin {
  final String name;
  Origin({required this.name});
  factory Origin.fromJson(jsonFile) {
    return Origin(name: jsonFile[ApiKeys.name]);
  }
}
