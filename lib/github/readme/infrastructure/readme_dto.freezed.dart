// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'readme_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

ReadmeDto _$ReadmeDtoFromJson(Map<String, dynamic> json) {
  return _ReadmeDto.fromJson(json);
}

/// @nodoc
mixin _$ReadmeDto {
  String get html => throw _privateConstructorUsedError;
  bool get starred => throw _privateConstructorUsedError;
  String get fullName => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ReadmeDtoCopyWith<ReadmeDto> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ReadmeDtoCopyWith<$Res> {
  factory $ReadmeDtoCopyWith(ReadmeDto value, $Res Function(ReadmeDto) then) =
      _$ReadmeDtoCopyWithImpl<$Res>;
  $Res call({String html, bool starred, String fullName});
}

/// @nodoc
class _$ReadmeDtoCopyWithImpl<$Res> implements $ReadmeDtoCopyWith<$Res> {
  _$ReadmeDtoCopyWithImpl(this._value, this._then);

  final ReadmeDto _value;
  // ignore: unused_field
  final $Res Function(ReadmeDto) _then;

  @override
  $Res call({
    Object? html = freezed,
    Object? starred = freezed,
    Object? fullName = freezed,
  }) {
    return _then(_value.copyWith(
      html: html == freezed
          ? _value.html
          : html // ignore: cast_nullable_to_non_nullable
              as String,
      starred: starred == freezed
          ? _value.starred
          : starred // ignore: cast_nullable_to_non_nullable
              as bool,
      fullName: fullName == freezed
          ? _value.fullName
          : fullName // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
abstract class _$ReadmeDtoCopyWith<$Res> implements $ReadmeDtoCopyWith<$Res> {
  factory _$ReadmeDtoCopyWith(
          _ReadmeDto value, $Res Function(_ReadmeDto) then) =
      __$ReadmeDtoCopyWithImpl<$Res>;
  @override
  $Res call({String html, bool starred, String fullName});
}

/// @nodoc
class __$ReadmeDtoCopyWithImpl<$Res> extends _$ReadmeDtoCopyWithImpl<$Res>
    implements _$ReadmeDtoCopyWith<$Res> {
  __$ReadmeDtoCopyWithImpl(_ReadmeDto _value, $Res Function(_ReadmeDto) _then)
      : super(_value, (v) => _then(v as _ReadmeDto));

  @override
  _ReadmeDto get _value => super._value as _ReadmeDto;

  @override
  $Res call({
    Object? html = freezed,
    Object? starred = freezed,
    Object? fullName = freezed,
  }) {
    return _then(_ReadmeDto(
      html: html == freezed
          ? _value.html
          : html // ignore: cast_nullable_to_non_nullable
              as String,
      starred: starred == freezed
          ? _value.starred
          : starred // ignore: cast_nullable_to_non_nullable
              as bool,
      fullName: fullName == freezed
          ? _value.fullName
          : fullName // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_ReadmeDto extends _ReadmeDto {
  const _$_ReadmeDto(
      {required this.html, required this.starred, required this.fullName})
      : super._();

  factory _$_ReadmeDto.fromJson(Map<String, dynamic> json) =>
      _$$_ReadmeDtoFromJson(json);

  @override
  final String html;
  @override
  final bool starred;
  @override
  final String fullName;

  @override
  String toString() {
    return 'ReadmeDto(html: $html, starred: $starred, fullName: $fullName)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _ReadmeDto &&
            const DeepCollectionEquality().equals(other.html, html) &&
            const DeepCollectionEquality().equals(other.starred, starred) &&
            const DeepCollectionEquality().equals(other.fullName, fullName));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(html),
      const DeepCollectionEquality().hash(starred),
      const DeepCollectionEquality().hash(fullName));

  @JsonKey(ignore: true)
  @override
  _$ReadmeDtoCopyWith<_ReadmeDto> get copyWith =>
      __$ReadmeDtoCopyWithImpl<_ReadmeDto>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_ReadmeDtoToJson(this);
  }
}

abstract class _ReadmeDto extends ReadmeDto {
  const factory _ReadmeDto(
      {required final String html,
      required final bool starred,
      required final String fullName}) = _$_ReadmeDto;
  const _ReadmeDto._() : super._();

  factory _ReadmeDto.fromJson(Map<String, dynamic> json) =
      _$_ReadmeDto.fromJson;

  @override
  String get html => throw _privateConstructorUsedError;
  @override
  bool get starred => throw _privateConstructorUsedError;
  @override
  String get fullName => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$ReadmeDtoCopyWith<_ReadmeDto> get copyWith =>
      throw _privateConstructorUsedError;
}
