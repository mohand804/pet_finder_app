// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'add_to_favorite_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AddToFavoriteResponseModel _$AddToFavoriteResponseModelFromJson(
  Map<String, dynamic> json,
) => AddToFavoriteResponseModel(
  message: json['message'] as String,
  id: (json['id'] as num).toInt(),
);

Map<String, dynamic> _$AddToFavoriteResponseModelToJson(
  AddToFavoriteResponseModel instance,
) => <String, dynamic>{'message': instance.message, 'id': instance.id};
