import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:ppapapp/model/anouncement_model.dart';
import 'package:ppapapp/model/ceo_model.dart';
import 'package:ppapapp/model/service_model.dart';
import 'package:ppapapp/model/user_model.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';
import 'package:retrofit/retrofit.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:url_launcher_platform_interface/url_launcher_platform_interface.dart';

part 'api_service.g.dart';

@RestApi(baseUrl: "http://ppaptest.truckingcambodia.com/")
abstract class ApiService {
  factory ApiService(Dio dio, {String baseUrl}) = _ApiService;

  static ApiService create() {
    final dio = Dio();
    dio.interceptors.add(PrettyDioLogger());
    return ApiService(dio);
  }

  @GET("datamobile/getlogin.php")
  Future<List<UserModel>> getUser();

  @GET("datamobile/getservice.php")
  Future<List<ServiceModel>> getService();

  @GET("datamobile/getceo.php")
  Future<CeoModel> getCeo();

  @GET("datamobile/getanouncement.php")
  Future<List<AnouncementModel>> getAnouncement();

  @POST("datamobile/invview.php")
  Future<String> postqrcode(@Path() String id);

}