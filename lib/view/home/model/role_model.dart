import 'package:freezed_annotation/freezed_annotation.dart';

part 'role_model.g.dart';

@JsonSerializable(createToJson: false)
class Role {
  String? uuid;
  String? displayName;
  String? description;
  String? displayIcon;
  String? assetPath;

  Role(
      {this.uuid,
      this.displayName,
      this.description,
      this.displayIcon,
      this.assetPath});

  factory Role.fromJson(Map<String, dynamic> json) {
    return _$RoleFromJson(json);
  }
}
