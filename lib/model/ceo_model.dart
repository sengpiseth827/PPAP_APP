import 'package:json_annotation/json_annotation.dart';

part 'ceo_model.g.dart';

@JsonSerializable()
class CeoModel {
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

  CeoModel(
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

  factory CeoModel.fromJson(Map<String, dynamic> json) => _$CeoModelFromJson(json);

  Map<String, dynamic> toJson() => _$CeoModelToJson(this);
}