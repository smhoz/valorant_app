import 'package:json_annotation/json_annotation.dart';

import 'medialist_model.dart';

part 'voiceline_model.g.dart';

@JsonSerializable(createToJson: false)
class VoiceLine {
  double? minDuration;
  double? maxDuration;
  List<MediaList>? mediaList;

  VoiceLine({this.minDuration, this.maxDuration, this.mediaList});

  factory VoiceLine.fromJson(Map<String, dynamic> json) {
    return _$VoiceLineFromJson(json);
  }
}
