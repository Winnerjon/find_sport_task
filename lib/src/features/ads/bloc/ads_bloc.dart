import 'package:dio/dio.dart';
import 'package:find_sport_task/src/models/entity/ads_entity.dart';
import 'package:find_sport_task/src/services/network/client.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:yandex_mapkit/yandex_mapkit.dart';

part 'ads_event.dart';

part 'ads_state.dart';

part 'ads_bloc.freezed.dart';

class AdsBloc extends Bloc<AdsEvent, AdsState> {
  AdsBloc() : super(const AdsState()) {
    final APIClient apiClient = APIClient(Dio());
    on<AdsLocation>((event, emit) async {
      PlacemarkMapObject placemark = event.placemark;
      List<MapObject> mapObjects = [];

      mapObjects.add(placemark);
      emit(state.copyWith(
          address: event.address,
          mapObjects: mapObjects,
          point: placemark.point,
          isSuccess: false));
    });

    on<AdsResponse>((event, emit) async {
      Point? point = state.point;
      if (point != null) {
        emit(state.copyWith(isLoading: true, isSuccess: false));

        AdsEntity adsEntity = AdsEntity(
            title: event.title,
            description: event.description,
            lot: point.longitude,
            lat: point.latitude);
        final res = await apiClient.adsAdd(adsEntity);
        emit(state.copyWith(isLoading: false, isSuccess: res != null));
      }
    });
  }
}
