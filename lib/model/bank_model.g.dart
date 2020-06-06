part of 'bank_model.dart';

BankModel _$ServiceModelFromJson(Map<String, dynamic> json) {
  return BankModel(
      accid : json['accid'],
      banktype : json['banktype'],
      accname : json['accname'],
      accnumber : json['accnumber'],
  );
}

Map<String, dynamic> _$ServiceModelToJson(BankModel instance) => <String, dynamic>{
  'accid': instance.accid,
  'banktype': instance.banktype,
  'accname': instance.accname,
  'accnumber': instance.accnumber,
};