import 'package:dio/dio.dart';
import 'package:ppapapp/model/anouncement_model.dart';
import 'package:ppapapp/model/ceo_model.dart';
import 'package:ppapapp/model/service_model.dart';
import 'package:ppapapp/model/user_model.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';
import 'package:retrofit/retrofit.dart';

part 'api_service.g.dart';

@RestApi(baseUrl: "http://ppaptest.truckingcambodia.com/datamobile/")
abstract class ApiService {
  factory ApiService(Dio dio, {String baseUrl}) = _ApiService;

  static ApiService create() {
    final dio = Dio();
    dio.interceptors.add(PrettyDioLogger());
    return ApiService(dio);
  }

  @GET("getlogin.php")
  Future<List<UserModel>> getUser();

  @GET("getservice.php")
  Future<List<ServiceModel>> getService();

  @GET("getceo.php")
  Future<List<CeoModel>> getCeo();

  @GET("getceo.php")
  Future<List<AnouncementModel>> getAnouncement();

}