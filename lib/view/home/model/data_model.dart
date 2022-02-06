import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import 'abilities_model.dart';
import 'role_model.dart';
import 'voiceline_model.dart';

part 'data_model.g.dart';

@JsonSerializable(createToJson: false)
class Data {
  String? uuid;
  String? displayName;
  String? description;
  String? developerName;
  List<String>? characterTags;
  String? displayIcon;
  String? displayIconSmall;
  String? bustPortrait;
  Color? dominantColor;
  String? fullPortrait;
  String? killfeedPortrait;
  String? background;
  String? assetPath;
  bool? isFullPortraitRightFacing;
  bool? isPlayableCharacter;
  bool? isAvailableForTest;
  bool? isBaseContent;
  Role? role;
  List<Abilities>? abilities;
  VoiceLine? voiceLine;

  Data(
      {this.uuid,
      this.displayName,
      this.description,
      this.developerName,
      this.characterTags,
      this.displayIcon,
      this.displayIconSmall,
      this.bustPortrait,
      this.fullPortrait,
      this.killfeedPortrait,
      this.background,
      this.assetPath,
      this.isFullPortraitRightFacing,
      this.isPlayableCharacter,
      this.isAvailableForTest,
      this.isBaseContent,
      this.role,
      this.abilities,
      this.voiceLine,this.dominantColor});
  factory Data.fromJson(Map<String, dynamic> json) {
    return _$DataFromJson(json);
  }
}
