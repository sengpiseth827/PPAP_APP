part of 'api_service.dart';

class _ApiService implements ApiService {
  _ApiService(this._dio, {this.baseUrl}) {
    ArgumentError.checkNotNull(_dio, '_dio');
    this.baseUrl ??= 'http://epayment.ppap.com.kh/';
//    this.baseUrl ??= 'http://ppaptest.truckingcambodia.com/';
  }

  final Dio _dio;

  String baseUrl;

  @override
  getUser() async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _data = <String, dynamic>{};
    final Response<List<dynamic>> _result = await _dio.request('datamobile/getlogin.php',
        queryParameters: queryParameters,
        options: RequestOptions(
            method: 'GET',
            headers: <String, dynamic>{},
            extra: _extra,
            baseUrl: baseUrl),
        data: _data);
    print(_result.data);
    var value = _result.data
        .map((dynamic i) => UserModel.fromJson(i as Map<String, dynamic>))
        .toList();
    return Future.value(value);
  }

  @override
  getService() async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _data = <String, dynamic>{};
    final Response<List<dynamic>> _result = await _dio.request('datamobile/getservice.php',
        queryParameters: queryParameters,
        options: RequestOptions(
            method: 'GET',
            headers: <String, dynamic>{},
            extra: _extra,
            baseUrl: baseUrl),
        data: _data);
//    for(var i=0; i<10;i++){
//      data = ServiceModel.fromJson(_result.data[i.toString()]);
//      print(data.nameTitle);
//      value.add(data);
//      return Future.value(value);
//    }
    print(_result.data);
    var value = _result.data
        .map((dynamic i) => ServiceModel.fromJson(i as Map<String, dynamic>))
        .toList();
    return Future.value(value);
  }

  @override
  getCeo() async {
//    CeoModel  data = new CeoModel();
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _data = <String, dynamic>{};
    final Response<List<dynamic>> _result = await _dio.request('datamobile/getceo.php',
        queryParameters: queryParameters,
        options: RequestOptions(
            method: 'GET',
            headers: <String, dynamic>{},
            extra: _extra,
            baseUrl: baseUrl),
        data: _data);
    print(_result.data);
//    for(var i=0; i<10;i++){
//      data = CeoModel.fromJson(_result.data[i.toString()]);
//      print(data.nameTitle);
//      return Future.value(data);
//    }
    var value = _result.data
        .map((dynamic i) => CeoModel.fromJson(i as Map<String, dynamic>))
        .toList();
    return Future.value(value);
  }

  @override
  getAnouncement() async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _data = <String, dynamic>{};
    final Response<List<dynamic>> _result = await _dio.request('datamobile/getanouncement.php',
        queryParameters: queryParameters,
        options: RequestOptions(
            method: 'GET',
            headers: <String, dynamic>{},
            extra: _extra,
            baseUrl: baseUrl),
        data: _data);
    print(_result.data);
    var value = _result.data
        .map((dynamic i) => AnouncementModel.fromJson(i as Map<String, dynamic>))
        .toList();
    return Future.value(value);
  }

  @override
  Future<String> postqrcode(String id) async{
    FormData formData = FormData.fromMap({
      "id": id,
    });
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _data = <String, dynamic>{};
    final Response _result = await _dio.post('datamobile/invview.php',
        queryParameters: queryParameters,
        options: RequestOptions(
            method: 'POST',
            headers: <String, dynamic>{},
            extra: _extra,
            baseUrl: baseUrl),
        data: formData);
    if(_result.statusCode == 200) {
      String url = _result.request.baseUrl + 'datamobile/invview.php?id=' + id;
      print(url);
      return url;
    }
  }

  @override
  getexchangerate() async{
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _data = <String, dynamic>{};
    final Response<List<dynamic>> _result = await _dio.request('datamobile/getrate.php',
        queryParameters: queryParameters,
        options: RequestOptions(
            method: 'GET',
            headers: <String, dynamic>{},
            extra: _extra,
            baseUrl: baseUrl),
        data: _data);
    print(_result.data);
    var value = _result.data
        .map((dynamic i) => ExchangeRate.fromJson(i as Map<String, dynamic>))
        .toList();
    return Future.value(value);
  }

  @override
  Future<List<UserModel>> userLogin(String username, String password) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _data = <String, dynamic>{};
    final Response<List<dynamic>> _result = await _dio.post("datamobile/setlogin.php?uname="+username+"&&pass="+password,
        queryParameters: queryParameters,
        options: RequestOptions(
            method: 'POST',
            headers: <String, dynamic>{},
            extra: _extra,
            baseUrl: baseUrl),
        data: _data);
    var value = _result.data
        .map((dynamic i) => UserModel.fromJson(i as Map<String, dynamic>))
        .toList();
    return Future.value(value);
  }

  @override
  Future<List<UserModel>> postUser(String pass, String fname, String lname, String tel, String email, String company, String address) async{
    String uname = fname+lname;
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _data = <String, dynamic>{};
    final Response<List<dynamic>> _result = await _dio.post("datamobile/new_register.php?Uname="+uname+"&Password="+pass
        +"&Fname="+fname+"&Lname="+lname+"&Utype=Client"+"&Tel="+tel+"&Email="+email+"&Company="+company+"&Addr="+address+"",
        queryParameters: queryParameters,
        options: RequestOptions(
            method: 'POST',
            headers: <String, dynamic>{},
            extra: _extra,
            baseUrl: baseUrl),
        data: _data);
    var value = _result.data
        .map((dynamic i) => UserModel.fromJson(i as Map<String, dynamic>))
        .toList();
    return Future.value(value);
  }
  @override
  getcontact() async{
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _data = <String, dynamic>{};
    final Response<List<dynamic>> _result = await _dio.request('datamobile/getcontact.php',
        queryParameters: queryParameters,
        options: RequestOptions(
            method: 'GET',
            headers: <String, dynamic>{},
            extra: _extra,
            baseUrl: baseUrl),
        data: _data);
    print(_result.data);
    var value = _result.data
        .map((dynamic i) => ContactModel.fromJson(i as Map<String, dynamic>))
        .toList();
    return Future.value(value);
  }

  @override
  Future<List<HistoryModel>> getHistory(String id) async{
    FormData formData = FormData.fromMap({
      "id": id,
    });
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _data = <String, dynamic>{};
    final Response<List<dynamic>> _result = await _dio.post('datamobile/getpayhistory.php?userid='+id,
        queryParameters: queryParameters,
        options: RequestOptions(
            method: 'POST',
            headers: <String, dynamic>{},
            extra: _extra,
            baseUrl: baseUrl),
        data: formData);
    var value = _result.data
        .map((dynamic i) => HistoryModel.fromJson(i as Map<String, dynamic>))
        .toList();
    return Future.value(value);
  }

  @override
  Future<List<InvoiceModel>> getInvoice(String id) async{
    FormData formData = FormData.fromMap({
      "id": id,
    });
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _data = <String, dynamic>{};
    final Response<List<dynamic>> _result = await _dio.post('datamobile/payment.php?invnum='+id,
        queryParameters: queryParameters,
        options: RequestOptions(
            method: 'POST',
            headers: <String, dynamic>{},
            extra: _extra,
            baseUrl: baseUrl),
        data: formData);
    print("Response :"+_result.data.toString());
    var value = _result.data
        .map((dynamic i) => InvoiceModel.fromJson(i as Map<String, dynamic>))
        .toList();
    return Future.value(value);
  }

  @override
  Future<List<BankModel>> getBank(String id) async{
    FormData formData = FormData.fromMap({
      "id": id,
    });
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _data = <String, dynamic>{};
    final Response<List<dynamic>> _result = await _dio.post('datamobile/getbank.php?banktype='+id,
        queryParameters: queryParameters,
        options: RequestOptions(
            method: 'POST',
            headers: <String, dynamic>{},
            extra: _extra,
            baseUrl: baseUrl),
        data: formData);
    print(_result.data);
    var value = _result.data
        .map((dynamic i) => BankModel.fromJson(i as Map<String, dynamic>))
        .toList();
    return Future.value(value);
  }

  @override
  Future<List<PaymentModel>> payment(String payfor, String bank, String amount, String toaccountname, String toaccountnum, String fromaccountname,
      String fromaccontnum, String description, String userid) async{
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _data = <String, dynamic>{};
    final Response<List<dynamic>> _result = await _dio.post('datamobile/getpayment.php?PayFor='+payfor+'&Bank='+
        bank+'&amount='+amount+'&ToAccountName='+toaccountname+'&ToAccountNum='+toaccountnum
        +'&FromAccountName='+fromaccountname+'&FromAccountNum='+fromaccontnum+'&Description='+description
        +'&userid='+userid,
        queryParameters: queryParameters,
        options: RequestOptions(
            method: 'POST',
            headers: <String, dynamic>{},
            extra: _extra,
            baseUrl: baseUrl),
        data: _data);
    print("Response :"+_result.data.toString());
    var value = _result.data
        .map((dynamic i) => PaymentModel.fromJson(i as Map<String, dynamic>))
        .toList();
    return Future.value(value);
  }

  @override
  ChangeProfile(String firstname, String lastname, String phone, String email, String address,String sysID) async{
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _data = <String, dynamic>{};
    final Response<List<dynamic>> _result = await _dio.post('datamobile/updateprofile.php?FirstName='+firstname+'&LastName='+lastname+'&'
        'Company=ppap&Phone='+phone+'&Email='+email+'&Address='+'address'+'&sys_Id='+sysID,
        queryParameters: queryParameters,
        options: RequestOptions(
            method: 'POST',
            headers: <String, dynamic>{},
            extra: _extra,
            baseUrl: baseUrl),
        data: _data);
    print("Response :"+_result.data.toString());
    return Future.value(_result.data);
  }

  @override
  ChangePassword(String oldPassword, String newPassword, String sysID) async{
    if(oldPassword == newPassword){
      const _extra = <String, dynamic>{};
      final queryParameters = <String, dynamic>{};
      final _data = <String, dynamic>{};
      final Response<List<dynamic>> _result = await _dio.post('datamobile/changepassword.php?Password='+newPassword+'&sys_Id='+sysID,
          queryParameters: queryParameters,
          options: RequestOptions(
              method: 'POST',
              headers: <String, dynamic>{},
              extra: _extra,
              baseUrl: baseUrl),
          data: _data);
      print("Response :"+_result.data.toString());
      return Future.value(_result.data);
    }
  }
}
