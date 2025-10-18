// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'favorite_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

FavoriteResponseModel _$FavoriteResponseModelFromJson(
  Map<String, dynamic> json,
) => FavoriteResponseModel(
  id: (json['id'] as num).toInt(),
  userId: json['user_id'] as String,
  imageId: json['image_id'] as String,
  subId: json['sub_id'] as String,
  createdAt: json['created_at'] as String,
  image: FavoriteImage.fromJson(json['image'] as Map<String, dynamic>),
);

Map<String, dynamic> _$FavoriteResponseModelToJson(
  FavoriteResponseModel instance,
) => <String, dynamic>{
  'id': instance.id,
  'user_id': instance.userId,
  'image_id': instance.imageId,
  'sub_id': instance.subId,
  'created_at': instance.createdAt,
  'image': instance.image,
};

FavoriteImage _$FavoriteImageFromJson(Map<String, dynamic> json) =>
    FavoriteImage(id: json['id'] as String?, url: json['url'] as String?);

Map<String, dynamic> _$FavoriteImageToJson(FavoriteImage instance) =>
    <String, dynamic>{'id': instance.id, 'url': instance.url};
