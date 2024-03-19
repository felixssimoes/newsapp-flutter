// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'sources.repository.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

SourcesResponse _$SourcesResponseFromJson(Map<String, dynamic> json) {
  return _SourcesResponse.fromJson(json);
}

/// @nodoc
mixin _$SourcesResponse {
  String get status => throw _privateConstructorUsedError;
  List<Source>? get sources => throw _privateConstructorUsedError;
  String? get code => throw _privateConstructorUsedError;
  String? get message => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $SourcesResponseCopyWith<SourcesResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SourcesResponseCopyWith<$Res> {
  factory $SourcesResponseCopyWith(
          SourcesResponse value, $Res Function(SourcesResponse) then) =
      _$SourcesResponseCopyWithImpl<$Res, SourcesResponse>;
  @useResult
  $Res call(
      {String status, List<Source>? sources, String? code, String? message});
}

/// @nodoc
class _$SourcesResponseCopyWithImpl<$Res, $Val extends SourcesResponse>
    implements $SourcesResponseCopyWith<$Res> {
  _$SourcesResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = null,
    Object? sources = freezed,
    Object? code = freezed,
    Object? message = freezed,
  }) {
    return _then(_value.copyWith(
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String,
      sources: freezed == sources
          ? _value.sources
          : sources // ignore: cast_nullable_to_non_nullable
              as List<Source>?,
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
abstract class _$$SourcesResponseImplCopyWith<$Res>
    implements $SourcesResponseCopyWith<$Res> {
  factory _$$SourcesResponseImplCopyWith(_$SourcesResponseImpl value,
          $Res Function(_$SourcesResponseImpl) then) =
      __$$SourcesResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String status, List<Source>? sources, String? code, String? message});
}

/// @nodoc
class __$$SourcesResponseImplCopyWithImpl<$Res>
    extends _$SourcesResponseCopyWithImpl<$Res, _$SourcesResponseImpl>
    implements _$$SourcesResponseImplCopyWith<$Res> {
  __$$SourcesResponseImplCopyWithImpl(
      _$SourcesResponseImpl _value, $Res Function(_$SourcesResponseImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = null,
    Object? sources = freezed,
    Object? code = freezed,
    Object? message = freezed,
  }) {
    return _then(_$SourcesResponseImpl(
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String,
      sources: freezed == sources
          ? _value._sources
          : sources // ignore: cast_nullable_to_non_nullable
              as List<Source>?,
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
class _$SourcesResponseImpl implements _SourcesResponse {
  const _$SourcesResponseImpl(
      {required this.status,
      final List<Source>? sources,
      this.code,
      this.message})
      : _sources = sources;

  factory _$SourcesResponseImpl.fromJson(Map<String, dynamic> json) =>
      _$$SourcesResponseImplFromJson(json);

  @override
  final String status;
  final List<Source>? _sources;
  @override
  List<Source>? get sources {
    final value = _sources;
    if (value == null) return null;
    if (_sources is EqualUnmodifiableListView) return _sources;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  final String? code;
  @override
  final String? message;

  @override
  String toString() {
    return 'SourcesResponse(status: $status, sources: $sources, code: $code, message: $message)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SourcesResponseImpl &&
            (identical(other.status, status) || other.status == status) &&
            const DeepCollectionEquality().equals(other._sources, _sources) &&
            (identical(other.code, code) || other.code == code) &&
            (identical(other.message, message) || other.message == message));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, status,
      const DeepCollectionEquality().hash(_sources), code, message);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SourcesResponseImplCopyWith<_$SourcesResponseImpl> get copyWith =>
      __$$SourcesResponseImplCopyWithImpl<_$SourcesResponseImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$SourcesResponseImplToJson(
      this,
    );
  }
}

abstract class _SourcesResponse implements SourcesResponse {
  const factory _SourcesResponse(
      {required final String status,
      final List<Source>? sources,
      final String? code,
      final String? message}) = _$SourcesResponseImpl;

  factory _SourcesResponse.fromJson(Map<String, dynamic> json) =
      _$SourcesResponseImpl.fromJson;

  @override
  String get status;
  @override
  List<Source>? get sources;
  @override
  String? get code;
  @override
  String? get message;
  @override
  @JsonKey(ignore: true)
  _$$SourcesResponseImplCopyWith<_$SourcesResponseImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
