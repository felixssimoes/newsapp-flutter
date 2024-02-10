// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'article.model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ArticleSourceImpl _$$ArticleSourceImplFromJson(Map<String, dynamic> json) =>
    _$ArticleSourceImpl(
      id: json['id'] as String?,
      name: json['name'] as String?,
    );

Map<String, dynamic> _$$ArticleSourceImplToJson(_$ArticleSourceImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
    };

_$ArticleImpl _$$ArticleImplFromJson(Map<String, dynamic> json) =>
    _$ArticleImpl(
      source: ArticleSource.fromJson(json['source'] as Map<String, dynamic>),
      title: json['title'] as String,
      url: json['url'] as String,
      publishedAt: DateTime.parse(json['publishedAt'] as String),
      author: json['author'] as String?,
      description: json['description'] as String?,
      urlToImage: json['urlToImage'] as String?,
      content: json['content'] as String?,
    );

Map<String, dynamic> _$$ArticleImplToJson(_$ArticleImpl instance) =>
    <String, dynamic>{
      'source': instance.source,
      'title': instance.title,
      'url': instance.url,
      'publishedAt': instance.publishedAt.toIso8601String(),
      'author': instance.author,
      'description': instance.description,
      'urlToImage': instance.urlToImage,
      'content': instance.content,
    };
