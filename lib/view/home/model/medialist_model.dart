import 'package:json_annotation/json_annotation.dart';

part 'medialist_model.g.dart';

@JsonSerializable(createToJson: false)
class MediaList {
  int? id;
  String? wwise;
  String? wave;

  MediaList({this.id, this.wwise, this.wave});

  factory MediaList.fromJson(Map<String, dynamic> json) {
    return _$MediaListFromJson(json);
  }
}
