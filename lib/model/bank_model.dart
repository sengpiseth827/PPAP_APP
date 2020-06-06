import 'package:json_annotation/json_annotation.dart';

part 'bank_model.g.dart';

@JsonSerializable()
class BankModel {
  String accid;
  String banktype;
  String accname;
  String accnumber;

  BankModel({this.accid, this.banktype, this.accname, this.accnumber});


  factory BankModel.fromJson(Map<String, dynamic> json) => _$ServiceModelFromJson(json);

  Map<String, dynamic> toJson() => _$ServiceModelToJson(this);
}