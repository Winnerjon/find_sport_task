import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:find_sport_task/src/models/entity/auth_entity.dart';
import 'package:find_sport_task/src/services/enum/db_enum.dart';
import 'package:find_sport_task/src/services/local_db/db_service.dart';
import 'package:find_sport_task/src/services/network/client.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'reg_event.dart';
part 'reg_state.dart';
part 'reg_bloc.freezed.dart';

class RegBloc extends Bloc<RegEvent, RegState> {
  RegBloc() : super(const RegState()) {
    final APIClient apiClient = APIClient(Dio());
    on<RegResponse>((event, emit) async {
      emit(state.copyWith(isLoading: true));
      final res = await apiClient.register(event.authEntity);
      final isSuccess = await DbService().setLocalString(DbEnum.accessToken, jsonDecode(res)['accessToken']);
      emit(state.copyWith(isLoading: false, isSuccess: isSuccess));
    });
  }
}
