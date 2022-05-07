// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'readme_notifier.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$ReadmeState {
  bool get isStarSwitched => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(bool isStarSwitched) initial,
    required TResult Function(bool isStarSwitched) loadInProgress,
    required TResult Function(Fresh<Readme?> readme, bool isStarSwitched)
        loadSuccess,
    required TResult Function(GithubFailure failure, bool isStarSwitched)
        loadFailure,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(bool isStarSwitched)? initial,
    TResult Function(bool isStarSwitched)? loadInProgress,
    TResult Function(Fresh<Readme?> readme, bool isStarSwitched)? loadSuccess,
    TResult Function(GithubFailure failure, bool isStarSwitched)? loadFailure,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(bool isStarSwitched)? initial,
    TResult Function(bool isStarSwitched)? loadInProgress,
    TResult Function(Fresh<Readme?> readme, bool isStarSwitched)? loadSuccess,
    TResult Function(GithubFailure failure, bool isStarSwitched)? loadFailure,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_LoadInProgress value) loadInProgress,
    required TResult Function(_LoadSuccess value) loadSuccess,
    required TResult Function(_LoadFailure value) loadFailure,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_LoadInProgress value)? loadInProgress,
    TResult Function(_LoadSuccess value)? loadSuccess,
    TResult Function(_LoadFailure value)? loadFailure,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_LoadInProgress value)? loadInProgress,
    TResult Function(_LoadSuccess value)? loadSuccess,
    TResult Function(_LoadFailure value)? loadFailure,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $ReadmeStateCopyWith<ReadmeState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ReadmeStateCopyWith<$Res> {
  factory $ReadmeStateCopyWith(
          ReadmeState value, $Res Function(ReadmeState) then) =
      _$ReadmeStateCopyWithImpl<$Res>;
  $Res call({bool isStarSwitched});
}

/// @nodoc
class _$ReadmeStateCopyWithImpl<$Res> implements $ReadmeStateCopyWith<$Res> {
  _$ReadmeStateCopyWithImpl(this._value, this._then);

  final ReadmeState _value;
  // ignore: unused_field
  final $Res Function(ReadmeState) _then;

  @override
  $Res call({
    Object? isStarSwitched = freezed,
  }) {
    return _then(_value.copyWith(
      isStarSwitched: isStarSwitched == freezed
          ? _value.isStarSwitched
          : isStarSwitched // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
abstract class _$InitialCopyWith<$Res> implements $ReadmeStateCopyWith<$Res> {
  factory _$InitialCopyWith(_Initial value, $Res Function(_Initial) then) =
      __$InitialCopyWithImpl<$Res>;
  @override
  $Res call({bool isStarSwitched});
}

/// @nodoc
class __$InitialCopyWithImpl<$Res> extends _$ReadmeStateCopyWithImpl<$Res>
    implements _$InitialCopyWith<$Res> {
  __$InitialCopyWithImpl(_Initial _value, $Res Function(_Initial) _then)
      : super(_value, (v) => _then(v as _Initial));

  @override
  _Initial get _value => super._value as _Initial;

  @override
  $Res call({
    Object? isStarSwitched = freezed,
  }) {
    return _then(_Initial(
      isStarSwitched: isStarSwitched == freezed
          ? _value.isStarSwitched
          : isStarSwitched // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$_Initial extends _Initial {
  const _$_Initial({this.isStarSwitched = false}) : super._();

  @override
  @JsonKey()
  final bool isStarSwitched;

  @override
  String toString() {
    return 'ReadmeState.initial(isStarSwitched: $isStarSwitched)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _Initial &&
            const DeepCollectionEquality()
                .equals(other.isStarSwitched, isStarSwitched));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(isStarSwitched));

  @JsonKey(ignore: true)
  @override
  _$InitialCopyWith<_Initial> get copyWith =>
      __$InitialCopyWithImpl<_Initial>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(bool isStarSwitched) initial,
    required TResult Function(bool isStarSwitched) loadInProgress,
    required TResult Function(Fresh<Readme?> readme, bool isStarSwitched)
        loadSuccess,
    required TResult Function(GithubFailure failure, bool isStarSwitched)
        loadFailure,
  }) {
    return initial(isStarSwitched);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(bool isStarSwitched)? initial,
    TResult Function(bool isStarSwitched)? loadInProgress,
    TResult Function(Fresh<Readme?> readme, bool isStarSwitched)? loadSuccess,
    TResult Function(GithubFailure failure, bool isStarSwitched)? loadFailure,
  }) {
    return initial?.call(isStarSwitched);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(bool isStarSwitched)? initial,
    TResult Function(bool isStarSwitched)? loadInProgress,
    TResult Function(Fresh<Readme?> readme, bool isStarSwitched)? loadSuccess,
    TResult Function(GithubFailure failure, bool isStarSwitched)? loadFailure,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(isStarSwitched);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_LoadInProgress value) loadInProgress,
    required TResult Function(_LoadSuccess value) loadSuccess,
    required TResult Function(_LoadFailure value) loadFailure,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_LoadInProgress value)? loadInProgress,
    TResult Function(_LoadSuccess value)? loadSuccess,
    TResult Function(_LoadFailure value)? loadFailure,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_LoadInProgress value)? loadInProgress,
    TResult Function(_LoadSuccess value)? loadSuccess,
    TResult Function(_LoadFailure value)? loadFailure,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class _Initial extends ReadmeState {
  const factory _Initial({final bool isStarSwitched}) = _$_Initial;
  const _Initial._() : super._();

  @override
  bool get isStarSwitched => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$InitialCopyWith<_Initial> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$LoadInProgressCopyWith<$Res>
    implements $ReadmeStateCopyWith<$Res> {
  factory _$LoadInProgressCopyWith(
          _LoadInProgress value, $Res Function(_LoadInProgress) then) =
      __$LoadInProgressCopyWithImpl<$Res>;
  @override
  $Res call({bool isStarSwitched});
}

/// @nodoc
class __$LoadInProgressCopyWithImpl<$Res>
    extends _$ReadmeStateCopyWithImpl<$Res>
    implements _$LoadInProgressCopyWith<$Res> {
  __$LoadInProgressCopyWithImpl(
      _LoadInProgress _value, $Res Function(_LoadInProgress) _then)
      : super(_value, (v) => _then(v as _LoadInProgress));

  @override
  _LoadInProgress get _value => super._value as _LoadInProgress;

  @override
  $Res call({
    Object? isStarSwitched = freezed,
  }) {
    return _then(_LoadInProgress(
      isStarSwitched: isStarSwitched == freezed
          ? _value.isStarSwitched
          : isStarSwitched // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$_LoadInProgress extends _LoadInProgress {
  const _$_LoadInProgress({this.isStarSwitched = false}) : super._();

  @override
  @JsonKey()
  final bool isStarSwitched;

  @override
  String toString() {
    return 'ReadmeState.loadInProgress(isStarSwitched: $isStarSwitched)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _LoadInProgress &&
            const DeepCollectionEquality()
                .equals(other.isStarSwitched, isStarSwitched));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(isStarSwitched));

  @JsonKey(ignore: true)
  @override
  _$LoadInProgressCopyWith<_LoadInProgress> get copyWith =>
      __$LoadInProgressCopyWithImpl<_LoadInProgress>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(bool isStarSwitched) initial,
    required TResult Function(bool isStarSwitched) loadInProgress,
    required TResult Function(Fresh<Readme?> readme, bool isStarSwitched)
        loadSuccess,
    required TResult Function(GithubFailure failure, bool isStarSwitched)
        loadFailure,
  }) {
    return loadInProgress(isStarSwitched);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(bool isStarSwitched)? initial,
    TResult Function(bool isStarSwitched)? loadInProgress,
    TResult Function(Fresh<Readme?> readme, bool isStarSwitched)? loadSuccess,
    TResult Function(GithubFailure failure, bool isStarSwitched)? loadFailure,
  }) {
    return loadInProgress?.call(isStarSwitched);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(bool isStarSwitched)? initial,
    TResult Function(bool isStarSwitched)? loadInProgress,
    TResult Function(Fresh<Readme?> readme, bool isStarSwitched)? loadSuccess,
    TResult Function(GithubFailure failure, bool isStarSwitched)? loadFailure,
    required TResult orElse(),
  }) {
    if (loadInProgress != null) {
      return loadInProgress(isStarSwitched);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_LoadInProgress value) loadInProgress,
    required TResult Function(_LoadSuccess value) loadSuccess,
    required TResult Function(_LoadFailure value) loadFailure,
  }) {
    return loadInProgress(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_LoadInProgress value)? loadInProgress,
    TResult Function(_LoadSuccess value)? loadSuccess,
    TResult Function(_LoadFailure value)? loadFailure,
  }) {
    return loadInProgress?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_LoadInProgress value)? loadInProgress,
    TResult Function(_LoadSuccess value)? loadSuccess,
    TResult Function(_LoadFailure value)? loadFailure,
    required TResult orElse(),
  }) {
    if (loadInProgress != null) {
      return loadInProgress(this);
    }
    return orElse();
  }
}

abstract class _LoadInProgress extends ReadmeState {
  const factory _LoadInProgress({final bool isStarSwitched}) =
      _$_LoadInProgress;
  const _LoadInProgress._() : super._();

  @override
  bool get isStarSwitched => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$LoadInProgressCopyWith<_LoadInProgress> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$LoadSuccessCopyWith<$Res>
    implements $ReadmeStateCopyWith<$Res> {
  factory _$LoadSuccessCopyWith(
          _LoadSuccess value, $Res Function(_LoadSuccess) then) =
      __$LoadSuccessCopyWithImpl<$Res>;
  @override
  $Res call({Fresh<Readme?> readme, bool isStarSwitched});

  $FreshCopyWith<Readme?, $Res> get readme;
}

/// @nodoc
class __$LoadSuccessCopyWithImpl<$Res> extends _$ReadmeStateCopyWithImpl<$Res>
    implements _$LoadSuccessCopyWith<$Res> {
  __$LoadSuccessCopyWithImpl(
      _LoadSuccess _value, $Res Function(_LoadSuccess) _then)
      : super(_value, (v) => _then(v as _LoadSuccess));

  @override
  _LoadSuccess get _value => super._value as _LoadSuccess;

  @override
  $Res call({
    Object? readme = freezed,
    Object? isStarSwitched = freezed,
  }) {
    return _then(_LoadSuccess(
      readme == freezed
          ? _value.readme
          : readme // ignore: cast_nullable_to_non_nullable
              as Fresh<Readme?>,
      isStarSwitched: isStarSwitched == freezed
          ? _value.isStarSwitched
          : isStarSwitched // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }

  @override
  $FreshCopyWith<Readme?, $Res> get readme {
    return $FreshCopyWith<Readme?, $Res>(_value.readme, (value) {
      return _then(_value.copyWith(readme: value));
    });
  }
}

/// @nodoc

class _$_LoadSuccess extends _LoadSuccess {
  const _$_LoadSuccess(this.readme, {this.isStarSwitched = false}) : super._();

  @override
  final Fresh<Readme?> readme;
  @override
  @JsonKey()
  final bool isStarSwitched;

  @override
  String toString() {
    return 'ReadmeState.loadSuccess(readme: $readme, isStarSwitched: $isStarSwitched)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _LoadSuccess &&
            const DeepCollectionEquality().equals(other.readme, readme) &&
            const DeepCollectionEquality()
                .equals(other.isStarSwitched, isStarSwitched));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(readme),
      const DeepCollectionEquality().hash(isStarSwitched));

  @JsonKey(ignore: true)
  @override
  _$LoadSuccessCopyWith<_LoadSuccess> get copyWith =>
      __$LoadSuccessCopyWithImpl<_LoadSuccess>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(bool isStarSwitched) initial,
    required TResult Function(bool isStarSwitched) loadInProgress,
    required TResult Function(Fresh<Readme?> readme, bool isStarSwitched)
        loadSuccess,
    required TResult Function(GithubFailure failure, bool isStarSwitched)
        loadFailure,
  }) {
    return loadSuccess(readme, isStarSwitched);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(bool isStarSwitched)? initial,
    TResult Function(bool isStarSwitched)? loadInProgress,
    TResult Function(Fresh<Readme?> readme, bool isStarSwitched)? loadSuccess,
    TResult Function(GithubFailure failure, bool isStarSwitched)? loadFailure,
  }) {
    return loadSuccess?.call(readme, isStarSwitched);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(bool isStarSwitched)? initial,
    TResult Function(bool isStarSwitched)? loadInProgress,
    TResult Function(Fresh<Readme?> readme, bool isStarSwitched)? loadSuccess,
    TResult Function(GithubFailure failure, bool isStarSwitched)? loadFailure,
    required TResult orElse(),
  }) {
    if (loadSuccess != null) {
      return loadSuccess(readme, isStarSwitched);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_LoadInProgress value) loadInProgress,
    required TResult Function(_LoadSuccess value) loadSuccess,
    required TResult Function(_LoadFailure value) loadFailure,
  }) {
    return loadSuccess(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_LoadInProgress value)? loadInProgress,
    TResult Function(_LoadSuccess value)? loadSuccess,
    TResult Function(_LoadFailure value)? loadFailure,
  }) {
    return loadSuccess?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_LoadInProgress value)? loadInProgress,
    TResult Function(_LoadSuccess value)? loadSuccess,
    TResult Function(_LoadFailure value)? loadFailure,
    required TResult orElse(),
  }) {
    if (loadSuccess != null) {
      return loadSuccess(this);
    }
    return orElse();
  }
}

abstract class _LoadSuccess extends ReadmeState {
  const factory _LoadSuccess(final Fresh<Readme?> readme,
      {final bool isStarSwitched}) = _$_LoadSuccess;
  const _LoadSuccess._() : super._();

  Fresh<Readme?> get readme => throw _privateConstructorUsedError;
  @override
  bool get isStarSwitched => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$LoadSuccessCopyWith<_LoadSuccess> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$LoadFailureCopyWith<$Res>
    implements $ReadmeStateCopyWith<$Res> {
  factory _$LoadFailureCopyWith(
          _LoadFailure value, $Res Function(_LoadFailure) then) =
      __$LoadFailureCopyWithImpl<$Res>;
  @override
  $Res call({GithubFailure failure, bool isStarSwitched});

  $GithubFailureCopyWith<$Res> get failure;
}

/// @nodoc
class __$LoadFailureCopyWithImpl<$Res> extends _$ReadmeStateCopyWithImpl<$Res>
    implements _$LoadFailureCopyWith<$Res> {
  __$LoadFailureCopyWithImpl(
      _LoadFailure _value, $Res Function(_LoadFailure) _then)
      : super(_value, (v) => _then(v as _LoadFailure));

  @override
  _LoadFailure get _value => super._value as _LoadFailure;

  @override
  $Res call({
    Object? failure = freezed,
    Object? isStarSwitched = freezed,
  }) {
    return _then(_LoadFailure(
      failure == freezed
          ? _value.failure
          : failure // ignore: cast_nullable_to_non_nullable
              as GithubFailure,
      isStarSwitched: isStarSwitched == freezed
          ? _value.isStarSwitched
          : isStarSwitched // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }

  @override
  $GithubFailureCopyWith<$Res> get failure {
    return $GithubFailureCopyWith<$Res>(_value.failure, (value) {
      return _then(_value.copyWith(failure: value));
    });
  }
}

/// @nodoc

class _$_LoadFailure extends _LoadFailure {
  const _$_LoadFailure(this.failure, {this.isStarSwitched = false}) : super._();

  @override
  final GithubFailure failure;
  @override
  @JsonKey()
  final bool isStarSwitched;

  @override
  String toString() {
    return 'ReadmeState.loadFailure(failure: $failure, isStarSwitched: $isStarSwitched)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _LoadFailure &&
            const DeepCollectionEquality().equals(other.failure, failure) &&
            const DeepCollectionEquality()
                .equals(other.isStarSwitched, isStarSwitched));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(failure),
      const DeepCollectionEquality().hash(isStarSwitched));

  @JsonKey(ignore: true)
  @override
  _$LoadFailureCopyWith<_LoadFailure> get copyWith =>
      __$LoadFailureCopyWithImpl<_LoadFailure>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(bool isStarSwitched) initial,
    required TResult Function(bool isStarSwitched) loadInProgress,
    required TResult Function(Fresh<Readme?> readme, bool isStarSwitched)
        loadSuccess,
    required TResult Function(GithubFailure failure, bool isStarSwitched)
        loadFailure,
  }) {
    return loadFailure(failure, isStarSwitched);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(bool isStarSwitched)? initial,
    TResult Function(bool isStarSwitched)? loadInProgress,
    TResult Function(Fresh<Readme?> readme, bool isStarSwitched)? loadSuccess,
    TResult Function(GithubFailure failure, bool isStarSwitched)? loadFailure,
  }) {
    return loadFailure?.call(failure, isStarSwitched);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(bool isStarSwitched)? initial,
    TResult Function(bool isStarSwitched)? loadInProgress,
    TResult Function(Fresh<Readme?> readme, bool isStarSwitched)? loadSuccess,
    TResult Function(GithubFailure failure, bool isStarSwitched)? loadFailure,
    required TResult orElse(),
  }) {
    if (loadFailure != null) {
      return loadFailure(failure, isStarSwitched);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_LoadInProgress value) loadInProgress,
    required TResult Function(_LoadSuccess value) loadSuccess,
    required TResult Function(_LoadFailure value) loadFailure,
  }) {
    return loadFailure(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_LoadInProgress value)? loadInProgress,
    TResult Function(_LoadSuccess value)? loadSuccess,
    TResult Function(_LoadFailure value)? loadFailure,
  }) {
    return loadFailure?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_LoadInProgress value)? loadInProgress,
    TResult Function(_LoadSuccess value)? loadSuccess,
    TResult Function(_LoadFailure value)? loadFailure,
    required TResult orElse(),
  }) {
    if (loadFailure != null) {
      return loadFailure(this);
    }
    return orElse();
  }
}

abstract class _LoadFailure extends ReadmeState {
  const factory _LoadFailure(final GithubFailure failure,
      {final bool isStarSwitched}) = _$_LoadFailure;
  const _LoadFailure._() : super._();

  GithubFailure get failure => throw _privateConstructorUsedError;
  @override
  bool get isStarSwitched => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$LoadFailureCopyWith<_LoadFailure> get copyWith =>
      throw _privateConstructorUsedError;
}
