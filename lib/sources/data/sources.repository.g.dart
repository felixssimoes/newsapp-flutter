// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sources.repository.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$SourcesResponseImpl _$$SourcesResponseImplFromJson(
        Map<String, dynamic> json) =>
    _$SourcesResponseImpl(
      status: json['status'] as String,
      sources: (json['sources'] as List<dynamic>?)
          ?.map((e) => Source.fromJson(e as Map<String, dynamic>))
          .toList(),
      code: json['code'] as String?,
      message: json['message'] as String?,
    );

Map<String, dynamic> _$$SourcesResponseImplToJson(
        _$SourcesResponseImpl instance) =>
    <String, dynamic>{
      'status': instance.status,
      'sources': instance.sources,
      'code': instance.code,
      'message': instance.message,
    };
