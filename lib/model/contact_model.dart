class ContactModel {
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
  String address;

  ContactModel(
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
        this.type,
        this.address});

  ContactModel.fromJson(Map<String, dynamic> json) {
    sysId = json['sys_Id'];
    userCode = json['UserCode'];
    password = json['Password'];
    firstName = json['FirstName'];
    lastName = json['LastName'];
    userType = json['UserType'];
    status = json['Status'];
    userName = json['UserName'];
    tel = json['Tel'];
    email = json['Email'];
    company = json['Company'];
    type = json['Type'];
    address = json['Address'];
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
    data['UserName'] = this.userName;
    data['Tel'] = this.tel;
    data['Email'] = this.email;
    data['Company'] = this.company;
    data['Type'] = this.type;
    data['Address'] = this.address;
    return data;
  }
}