import 'package:json_annotation/json_annotation.dart';

part 'favorite_response_model.g.dart';

@JsonSerializable()
class FavoriteResponseModel {
  final int id;
  @JsonKey(name: 'user_id')
  final String userId;
  @JsonKey(name: 'image_id')
  final String imageId;
  @JsonKey(name: 'sub_id')
  final String subId;
  @JsonKey(name: 'created_at')
  final String createdAt;
  final FavoriteImage image;

  FavoriteResponseModel({
    required this.id,
    required this.userId,
    required this.imageId,
    required this.subId,
    required this.createdAt,
    required this.image,
  });

  factory FavoriteResponseModel.fromJson(Map<String, dynamic> json) =>
      _$FavoriteResponseModelFromJson(json);
  Map<String, dynamic> toJson() => _$FavoriteResponseModelToJson(this);
}

@JsonSerializable()
class FavoriteImage {
  final String? id;
  final String? url;

  FavoriteImage({this.id, this.url});

  factory FavoriteImage.fromJson(Map<String, dynamic> json) =>
      _$FavoriteImageFromJson(json);
  Map<String, dynamic> toJson() => _$FavoriteImageToJson(this);
}
