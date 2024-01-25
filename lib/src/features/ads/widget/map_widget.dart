import 'package:find_sport_task/src/common/values/images.dart';
import 'package:find_sport_task/src/features/ads/bloc/ads_bloc.dart';
import 'package:find_sport_task/src/services/location/location_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:geolocator/geolocator.dart';
import 'package:yandex_mapkit/yandex_mapkit.dart';

class MapWidget extends StatefulWidget {
  const MapWidget({Key? key}) : super(key: key);

  @override
  State<MapWidget> createState() => _MapWidgetState();
}

class _MapWidgetState extends State<MapWidget> {
  late YandexMapController controller;

  Future<String> getAddress() async {
    final List<SearchSessionResult> results = [];
    final cameraPosition = await controller.getCameraPosition();
    final resultWithSession = YandexSearch.searchByPoint(
      point: cameraPosition.target,
      zoom: cameraPosition.zoom.toInt(),
      searchOptions: const SearchOptions(
        searchType: SearchType.geo,
        geometry: false,
      ),
    );

    results.add(await resultWithSession.result);
    return results.first.items?.first.name ?? '';
  }

  onMapCreate(YandexMapController mapController) async {
    controller = mapController;
  }

  changePlacemark(Point point) async {
    final PlacemarkMapObject placemark = PlacemarkMapObject(
      mapId: const MapObjectId('placemark'),
      point: point,
      icon: PlacemarkIcon.single(
        PlacemarkIconStyle(
          image: BitmapDescriptor.fromAssetImage(
            AppImages.spotlightMarker,
          ),
        ),
      ),
    );
    final boundingBox = BoundingBox(
      northEast: point,
      southWest: point,
    );

    controller.moveCamera(
        CameraUpdate.newGeometry(Geometry.fromBoundingBox(boundingBox)));
    controller.moveCamera(CameraUpdate.zoomTo(11));
    getAddress().then((value) {
      context
          .read<AdsBloc>()
          .add(AdsLocation(address: value, placemark: placemark));
    });
  }

  Future<void> _initState() async {
    Position position = await LocationService.getLocation();
    Point point = Point(latitude: position.latitude, longitude: position.longitude);
    changePlacemark(point);
  }

  @override
  void initState() {
    super.initState();
    _initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AdsBloc, AdsState>(
      builder: (context, state) {
        return SizedBox(
          height: 290,
          width: double.infinity,
          child: YandexMap(
            logoAlignment: const MapAlignment(
                horizontal: HorizontalAlignment.left,
                vertical: VerticalAlignment.bottom),
            onMapCreated: onMapCreate,
            mapObjects: state.mapObjects,
            onMapTap: changePlacemark,
          ),
        );
      },
    );
  }
}
