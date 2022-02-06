// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'voiceline_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

VoiceLine _$VoiceLineFromJson(Map<String, dynamic> json) => VoiceLine(
      minDuration: (json['minDuration'] as num?)?.toDouble(),
      maxDuration: (json['maxDuration'] as num?)?.toDouble(),
      mediaList: (json['mediaList'] as List<dynamic>?)
          ?.map((e) => MediaList.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
