import 'package:json_annotation/json_annotation.dart';

part 'service_model.g.dart';

@JsonSerializable()
class ServiceModel {
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

  ServiceModel(
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

  factory ServiceModel.fromJson(Map<String, dynamic> json) => _$ServiceModelFromJson(json);

  Map<String, dynamic> toJson() => _$ServiceModelToJson(this);
}