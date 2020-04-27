class ExchangeRate {
  String id;
  String nameTitle;
  String kH;
  String uSD;
  String type;
  String status;
  String createBy;
  String dateCreate;
  String updateBy;
  String dateUpdate;
  String deleteBY;
  String dateDelete;

  ExchangeRate(
      {this.id,
        this.nameTitle,
        this.kH,
        this.uSD,
        this.type,
        this.status,
        this.createBy,
        this.dateCreate,
        this.updateBy,
        this.dateUpdate,
        this.deleteBY,
        this.dateDelete});

  ExchangeRate.fromJson(Map<String, dynamic> json) {
    id = json['Id'];
    nameTitle = json['NameTitle'];
    kH = json['KH'];
    uSD = json['USD'];
    type = json['Type'];
    status = json['Status'];
    createBy = json['CreateBy'];
    dateCreate = json['DateCreate'];
    updateBy = json['UpdateBy'];
    dateUpdate = json['DateUpdate'];
    deleteBY = json['DeleteBY'];
    dateDelete = json['DateDelete'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['Id'] = this.id;
    data['NameTitle'] = this.nameTitle;
    data['KH'] = this.kH;
    data['USD'] = this.uSD;
    data['Type'] = this.type;
    data['Status'] = this.status;
    data['CreateBy'] = this.createBy;
    data['DateCreate'] = this.dateCreate;
    data['UpdateBy'] = this.updateBy;
    data['DateUpdate'] = this.dateUpdate;
    data['DeleteBY'] = this.deleteBY;
    data['DateDelete'] = this.dateDelete;
    return data;
  }
}