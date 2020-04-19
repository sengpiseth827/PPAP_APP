part of 'user_model.dart';

UserModel _$UserModelFromJson(Map<String, dynamic> json) {
  return UserModel(
      sysId: json['sys_Id'] as String,
      userCode: json['UserCode'] as String,
      password: json['Password'] as String,
      firstName: json['FirstName'] as String,
      lastName: json['LastName'] as String,
      userType: json['UserType'] as String,
      status: json['Status'] as String,
      userName: json['UserName'] as String,
      tel: json['Tel'] as String,
      email: json['Email'] as String,
      company: json['Company'] as String,
      type: json['Type'] as String,
  );
}

Map<String, dynamic> _$UserModelToJson(UserModel instance) => <String, dynamic>{
  'sys_Id': instance.sysId,
  'UserCode': instance.userCode,
  'Password': instance.password,
  'FirstName': instance.firstName,
  'LastName': instance.lastName,
  'UserType': instance.userType,
  'Status': instance.status,
  'UserName': instance.userName,
  'Tel': instance.tel,
  'Email': instance.email,
  'Company': instance.company,
  'Type': instance.type,
};