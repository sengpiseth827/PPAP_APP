part of 'invoice_model.dart';

InvoiceModel _$ServiceModelFromJson(Map<String, dynamic> json) {
  return InvoiceModel(
      id : json['Id'],
      iNVNumber : json['INVNumber'],
      nameData : json['NameData'],
      data : json['Data'],
      company : json['Company'],
      amount : json['Amount'],
      type : json['Type'],
      status : json['Status'],
      createBy : json['CreateBy'],
      dateCreate : json['DateCreate'],
      updateBy : json['UpdateBy'],
      dateUpdate : json['DateUpdate'],
      deleteBY : json['DeleteBY'],
      dateDelete : json['DateDelete'],
  );
}

Map<String, dynamic> _$ServiceModelToJson(InvoiceModel instance) => <String, dynamic>{
  'Id': instance.id,
  'INVNumber': instance.iNVNumber,
  'NameData': instance.nameData,
  'Data': instance.data,
  'Company': instance.company,
  'Amount': instance.amount,
  'Type': instance.type,
  'Status': instance.status,
  'CreateBy': instance.createBy,
  'DateCreate': instance.dateCreate,
  'UpdateBy': instance.updateBy,
  'DateUpdate': instance.dateCreate,
  'DeleteBY': instance.deleteBY,
  'DateDelete': instance.dateDelete,
};