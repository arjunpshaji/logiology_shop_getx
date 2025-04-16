import 'package:freezed_annotation/freezed_annotation.dart';

part 'dimension_model.freezed.dart';
part 'dimension_model.g.dart';

@freezed
class Dimensions with _$Dimensions {
  const factory Dimensions({
    required double width,
    required double height,
    required double depth,
  }) = _Dimensions;

  factory Dimensions.fromJson(Map<String, dynamic> json) =>
      _$DimensionsFromJson(json);
}