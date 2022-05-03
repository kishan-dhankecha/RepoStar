// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'github_headers.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

GithubHeaders _$GithubHeadersFromJson(Map<String, dynamic> json) {
  return _GithubHeaders.fromJson(json);
}

/// @nodoc
mixin _$GithubHeaders {
  String? get eTag => throw _privateConstructorUsedError;
  PaginationLink? get link => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $GithubHeadersCopyWith<GithubHeaders> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $GithubHeadersCopyWith<$Res> {
  factory $GithubHeadersCopyWith(
          GithubHeaders value, $Res Function(GithubHeaders) then) =
      _$GithubHeadersCopyWithImpl<$Res>;
  $Res call({String? eTag, PaginationLink? link});

  $PaginationLinkCopyWith<$Res>? get link;
}

/// @nodoc
class _$GithubHeadersCopyWithImpl<$Res>
    implements $GithubHeadersCopyWith<$Res> {
  _$GithubHeadersCopyWithImpl(this._value, this._then);

  final GithubHeaders _value;
  // ignore: unused_field
  final $Res Function(GithubHeaders) _then;

  @override
  $Res call({
    Object? eTag = freezed,
    Object? link = freezed,
  }) {
    return _then(_value.copyWith(
      eTag: eTag == freezed
          ? _value.eTag
          : eTag // ignore: cast_nullable_to_non_nullable
              as String?,
      link: link == freezed
          ? _value.link
          : link // ignore: cast_nullable_to_non_nullable
              as PaginationLink?,
    ));
  }

  @override
  $PaginationLinkCopyWith<$Res>? get link {
    if (_value.link == null) {
      return null;
    }

    return $PaginationLinkCopyWith<$Res>(_value.link!, (value) {
      return _then(_value.copyWith(link: value));
    });
  }
}

/// @nodoc
abstract class _$GithubHeadersCopyWith<$Res>
    implements $GithubHeadersCopyWith<$Res> {
  factory _$GithubHeadersCopyWith(
          _GithubHeaders value, $Res Function(_GithubHeaders) then) =
      __$GithubHeadersCopyWithImpl<$Res>;
  @override
  $Res call({String? eTag, PaginationLink? link});

  @override
  $PaginationLinkCopyWith<$Res>? get link;
}

/// @nodoc
class __$GithubHeadersCopyWithImpl<$Res>
    extends _$GithubHeadersCopyWithImpl<$Res>
    implements _$GithubHeadersCopyWith<$Res> {
  __$GithubHeadersCopyWithImpl(
      _GithubHeaders _value, $Res Function(_GithubHeaders) _then)
      : super(_value, (v) => _then(v as _GithubHeaders));

  @override
  _GithubHeaders get _value => super._value as _GithubHeaders;

  @override
  $Res call({
    Object? eTag = freezed,
    Object? link = freezed,
  }) {
    return _then(_GithubHeaders(
      eTag: eTag == freezed
          ? _value.eTag
          : eTag // ignore: cast_nullable_to_non_nullable
              as String?,
      link: link == freezed
          ? _value.link
          : link // ignore: cast_nullable_to_non_nullable
              as PaginationLink?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_GithubHeaders extends _GithubHeaders {
  const _$_GithubHeaders({this.eTag, this.link}) : super._();

  factory _$_GithubHeaders.fromJson(Map<String, dynamic> json) =>
      _$$_GithubHeadersFromJson(json);

  @override
  final String? eTag;
  @override
  final PaginationLink? link;

  @override
  String toString() {
    return 'GithubHeaders(eTag: $eTag, link: $link)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _GithubHeaders &&
            const DeepCollectionEquality().equals(other.eTag, eTag) &&
            const DeepCollectionEquality().equals(other.link, link));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(eTag),
      const DeepCollectionEquality().hash(link));

  @JsonKey(ignore: true)
  @override
  _$GithubHeadersCopyWith<_GithubHeaders> get copyWith =>
      __$GithubHeadersCopyWithImpl<_GithubHeaders>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_GithubHeadersToJson(this);
  }
}

abstract class _GithubHeaders extends GithubHeaders {
  const factory _GithubHeaders(
      {final String? eTag, final PaginationLink? link}) = _$_GithubHeaders;
  const _GithubHeaders._() : super._();

  factory _GithubHeaders.fromJson(Map<String, dynamic> json) =
      _$_GithubHeaders.fromJson;

  @override
  String? get eTag => throw _privateConstructorUsedError;
  @override
  PaginationLink? get link => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$GithubHeadersCopyWith<_GithubHeaders> get copyWith =>
      throw _privateConstructorUsedError;
}

PaginationLink _$PaginationLinkFromJson(Map<String, dynamic> json) {
  return _PaginationLink.fromJson(json);
}

/// @nodoc
mixin _$PaginationLink {
  int get maxPage => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $PaginationLinkCopyWith<PaginationLink> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PaginationLinkCopyWith<$Res> {
  factory $PaginationLinkCopyWith(
          PaginationLink value, $Res Function(PaginationLink) then) =
      _$PaginationLinkCopyWithImpl<$Res>;
  $Res call({int maxPage});
}

/// @nodoc
class _$PaginationLinkCopyWithImpl<$Res>
    implements $PaginationLinkCopyWith<$Res> {
  _$PaginationLinkCopyWithImpl(this._value, this._then);

  final PaginationLink _value;
  // ignore: unused_field
  final $Res Function(PaginationLink) _then;

  @override
  $Res call({
    Object? maxPage = freezed,
  }) {
    return _then(_value.copyWith(
      maxPage: maxPage == freezed
          ? _value.maxPage
          : maxPage // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
abstract class _$PaginationLinkCopyWith<$Res>
    implements $PaginationLinkCopyWith<$Res> {
  factory _$PaginationLinkCopyWith(
          _PaginationLink value, $Res Function(_PaginationLink) then) =
      __$PaginationLinkCopyWithImpl<$Res>;
  @override
  $Res call({int maxPage});
}

/// @nodoc
class __$PaginationLinkCopyWithImpl<$Res>
    extends _$PaginationLinkCopyWithImpl<$Res>
    implements _$PaginationLinkCopyWith<$Res> {
  __$PaginationLinkCopyWithImpl(
      _PaginationLink _value, $Res Function(_PaginationLink) _then)
      : super(_value, (v) => _then(v as _PaginationLink));

  @override
  _PaginationLink get _value => super._value as _PaginationLink;

  @override
  $Res call({
    Object? maxPage = freezed,
  }) {
    return _then(_PaginationLink(
      maxPage: maxPage == freezed
          ? _value.maxPage
          : maxPage // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_PaginationLink extends _PaginationLink {
  const _$_PaginationLink({required this.maxPage}) : super._();

  factory _$_PaginationLink.fromJson(Map<String, dynamic> json) =>
      _$$_PaginationLinkFromJson(json);

  @override
  final int maxPage;

  @override
  String toString() {
    return 'PaginationLink(maxPage: $maxPage)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _PaginationLink &&
            const DeepCollectionEquality().equals(other.maxPage, maxPage));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(maxPage));

  @JsonKey(ignore: true)
  @override
  _$PaginationLinkCopyWith<_PaginationLink> get copyWith =>
      __$PaginationLinkCopyWithImpl<_PaginationLink>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_PaginationLinkToJson(this);
  }
}

abstract class _PaginationLink extends PaginationLink {
  const factory _PaginationLink({required final int maxPage}) =
      _$_PaginationLink;
  const _PaginationLink._() : super._();

  factory _PaginationLink.fromJson(Map<String, dynamic> json) =
      _$_PaginationLink.fromJson;

  @override
  int get maxPage => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$PaginationLinkCopyWith<_PaginationLink> get copyWith =>
      throw _privateConstructorUsedError;
}
