import 'package:freezed_annotation/freezed_annotation.dart';

part 'source.model.freezed.dart';
part 'source.model.g.dart';

@freezed
class Source with _$Source {
  const factory Source({
    required String id,
    required String name,
    required String description,
    required String url,
    required String category,
    required String language,
    required String country,
  }) = _Source;

  factory Source.fromJson(Map<String, dynamic> json) => _$SourceFromJson(json);
}
