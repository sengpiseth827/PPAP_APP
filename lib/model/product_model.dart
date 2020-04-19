import 'package:json_annotation/json_annotation.dart';

part 'product_model.g.dart';

@JsonSerializable()
class ProductModel {
  String sysId;
  String userCode;
  String password;
  String firstName;
  String lastName;
  String userType;
  String status;
  String submissionDate;

  ProductModel(
      {this.sysId,
        this.userCode,
        this.password,
        this.firstName,
        this.lastName,
        this.userType,
        this.status,
        this.submissionDate});

  ProductModel.fromJson(Map<String, dynamic> json) {
    sysId = json['sys_Id'];
    userCode = json['UserCode'];
    password = json['Password'];
    firstName = json['FirstName'];
    lastName = json['LastName'];
    userType = json['UserType'];
    status = json['Status'];
    submissionDate = json['submission_date'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['sys_Id'] = this.sysId;
    data['UserCode'] = this.userCode;
    data['Password'] = this.password;
    data['FirstName'] = this.firstName;
    data['LastName'] = this.lastName;
    data['UserType'] = this.userType;
    data['Status'] = this.status;
    data['submission_date'] = this.submissionDate;
    return data;
  }
}