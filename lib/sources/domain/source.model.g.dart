// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'source.model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$SourceImpl _$$SourceImplFromJson(Map<String, dynamic> json) => _$SourceImpl(
      id: json['id'] as String,
      name: json['name'] as String,
      description: json['description'] as String,
      url: json['url'] as String,
      category: json['category'] as String,
      language: json['language'] as String,
      country: json['country'] as String,
    );

Map<String, dynamic> _$$SourceImplToJson(_$SourceImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'description': instance.description,
      'url': instance.url,
      'category': instance.category,
      'language': instance.language,
      'country': instance.country,
    };
