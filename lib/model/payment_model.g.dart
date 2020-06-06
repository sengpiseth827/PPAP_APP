part of 'payment_model.dart';

PaymentModel _$ServiceModelFromJson(Map<String, dynamic> json) {
  return PaymentModel(
      iD : json['ID'],
      bank : json['Bank'],
      payFor : json['PayFor'],
      amount : json['amount'],
      toAccountName : json['ToAccountName'],
      toAccountNum : json['ToAccountNum'],
      fromAccountName : json['FromAccountName'],
      fromAccountNum : json['FromAccountNum'],
      description : json['Description'],
      status : json['Status'],
      type : json['Type'],
      datePay : json['DatePay'],
      createBy : json['CreateBy'],
      dateCreate : json['DateCreate'],
      userid : json['userid'],
  );
}

Map<String, dynamic> _$ServiceModelToJson(PaymentModel instance) => <String, dynamic>{
  'ID': instance.iD,
  'Bank': instance.bank,
  'PayFor': instance.payFor,
  'amount': instance.amount,
  'ToAccountName': instance.toAccountName,
  'ToAccountNum': instance.toAccountNum,
  'FromAccountName': instance.fromAccountName,
  'FromAccountNum': instance.fromAccountNum,
  'Description': instance.description,
  'Status': instance.status,
  'Type': instance.type,
  'DatePay': instance.datePay,
  'CreateBy': instance.createBy,
  'DateCreate': instance.dateCreate,
  'userid': instance.userid,
};