import 'package:freezed_annotation/freezed_annotation.dart';

part 'abilities_model.g.dart';

@JsonSerializable(createToJson: false)
class Abilities {
  String? slot;
  String? displayName;
  String? description;
  String? displayIcon;

  Abilities({this.slot, this.displayName, this.description, this.displayIcon});

  factory Abilities.fromJson(Map<String, dynamic> json) {
    return _$AbilitiesFromJson(json);
  }
}
