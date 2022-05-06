import 'package:freezed_annotation/freezed_annotation.dart';

part 'readme.freezed.dart';

@freezed
class Readme with _$Readme {
  const Readme._();
  const factory Readme({
    required String html,
    required bool starred,
    required String fullName,
  }) = _Readme;
}
