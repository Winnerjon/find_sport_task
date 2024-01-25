import 'package:find_sport_task/src/models/entity/ads_entity.dart';
import 'package:find_sport_task/src/models/entity/auth_entity.dart';
import 'package:find_sport_task/src/services/enum/db_enum.dart';
import 'package:find_sport_task/src/services/local_db/db_service.dart';
import 'package:retrofit/retrofit.dart';
import 'package:dio/dio.dart';

part 'client.g.dart';

// *** CLIENT *** //
@RestApi(baseUrl: "https://qutb.uz")
abstract class APIClient {
  factory APIClient(Dio dio, {String? baseUrl}) {
    Map<String, dynamic> headers = {'Content-Type': 'application/json'};

    final token = DbService().getLocalString(DbEnum.accessToken);
    if (token != null) {
      headers.addAll({'Authorization': 'Bearer $token'});
    }

    dio.options = BaseOptions(
      receiveTimeout: const Duration(milliseconds: 30000),
      connectTimeout: const Duration(milliseconds: 30000),
      contentType: 'application/json',
      headers: headers,
    );

    return _APIClient(dio, baseUrl: baseUrl);
  }

  // ===== POST ===== //
  @POST("/api/auth/register")
  Future<String> register(@Body() AuthEntity authEntity);

  @POST("/api/ads")
  Future<String?> adsAdd(@Body() AdsEntity adsEntity);
}
