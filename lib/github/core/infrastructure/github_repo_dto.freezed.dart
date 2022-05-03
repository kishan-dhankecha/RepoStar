// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'github_repo_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

GithubRepoDTO _$GithubRepoDTOFromJson(Map<String, dynamic> json) {
  return _GithubRepoDTO.fromJson(json);
}

/// @nodoc
mixin _$GithubRepoDTO {
  UserDTO get owner => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  @JsonKey(fromJson: _descriptionFromJson)
  String get description => throw _privateConstructorUsedError;
  @JsonKey(name: 'stargazers_count')
  int get starGazersCount => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $GithubRepoDTOCopyWith<GithubRepoDTO> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $GithubRepoDTOCopyWith<$Res> {
  factory $GithubRepoDTOCopyWith(
          GithubRepoDTO value, $Res Function(GithubRepoDTO) then) =
      _$GithubRepoDTOCopyWithImpl<$Res>;
  $Res call(
      {UserDTO owner,
      String name,
      @JsonKey(fromJson: _descriptionFromJson) String description,
      @JsonKey(name: 'stargazers_count') int starGazersCount});

  $UserDTOCopyWith<$Res> get owner;
}

/// @nodoc
class _$GithubRepoDTOCopyWithImpl<$Res>
    implements $GithubRepoDTOCopyWith<$Res> {
  _$GithubRepoDTOCopyWithImpl(this._value, this._then);

  final GithubRepoDTO _value;
  // ignore: unused_field
  final $Res Function(GithubRepoDTO) _then;

  @override
  $Res call({
    Object? owner = freezed,
    Object? name = freezed,
    Object? description = freezed,
    Object? starGazersCount = freezed,
  }) {
    return _then(_value.copyWith(
      owner: owner == freezed
          ? _value.owner
          : owner // ignore: cast_nullable_to_non_nullable
              as UserDTO,
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      description: description == freezed
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      starGazersCount: starGazersCount == freezed
          ? _value.starGazersCount
          : starGazersCount // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }

  @override
  $UserDTOCopyWith<$Res> get owner {
    return $UserDTOCopyWith<$Res>(_value.owner, (value) {
      return _then(_value.copyWith(owner: value));
    });
  }
}

/// @nodoc
abstract class _$GithubRepoDTOCopyWith<$Res>
    implements $GithubRepoDTOCopyWith<$Res> {
  factory _$GithubRepoDTOCopyWith(
          _GithubRepoDTO value, $Res Function(_GithubRepoDTO) then) =
      __$GithubRepoDTOCopyWithImpl<$Res>;
  @override
  $Res call(
      {UserDTO owner,
      String name,
      @JsonKey(fromJson: _descriptionFromJson) String description,
      @JsonKey(name: 'stargazers_count') int starGazersCount});

  @override
  $UserDTOCopyWith<$Res> get owner;
}

/// @nodoc
class __$GithubRepoDTOCopyWithImpl<$Res>
    extends _$GithubRepoDTOCopyWithImpl<$Res>
    implements _$GithubRepoDTOCopyWith<$Res> {
  __$GithubRepoDTOCopyWithImpl(
      _GithubRepoDTO _value, $Res Function(_GithubRepoDTO) _then)
      : super(_value, (v) => _then(v as _GithubRepoDTO));

  @override
  _GithubRepoDTO get _value => super._value as _GithubRepoDTO;

  @override
  $Res call({
    Object? owner = freezed,
    Object? name = freezed,
    Object? description = freezed,
    Object? starGazersCount = freezed,
  }) {
    return _then(_GithubRepoDTO(
      owner: owner == freezed
          ? _value.owner
          : owner // ignore: cast_nullable_to_non_nullable
              as UserDTO,
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      description: description == freezed
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      starGazersCount: starGazersCount == freezed
          ? _value.starGazersCount
          : starGazersCount // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_GithubRepoDTO extends _GithubRepoDTO {
  const _$_GithubRepoDTO(
      {required this.owner,
      required this.name,
      @JsonKey(fromJson: _descriptionFromJson) required this.description,
      @JsonKey(name: 'stargazers_count') required this.starGazersCount})
      : super._();

  factory _$_GithubRepoDTO.fromJson(Map<String, dynamic> json) =>
      _$$_GithubRepoDTOFromJson(json);

  @override
  final UserDTO owner;
  @override
  final String name;
  @override
  @JsonKey(fromJson: _descriptionFromJson)
  final String description;
  @override
  @JsonKey(name: 'stargazers_count')
  final int starGazersCount;

  @override
  String toString() {
    return 'GithubRepoDTO(owner: $owner, name: $name, description: $description, starGazersCount: $starGazersCount)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _GithubRepoDTO &&
            const DeepCollectionEquality().equals(other.owner, owner) &&
            const DeepCollectionEquality().equals(other.name, name) &&
            const DeepCollectionEquality()
                .equals(other.description, description) &&
            const DeepCollectionEquality()
                .equals(other.starGazersCount, starGazersCount));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(owner),
      const DeepCollectionEquality().hash(name),
      const DeepCollectionEquality().hash(description),
      const DeepCollectionEquality().hash(starGazersCount));

  @JsonKey(ignore: true)
  @override
  _$GithubRepoDTOCopyWith<_GithubRepoDTO> get copyWith =>
      __$GithubRepoDTOCopyWithImpl<_GithubRepoDTO>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_GithubRepoDTOToJson(this);
  }
}

abstract class _GithubRepoDTO extends GithubRepoDTO {
  const factory _GithubRepoDTO(
      {required final UserDTO owner,
      required final String name,
      @JsonKey(fromJson: _descriptionFromJson)
          required final String description,
      @JsonKey(name: 'stargazers_count')
          required final int starGazersCount}) = _$_GithubRepoDTO;
  const _GithubRepoDTO._() : super._();

  factory _GithubRepoDTO.fromJson(Map<String, dynamic> json) =
      _$_GithubRepoDTO.fromJson;

  @override
  UserDTO get owner => throw _privateConstructorUsedError;
  @override
  String get name => throw _privateConstructorUsedError;
  @override
  @JsonKey(fromJson: _descriptionFromJson)
  String get description => throw _privateConstructorUsedError;
  @override
  @JsonKey(name: 'stargazers_count')
  int get starGazersCount => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$GithubRepoDTOCopyWith<_GithubRepoDTO> get copyWith =>
      throw _privateConstructorUsedError;
}
