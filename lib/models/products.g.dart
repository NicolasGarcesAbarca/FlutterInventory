// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'products.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ProductImpl _$$ProductImplFromJson(Map<String, dynamic> json) =>
    _$ProductImpl(
      name: json['name'] as String,
      code: json['code'] as String,
      value: json['value'] as String,
      chilecompra: json['chilecompra'] as String,
      category: json['category'] as String,
      description: json['description'] as String,
    );

Map<String, dynamic> _$$ProductImplToJson(_$ProductImpl instance) =>
    <String, dynamic>{
      'name': instance.name,
      'code': instance.code,
      'value': instance.value,
      'chilecompra': instance.chilecompra,
      'category': instance.category,
      'description': instance.description,
    };
