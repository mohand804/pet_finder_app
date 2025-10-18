import 'package:json_annotation/json_annotation.dart';

part 'favorite_requset_model.g.dart';

@JsonSerializable()
class FavoriteRequestModel {
  @JsonKey(name: 'image_id')
  final String imageId;
  @JsonKey(name: 'sub_id')
  final String subId;
  FavoriteRequestModel({required this.imageId, required this.subId});
  factory FavoriteRequestModel.fromJson(Map<String, dynamic> json) =>
      _$FavoriteRequestModelFromJson(json);
  Map<String, dynamic> toJson() => _$FavoriteRequestModelToJson(this);
}
