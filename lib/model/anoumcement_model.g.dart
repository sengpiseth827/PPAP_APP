part of 'anouncement_model.dart';

AnouncementModel _$AnouncementModelFromJson(Map<String, dynamic> json) {
  return AnouncementModel(
      id : json['Id'] as String,
      nameTitle : json['NameTitle'] as String,
      content : json['Content'] as String,
      image : json['Image'] as String,
      imagePath : json['ImagePath'] as String,
      type : json['Type'] as String,
      status : json['Status'] as String,
      createBy : json['CreateBy'] as String,
      dateCreate : json['DateCreate'] as String,
      updateBy : json['UpdateBy'] as String,
      dateUpdate : json['DateUpdate'] as String,
      deleteBY : json['DeleteBY'] as String,
      dateDelete : json['DateDelete'] as String,
  );
}

Map<String, dynamic> _$AnouncementModelToJson(AnouncementModel instance) => <String, dynamic>{
  'Id': instance.id,
  'NameTitle': instance.nameTitle,
  'Content': instance.content,
  'Image': instance.image,
  'ImagePath': instance.imagePath,
  'Type': instance.type,
  'Status': instance.status,
  'CreateBy': instance.createBy,
  'DateCreate': instance.dateCreate,
  'UpdateBy': instance.updateBy,
  'DateUpdate': instance.dateUpdate,
  'DeleteBY': instance.deleteBY,
  'DateDelete': instance.dateDelete,
};