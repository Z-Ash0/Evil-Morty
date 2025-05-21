import 'package:hive/hive.dart';
import 'package:rick_and_morty_app/core/utils/api_const.dart';

part 'origin.g.dart';

@HiveType(typeId: 1)
class Origin {
  @HiveField(0)
  final String name;
  Origin({required this.name});
  factory Origin.fromJson(jsonFile) {
    return Origin(name: jsonFile[ApiKeys.name]);
  }
}
