part of 'reg_bloc.dart';

abstract class RegEvent {}

class RegResponse extends RegEvent {
  final AuthEntity authEntity;

  RegResponse({required this.authEntity});
}