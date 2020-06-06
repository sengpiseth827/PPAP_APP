import 'package:json_annotation/json_annotation.dart';

part 'invoice_model.g.dart';

@JsonSerializable()
class InvoiceModel {
  String id;
  String iNVNumber;
  String nameData;
  String data;
  String company;
  String amount;
  String type;
  String status;
  String createBy;
  String dateCreate;
  String updateBy;
  String dateUpdate;
  String deleteBY;
  String dateDelete;

  InvoiceModel(
      {this.id,
        this.iNVNumber,
        this.nameData,
        this.data,
        this.company,
        this.amount,
        this.type,
        this.status,
        this.createBy,
        this.dateCreate,
        this.updateBy,
        this.dateUpdate,
        this.deleteBY,
        this.dateDelete});

  factory InvoiceModel.fromJson(Map<String, dynamic> json) => _$ServiceModelFromJson(json);

  Map<String, dynamic> toJson() => _$ServiceModelToJson(this);
}