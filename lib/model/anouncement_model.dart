import 'package:json_annotation/json_annotation.dart';

part 'anoumcement_model.g.dart';

@JsonSerializable()
class AnouncementModel {
  String id;
  String nameTitle;
  String content;
  String image;
  String imagePath;
  String type;
  String status;
  String createBy;
  String dateCreate;
  String updateBy;
  String dateUpdate;
  String deleteBY;
  String dateDelete;

  AnouncementModel(
      {this.id,
        this.nameTitle,
        this.content,
        this.image,
        this.imagePath,
        this.type,
        this.status,
        this.createBy,
        this.dateCreate,
        this.updateBy,
        this.dateUpdate,
        this.deleteBY,
        this.dateDelete});

  factory AnouncementModel.fromJson(Map<String, dynamic> json) => _$AnouncementModelFromJson(json);

  Map<String, dynamic> toJson() => _$AnouncementModelToJson(this);
}