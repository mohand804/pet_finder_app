// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'favorite_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$FavoriteState {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is FavoriteState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'FavoriteState()';
}


}

/// @nodoc
class $FavoriteStateCopyWith<$Res>  {
$FavoriteStateCopyWith(FavoriteState _, $Res Function(FavoriteState) __);
}


/// Adds pattern-matching-related methods to [FavoriteState].
extension FavoriteStatePatterns on FavoriteState {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( _Initial value)?  initial,TResult Function( Loading value)?  loading,TResult Function( Success value)?  success,TResult Function( AddToFavoriteSuccess value)?  addToFavoriteSuccess,TResult Function( DeleteFromFavoriteSuccess value)?  deleteFromFavoriteSuccess,TResult Function( Failure value)?  failure,required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Initial() when initial != null:
return initial(_that);case Loading() when loading != null:
return loading(_that);case Success() when success != null:
return success(_that);case AddToFavoriteSuccess() when addToFavoriteSuccess != null:
return addToFavoriteSuccess(_that);case DeleteFromFavoriteSuccess() when deleteFromFavoriteSuccess != null:
return deleteFromFavoriteSuccess(_that);case Failure() when failure != null:
return failure(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( _Initial value)  initial,required TResult Function( Loading value)  loading,required TResult Function( Success value)  success,required TResult Function( AddToFavoriteSuccess value)  addToFavoriteSuccess,required TResult Function( DeleteFromFavoriteSuccess value)  deleteFromFavoriteSuccess,required TResult Function( Failure value)  failure,}){
final _that = this;
switch (_that) {
case _Initial():
return initial(_that);case Loading():
return loading(_that);case Success():
return success(_that);case AddToFavoriteSuccess():
return addToFavoriteSuccess(_that);case DeleteFromFavoriteSuccess():
return deleteFromFavoriteSuccess(_that);case Failure():
return failure(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( _Initial value)?  initial,TResult? Function( Loading value)?  loading,TResult? Function( Success value)?  success,TResult? Function( AddToFavoriteSuccess value)?  addToFavoriteSuccess,TResult? Function( DeleteFromFavoriteSuccess value)?  deleteFromFavoriteSuccess,TResult? Function( Failure value)?  failure,}){
final _that = this;
switch (_that) {
case _Initial() when initial != null:
return initial(_that);case Loading() when loading != null:
return loading(_that);case Success() when success != null:
return success(_that);case AddToFavoriteSuccess() when addToFavoriteSuccess != null:
return addToFavoriteSuccess(_that);case DeleteFromFavoriteSuccess() when deleteFromFavoriteSuccess != null:
return deleteFromFavoriteSuccess(_that);case Failure() when failure != null:
return failure(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  initial,TResult Function()?  loading,TResult Function( List<FavoriteResponseModel> favorites)?  success,TResult Function( AddToFavoriteResponseModel addToFavoriteResponseModel)?  addToFavoriteSuccess,TResult Function()?  deleteFromFavoriteSuccess,TResult Function( ApiErrorModel apiErrorModel)?  failure,required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Initial() when initial != null:
return initial();case Loading() when loading != null:
return loading();case Success() when success != null:
return success(_that.favorites);case AddToFavoriteSuccess() when addToFavoriteSuccess != null:
return addToFavoriteSuccess(_that.addToFavoriteResponseModel);case DeleteFromFavoriteSuccess() when deleteFromFavoriteSuccess != null:
return deleteFromFavoriteSuccess();case Failure() when failure != null:
return failure(_that.apiErrorModel);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  initial,required TResult Function()  loading,required TResult Function( List<FavoriteResponseModel> favorites)  success,required TResult Function( AddToFavoriteResponseModel addToFavoriteResponseModel)  addToFavoriteSuccess,required TResult Function()  deleteFromFavoriteSuccess,required TResult Function( ApiErrorModel apiErrorModel)  failure,}) {final _that = this;
switch (_that) {
case _Initial():
return initial();case Loading():
return loading();case Success():
return success(_that.favorites);case AddToFavoriteSuccess():
return addToFavoriteSuccess(_that.addToFavoriteResponseModel);case DeleteFromFavoriteSuccess():
return deleteFromFavoriteSuccess();case Failure():
return failure(_that.apiErrorModel);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  initial,TResult? Function()?  loading,TResult? Function( List<FavoriteResponseModel> favorites)?  success,TResult? Function( AddToFavoriteResponseModel addToFavoriteResponseModel)?  addToFavoriteSuccess,TResult? Function()?  deleteFromFavoriteSuccess,TResult? Function( ApiErrorModel apiErrorModel)?  failure,}) {final _that = this;
switch (_that) {
case _Initial() when initial != null:
return initial();case Loading() when loading != null:
return loading();case Success() when success != null:
return success(_that.favorites);case AddToFavoriteSuccess() when addToFavoriteSuccess != null:
return addToFavoriteSuccess(_that.addToFavoriteResponseModel);case DeleteFromFavoriteSuccess() when deleteFromFavoriteSuccess != null:
return deleteFromFavoriteSuccess();case Failure() when failure != null:
return failure(_that.apiErrorModel);case _:
  return null;

}
}

}

/// @nodoc


class _Initial implements FavoriteState {
  const _Initial();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Initial);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'FavoriteState.initial()';
}


}




/// @nodoc


class Loading implements FavoriteState {
  const Loading();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Loading);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'FavoriteState.loading()';
}


}




/// @nodoc


class Success implements FavoriteState {
  const Success(final  List<FavoriteResponseModel> favorites): _favorites = favorites;
  

 final  List<FavoriteResponseModel> _favorites;
 List<FavoriteResponseModel> get favorites {
  if (_favorites is EqualUnmodifiableListView) return _favorites;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_favorites);
}


/// Create a copy of FavoriteState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SuccessCopyWith<Success> get copyWith => _$SuccessCopyWithImpl<Success>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Success&&const DeepCollectionEquality().equals(other._favorites, _favorites));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_favorites));

@override
String toString() {
  return 'FavoriteState.success(favorites: $favorites)';
}


}

/// @nodoc
abstract mixin class $SuccessCopyWith<$Res> implements $FavoriteStateCopyWith<$Res> {
  factory $SuccessCopyWith(Success value, $Res Function(Success) _then) = _$SuccessCopyWithImpl;
@useResult
$Res call({
 List<FavoriteResponseModel> favorites
});




}
/// @nodoc
class _$SuccessCopyWithImpl<$Res>
    implements $SuccessCopyWith<$Res> {
  _$SuccessCopyWithImpl(this._self, this._then);

  final Success _self;
  final $Res Function(Success) _then;

/// Create a copy of FavoriteState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? favorites = null,}) {
  return _then(Success(
null == favorites ? _self._favorites : favorites // ignore: cast_nullable_to_non_nullable
as List<FavoriteResponseModel>,
  ));
}


}

/// @nodoc


class AddToFavoriteSuccess implements FavoriteState {
  const AddToFavoriteSuccess(this.addToFavoriteResponseModel);
  

 final  AddToFavoriteResponseModel addToFavoriteResponseModel;

/// Create a copy of FavoriteState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AddToFavoriteSuccessCopyWith<AddToFavoriteSuccess> get copyWith => _$AddToFavoriteSuccessCopyWithImpl<AddToFavoriteSuccess>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AddToFavoriteSuccess&&(identical(other.addToFavoriteResponseModel, addToFavoriteResponseModel) || other.addToFavoriteResponseModel == addToFavoriteResponseModel));
}


@override
int get hashCode => Object.hash(runtimeType,addToFavoriteResponseModel);

@override
String toString() {
  return 'FavoriteState.addToFavoriteSuccess(addToFavoriteResponseModel: $addToFavoriteResponseModel)';
}


}

/// @nodoc
abstract mixin class $AddToFavoriteSuccessCopyWith<$Res> implements $FavoriteStateCopyWith<$Res> {
  factory $AddToFavoriteSuccessCopyWith(AddToFavoriteSuccess value, $Res Function(AddToFavoriteSuccess) _then) = _$AddToFavoriteSuccessCopyWithImpl;
@useResult
$Res call({
 AddToFavoriteResponseModel addToFavoriteResponseModel
});




}
/// @nodoc
class _$AddToFavoriteSuccessCopyWithImpl<$Res>
    implements $AddToFavoriteSuccessCopyWith<$Res> {
  _$AddToFavoriteSuccessCopyWithImpl(this._self, this._then);

  final AddToFavoriteSuccess _self;
  final $Res Function(AddToFavoriteSuccess) _then;

/// Create a copy of FavoriteState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? addToFavoriteResponseModel = null,}) {
  return _then(AddToFavoriteSuccess(
null == addToFavoriteResponseModel ? _self.addToFavoriteResponseModel : addToFavoriteResponseModel // ignore: cast_nullable_to_non_nullable
as AddToFavoriteResponseModel,
  ));
}


}

/// @nodoc


class DeleteFromFavoriteSuccess implements FavoriteState {
  const DeleteFromFavoriteSuccess();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is DeleteFromFavoriteSuccess);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'FavoriteState.deleteFromFavoriteSuccess()';
}


}




/// @nodoc


class Failure implements FavoriteState {
  const Failure(this.apiErrorModel);
  

 final  ApiErrorModel apiErrorModel;

/// Create a copy of FavoriteState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$FailureCopyWith<Failure> get copyWith => _$FailureCopyWithImpl<Failure>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Failure&&(identical(other.apiErrorModel, apiErrorModel) || other.apiErrorModel == apiErrorModel));
}


@override
int get hashCode => Object.hash(runtimeType,apiErrorModel);

@override
String toString() {
  return 'FavoriteState.failure(apiErrorModel: $apiErrorModel)';
}


}

/// @nodoc
abstract mixin class $FailureCopyWith<$Res> implements $FavoriteStateCopyWith<$Res> {
  factory $FailureCopyWith(Failure value, $Res Function(Failure) _then) = _$FailureCopyWithImpl;
@useResult
$Res call({
 ApiErrorModel apiErrorModel
});




}
/// @nodoc
class _$FailureCopyWithImpl<$Res>
    implements $FailureCopyWith<$Res> {
  _$FailureCopyWithImpl(this._self, this._then);

  final Failure _self;
  final $Res Function(Failure) _then;

/// Create a copy of FavoriteState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? apiErrorModel = null,}) {
  return _then(Failure(
null == apiErrorModel ? _self.apiErrorModel : apiErrorModel // ignore: cast_nullable_to_non_nullable
as ApiErrorModel,
  ));
}


}

// dart format on
