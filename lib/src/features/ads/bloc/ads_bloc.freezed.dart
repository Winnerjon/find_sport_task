// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'ads_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$AdsState {
  Point? get point => throw _privateConstructorUsedError;
  String get address => throw _privateConstructorUsedError;
  bool get isLoading => throw _privateConstructorUsedError;
  bool get isSuccess => throw _privateConstructorUsedError;
  List<MapObject> get mapObjects => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $AdsStateCopyWith<AdsState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AdsStateCopyWith<$Res> {
  factory $AdsStateCopyWith(AdsState value, $Res Function(AdsState) then) =
      _$AdsStateCopyWithImpl<$Res, AdsState>;
  @useResult
  $Res call(
      {Point? point,
      String address,
      bool isLoading,
      bool isSuccess,
      List<MapObject> mapObjects});
}

/// @nodoc
class _$AdsStateCopyWithImpl<$Res, $Val extends AdsState>
    implements $AdsStateCopyWith<$Res> {
  _$AdsStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? point = freezed,
    Object? address = null,
    Object? isLoading = null,
    Object? isSuccess = null,
    Object? mapObjects = null,
  }) {
    return _then(_value.copyWith(
      point: freezed == point
          ? _value.point
          : point // ignore: cast_nullable_to_non_nullable
              as Point?,
      address: null == address
          ? _value.address
          : address // ignore: cast_nullable_to_non_nullable
              as String,
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      isSuccess: null == isSuccess
          ? _value.isSuccess
          : isSuccess // ignore: cast_nullable_to_non_nullable
              as bool,
      mapObjects: null == mapObjects
          ? _value.mapObjects
          : mapObjects // ignore: cast_nullable_to_non_nullable
              as List<MapObject>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$AdsStateImplCopyWith<$Res>
    implements $AdsStateCopyWith<$Res> {
  factory _$$AdsStateImplCopyWith(
          _$AdsStateImpl value, $Res Function(_$AdsStateImpl) then) =
      __$$AdsStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {Point? point,
      String address,
      bool isLoading,
      bool isSuccess,
      List<MapObject> mapObjects});
}

/// @nodoc
class __$$AdsStateImplCopyWithImpl<$Res>
    extends _$AdsStateCopyWithImpl<$Res, _$AdsStateImpl>
    implements _$$AdsStateImplCopyWith<$Res> {
  __$$AdsStateImplCopyWithImpl(
      _$AdsStateImpl _value, $Res Function(_$AdsStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? point = freezed,
    Object? address = null,
    Object? isLoading = null,
    Object? isSuccess = null,
    Object? mapObjects = null,
  }) {
    return _then(_$AdsStateImpl(
      point: freezed == point
          ? _value.point
          : point // ignore: cast_nullable_to_non_nullable
              as Point?,
      address: null == address
          ? _value.address
          : address // ignore: cast_nullable_to_non_nullable
              as String,
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      isSuccess: null == isSuccess
          ? _value.isSuccess
          : isSuccess // ignore: cast_nullable_to_non_nullable
              as bool,
      mapObjects: null == mapObjects
          ? _value._mapObjects
          : mapObjects // ignore: cast_nullable_to_non_nullable
              as List<MapObject>,
    ));
  }
}

/// @nodoc

class _$AdsStateImpl extends _AdsState {
  const _$AdsStateImpl(
      {this.point,
      this.address = '',
      this.isLoading = false,
      this.isSuccess = false,
      final List<MapObject> mapObjects = const []})
      : _mapObjects = mapObjects,
        super._();

  @override
  final Point? point;
  @override
  @JsonKey()
  final String address;
  @override
  @JsonKey()
  final bool isLoading;
  @override
  @JsonKey()
  final bool isSuccess;
  final List<MapObject> _mapObjects;
  @override
  @JsonKey()
  List<MapObject> get mapObjects {
    if (_mapObjects is EqualUnmodifiableListView) return _mapObjects;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_mapObjects);
  }

  @override
  String toString() {
    return 'AdsState(point: $point, address: $address, isLoading: $isLoading, isSuccess: $isSuccess, mapObjects: $mapObjects)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AdsStateImpl &&
            (identical(other.point, point) || other.point == point) &&
            (identical(other.address, address) || other.address == address) &&
            (identical(other.isLoading, isLoading) ||
                other.isLoading == isLoading) &&
            (identical(other.isSuccess, isSuccess) ||
                other.isSuccess == isSuccess) &&
            const DeepCollectionEquality()
                .equals(other._mapObjects, _mapObjects));
  }

  @override
  int get hashCode => Object.hash(runtimeType, point, address, isLoading,
      isSuccess, const DeepCollectionEquality().hash(_mapObjects));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$AdsStateImplCopyWith<_$AdsStateImpl> get copyWith =>
      __$$AdsStateImplCopyWithImpl<_$AdsStateImpl>(this, _$identity);
}

abstract class _AdsState extends AdsState {
  const factory _AdsState(
      {final Point? point,
      final String address,
      final bool isLoading,
      final bool isSuccess,
      final List<MapObject> mapObjects}) = _$AdsStateImpl;
  const _AdsState._() : super._();

  @override
  Point? get point;
  @override
  String get address;
  @override
  bool get isLoading;
  @override
  bool get isSuccess;
  @override
  List<MapObject> get mapObjects;
  @override
  @JsonKey(ignore: true)
  _$$AdsStateImplCopyWith<_$AdsStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
