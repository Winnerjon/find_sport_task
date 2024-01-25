part of 'ads_bloc.dart';

@freezed
class AdsState with _$AdsState {
  const factory AdsState({
    Point? point,
    @Default('') String address,
    @Default(false) bool isLoading,
    @Default(false) bool isSuccess,
    @Default([]) List<MapObject> mapObjects,
  }) = _AdsState;

  const AdsState._();
}
