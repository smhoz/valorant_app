// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'valorant_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ValorantModel _$ValorantModelFromJson(Map<String, dynamic> json) =>
    ValorantModel(
      status: json['status'] as int?,
      data: (json['data'] as List<dynamic>?)
          ?.map((e) => Data.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
