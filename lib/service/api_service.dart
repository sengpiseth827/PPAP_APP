import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:ppapapp/model/anouncement_model.dart';
import 'package:ppapapp/model/bank_model.dart';
import 'package:ppapapp/model/ceo_model.dart';
import 'package:ppapapp/model/contact_model.dart';
import 'package:ppapapp/model/exchange_rate_model.dart';
import 'package:ppapapp/model/history_model.dart';
import 'package:ppapapp/model/invoice_model.dart';
import 'package:ppapapp/model/payment_model.dart';
import 'package:ppapapp/model/product_model.dart';
import 'package:ppapapp/model/service_model.dart';
import 'package:ppapapp/model/user_model.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';
import 'package:retrofit/retrofit.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:url_launcher_platform_interface/url_launcher_platform_interface.dart';

part 'api_service.g.dart';

//@RestApi(baseUrl: "http://ppaptest.truckingcambodia.com/")
@RestApi(baseUrl: "http://epayment.ppap.com.kh/")
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

  @POST("datamobile/getpayhistory.php")
  Future<List<HistoryModel>> getHistory(@Path() String id);

  @GET("datamobile/getceo.php")
  Future<List<CeoModel>> getCeo();

  @GET("datamobile/getanouncement.php")
  Future<List<AnouncementModel>> getAnouncement();

  @GET("datamobile/getrate.php")
  Future<List<ExchangeRate>> getexchangerate();

  @GET("datamobile/getcontact.php")
  Future<List<ContactModel>> getcontact();

  @POST("datamobile/invview.php")
  Future<String> postqrcode(@Path() String id);

  @POST("datamobile/payment.php")
  Future<List<InvoiceModel>> getInvoice(@Path() String id);

  @POST("datamobile/getbank.php")
  Future<List<BankModel>> getBank(@Path() String id);

  @POST("datamobile/setlogin.php?{uname} && {pass}")
  Future<List<UserModel>> userLogin(@Path() String username, @Path() String password);

  @POST("datamobile/setregister.php")
  Future<List<UserModel>> postUser(@Path() String pass,@Path() String fname,@Path() String lname,@Path() String tel,
      @Path() String email,@Path() String company,@Path() String address,);

  @POST("datamobile/getpayment.php")
  Future<List<PaymentModel>> payment(PaymentModel paymentModel);

}