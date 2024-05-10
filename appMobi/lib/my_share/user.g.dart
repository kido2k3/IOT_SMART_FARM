// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

User _$UserFromJson(Map<String, dynamic> json) => User(
      code: json['code'] as String,
      name: json['name'] as String? ?? "",
      id: json['id'] as String,
      area: json['area'] as String? ?? "",
      mixer1: (json['mixer1'] as num?)?.toDouble() ?? 0.0,
      mixer2: (json['mixer2'] as num?)?.toDouble() ?? 0.0,
      mixer3: (json['mixer3'] as num?)?.toDouble() ?? 0.0,
      cycle: (json['cycle'] as num?)?.toInt() ?? 0,
      starttime: json['start time'] as String? ?? "",
    );

Map<String, dynamic> _$UserToJson(User instance) => <String, dynamic>{
      'code': instance.code,
      'name': instance.name,
      'id': instance.id,
      'area': instance.area,
      'mixer1': instance.mixer1,
      'mixer2': instance.mixer2,
      'mixer3': instance.mixer3,
      'cycle': instance.cycle,
      'start time': instance.starttime,
    };
