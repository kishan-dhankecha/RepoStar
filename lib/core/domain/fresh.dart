import 'package:freezed_annotation/freezed_annotation.dart';

part 'fresh.freezed.dart';

@freezed
class Fresh<T> with _$Fresh<T> {
  const Fresh._();
  const factory Fresh({
    required T entity,
    required bool isFresh,
    bool? hasNextPage,
  }) = _Fresh<T>;

  factory Fresh.yes(T entity, {bool? hasNextPage}) {
    return Fresh(
      entity: entity,
      isFresh: true,
      hasNextPage: hasNextPage,
    );
  }
  factory Fresh.no(T entity, {bool? hasNextPage}) {
    return Fresh(
      entity: entity,
      isFresh: false,
      hasNextPage: hasNextPage,
    );
  }
}
