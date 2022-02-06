import 'package:json_annotation/json_annotation.dart';

import 'data_model.dart';

part 'valorant_model.g.dart';

@JsonSerializable(createToJson: false)
class ValorantModel {
  int? status;
  List<Data>? data;

  ValorantModel({
    this.status,
    this.data,
  });

  factory ValorantModel.fromJson(Map<String, dynamic> json) {
    return _$ValorantModelFromJson(json);
  }
}
