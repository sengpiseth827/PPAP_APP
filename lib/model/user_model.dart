import 'package:json_annotation/json_annotation.dart';

part 'user_model.g.dart';

@JsonSerializable()
class UserModel {
  String sysId;
  String userCode;
  String password;
  String firstName;
  String lastName;
  String userType;
  String status;
  String userName;
  String tel;
  String email;
  String company;
  String type;

  UserModel(
      {this.sysId,
        this.userCode,
        this.password,
        this.firstName,
        this.lastName,
        this.userType,
        this.status,
        this.userName,
        this.tel,
        this.email,
        this.company,
        this.type});

  factory UserModel.fromJson(Map<String, dynamic> json) => _$UserModelFromJson(json);

  Map<String, dynamic> toJson() => _$UserModelToJson(this);
}