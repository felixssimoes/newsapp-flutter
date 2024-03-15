// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'articles.repository.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ArticlesResponseImpl _$$ArticlesResponseImplFromJson(
        Map<String, dynamic> json) =>
    _$ArticlesResponseImpl(
      status: json['status'] as String,
      articles: (json['articles'] as List<dynamic>?)
          ?.map((e) => Article.fromJson(e as Map<String, dynamic>))
          .toList(),
      totalResults: json['totalResults'] as int?,
      code: json['code'] as String?,
      message: json['message'] as String?,
    );

Map<String, dynamic> _$$ArticlesResponseImplToJson(
        _$ArticlesResponseImpl instance) =>
    <String, dynamic>{
      'status': instance.status,
      'articles': instance.articles,
      'totalResults': instance.totalResults,
      'code': instance.code,
      'message': instance.message,
    };

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
