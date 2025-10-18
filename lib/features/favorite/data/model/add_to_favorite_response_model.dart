import 'package:json_annotation/json_annotation.dart';

part 'add_to_favorite_response_model.g.dart';

@JsonSerializable()
class AddToFavoriteResponseModel {
  final String message;
  final int id;
  AddToFavoriteResponseModel({required this.message, required this.id});
  factory AddToFavoriteResponseModel.fromJson(Map<String, dynamic> json) =>
      _$AddToFavoriteResponseModelFromJson(json);
  Map<String, dynamic> toJson() => _$AddToFavoriteResponseModelToJson(this);
}
