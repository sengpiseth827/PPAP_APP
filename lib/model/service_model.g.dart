part of 'service_model.dart';

ServiceModel _$ServiceModelFromJson(Map<String, dynamic> json) {
  return ServiceModel(
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

Map<String, dynamic> _$ServiceModelToJson(ServiceModel instance) => <String, dynamic>{
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