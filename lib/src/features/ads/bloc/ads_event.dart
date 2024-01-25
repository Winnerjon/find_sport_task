part of 'ads_bloc.dart';

abstract class AdsEvent {}

class AdsInitial extends AdsEvent {}

class AdsLocation extends AdsEvent {
  final String address;
  final PlacemarkMapObject placemark;

  AdsLocation({required this.address, required this.placemark});
}

class AdsResponse extends AdsEvent {
  final String title;
  final String description;

  AdsResponse({required this.title, required this.description});
}