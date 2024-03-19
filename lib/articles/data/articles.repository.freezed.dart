// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'articles.repository.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

ArticlesResponse _$ArticlesResponseFromJson(Map<String, dynamic> json) {
  return _ArticlesResponse.fromJson(json);
}

/// @nodoc
mixin _$ArticlesResponse {
  String get status => throw _privateConstructorUsedError;
  List<Article>? get articles => throw _privateConstructorUsedError;
  int? get totalResults => throw _privateConstructorUsedError;
  String? get code => throw _privateConstructorUsedError;
  String? get message => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ArticlesResponseCopyWith<ArticlesResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ArticlesResponseCopyWith<$Res> {
  factory $ArticlesResponseCopyWith(
          ArticlesResponse value, $Res Function(ArticlesResponse) then) =
      _$ArticlesResponseCopyWithImpl<$Res, ArticlesResponse>;
  @useResult
  $Res call(
      {String status,
      List<Article>? articles,
      int? totalResults,
      String? code,
      String? message});
}

/// @nodoc
class _$ArticlesResponseCopyWithImpl<$Res, $Val extends ArticlesResponse>
    implements $ArticlesResponseCopyWith<$Res> {
  _$ArticlesResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = null,
    Object? articles = freezed,
    Object? totalResults = freezed,
    Object? code = freezed,
    Object? message = freezed,
  }) {
    return _then(_value.copyWith(
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String,
      articles: freezed == articles
          ? _value.articles
          : articles // ignore: cast_nullable_to_non_nullable
              as List<Article>?,
      totalResults: freezed == totalResults
          ? _value.totalResults
          : totalResults // ignore: cast_nullable_to_non_nullable
              as int?,
      code: freezed == code
          ? _value.code
          : code // ignore: cast_nullable_to_non_nullable
              as String?,
      message: freezed == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ArticlesResponseImplCopyWith<$Res>
    implements $ArticlesResponseCopyWith<$Res> {
  factory _$$ArticlesResponseImplCopyWith(_$ArticlesResponseImpl value,
          $Res Function(_$ArticlesResponseImpl) then) =
      __$$ArticlesResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String status,
      List<Article>? articles,
      int? totalResults,
      String? code,
      String? message});
}

/// @nodoc
class __$$ArticlesResponseImplCopyWithImpl<$Res>
    extends _$ArticlesResponseCopyWithImpl<$Res, _$ArticlesResponseImpl>
    implements _$$ArticlesResponseImplCopyWith<$Res> {
  __$$ArticlesResponseImplCopyWithImpl(_$ArticlesResponseImpl _value,
      $Res Function(_$ArticlesResponseImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = null,
    Object? articles = freezed,
    Object? totalResults = freezed,
    Object? code = freezed,
    Object? message = freezed,
  }) {
    return _then(_$ArticlesResponseImpl(
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String,
      articles: freezed == articles
          ? _value._articles
          : articles // ignore: cast_nullable_to_non_nullable
              as List<Article>?,
      totalResults: freezed == totalResults
          ? _value.totalResults
          : totalResults // ignore: cast_nullable_to_non_nullable
              as int?,
      code: freezed == code
          ? _value.code
          : code // ignore: cast_nullable_to_non_nullable
              as String?,
      message: freezed == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ArticlesResponseImpl implements _ArticlesResponse {
  const _$ArticlesResponseImpl(
      {required this.status,
      final List<Article>? articles,
      this.totalResults,
      this.code,
      this.message})
      : _articles = articles;

  factory _$ArticlesResponseImpl.fromJson(Map<String, dynamic> json) =>
      _$$ArticlesResponseImplFromJson(json);

  @override
  final String status;
  final List<Article>? _articles;
  @override
  List<Article>? get articles {
    final value = _articles;
    if (value == null) return null;
    if (_articles is EqualUnmodifiableListView) return _articles;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  final int? totalResults;
  @override
  final String? code;
  @override
  final String? message;

  @override
  String toString() {
    return 'ArticlesResponse(status: $status, articles: $articles, totalResults: $totalResults, code: $code, message: $message)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ArticlesResponseImpl &&
            (identical(other.status, status) || other.status == status) &&
            const DeepCollectionEquality().equals(other._articles, _articles) &&
            (identical(other.totalResults, totalResults) ||
                other.totalResults == totalResults) &&
            (identical(other.code, code) || other.code == code) &&
            (identical(other.message, message) || other.message == message));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      status,
      const DeepCollectionEquality().hash(_articles),
      totalResults,
      code,
      message);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ArticlesResponseImplCopyWith<_$ArticlesResponseImpl> get copyWith =>
      __$$ArticlesResponseImplCopyWithImpl<_$ArticlesResponseImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ArticlesResponseImplToJson(
      this,
    );
  }
}

abstract class _ArticlesResponse implements ArticlesResponse {
  const factory _ArticlesResponse(
      {required final String status,
      final List<Article>? articles,
      final int? totalResults,
      final String? code,
      final String? message}) = _$ArticlesResponseImpl;

  factory _ArticlesResponse.fromJson(Map<String, dynamic> json) =
      _$ArticlesResponseImpl.fromJson;

  @override
  String get status;
  @override
  List<Article>? get articles;
  @override
  int? get totalResults;
  @override
  String? get code;
  @override
  String? get message;
  @override
  @JsonKey(ignore: true)
  _$$ArticlesResponseImplCopyWith<_$ArticlesResponseImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
