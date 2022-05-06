// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'readme.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$Readme {
  String get html => throw _privateConstructorUsedError;
  bool get starred => throw _privateConstructorUsedError;
  String get fullName => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $ReadmeCopyWith<Readme> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ReadmeCopyWith<$Res> {
  factory $ReadmeCopyWith(Readme value, $Res Function(Readme) then) =
      _$ReadmeCopyWithImpl<$Res>;
  $Res call({String html, bool starred, String fullName});
}

/// @nodoc
class _$ReadmeCopyWithImpl<$Res> implements $ReadmeCopyWith<$Res> {
  _$ReadmeCopyWithImpl(this._value, this._then);

  final Readme _value;
  // ignore: unused_field
  final $Res Function(Readme) _then;

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
abstract class _$ReadmeCopyWith<$Res> implements $ReadmeCopyWith<$Res> {
  factory _$ReadmeCopyWith(_Readme value, $Res Function(_Readme) then) =
      __$ReadmeCopyWithImpl<$Res>;
  @override
  $Res call({String html, bool starred, String fullName});
}

/// @nodoc
class __$ReadmeCopyWithImpl<$Res> extends _$ReadmeCopyWithImpl<$Res>
    implements _$ReadmeCopyWith<$Res> {
  __$ReadmeCopyWithImpl(_Readme _value, $Res Function(_Readme) _then)
      : super(_value, (v) => _then(v as _Readme));

  @override
  _Readme get _value => super._value as _Readme;

  @override
  $Res call({
    Object? html = freezed,
    Object? starred = freezed,
    Object? fullName = freezed,
  }) {
    return _then(_Readme(
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

class _$_Readme extends _Readme {
  const _$_Readme(
      {required this.html, required this.starred, required this.fullName})
      : super._();

  @override
  final String html;
  @override
  final bool starred;
  @override
  final String fullName;

  @override
  String toString() {
    return 'Readme(html: $html, starred: $starred, fullName: $fullName)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _Readme &&
            const DeepCollectionEquality().equals(other.html, html) &&
            const DeepCollectionEquality().equals(other.starred, starred) &&
            const DeepCollectionEquality().equals(other.fullName, fullName));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(html),
      const DeepCollectionEquality().hash(starred),
      const DeepCollectionEquality().hash(fullName));

  @JsonKey(ignore: true)
  @override
  _$ReadmeCopyWith<_Readme> get copyWith =>
      __$ReadmeCopyWithImpl<_Readme>(this, _$identity);
}

abstract class _Readme extends Readme {
  const factory _Readme(
      {required final String html,
      required final bool starred,
      required final String fullName}) = _$_Readme;
  const _Readme._() : super._();

  @override
  String get html => throw _privateConstructorUsedError;
  @override
  bool get starred => throw _privateConstructorUsedError;
  @override
  String get fullName => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$ReadmeCopyWith<_Readme> get copyWith => throw _privateConstructorUsedError;
}
