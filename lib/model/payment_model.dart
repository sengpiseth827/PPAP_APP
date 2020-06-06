import 'package:json_annotation/json_annotation.dart';

part 'payment_model.g.dart';

@JsonSerializable()
class PaymentModel {
  String iD;
  String bank;
  String payFor;
  String amount;
  String toAccountName;
  String toAccountNum;
  String fromAccountName;
  String fromAccountNum;
  String description;
  String status;
  String type;
  String datePay;
  String createBy;
  String dateCreate;
  String userid;

  PaymentModel(
      {this.iD,
        this.bank,
        this.payFor,
        this.amount,
        this.toAccountName,
        this.toAccountNum,
        this.fromAccountName,
        this.fromAccountNum,
        this.description,
        this.status,
        this.type,
        this.datePay,
        this.createBy,
        this.dateCreate,
        this.userid});

  factory PaymentModel.fromJson(Map<String, dynamic> json) => _$ServiceModelFromJson(json);

  Map<String, dynamic> toJson() => _$ServiceModelToJson(this);
}