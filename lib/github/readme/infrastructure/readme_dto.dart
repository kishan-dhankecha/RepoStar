import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:repostar/github/readme/domain/readme.dart';
import 'package:sembast/sembast.dart' show RecordSnapshot;
import 'package:sembast/timestamp.dart';

part 'readme_dto.freezed.dart';
part 'readme_dto.g.dart';

@freezed
class ReadmeDto with _$ReadmeDto {
  const ReadmeDto._();
  const factory ReadmeDto({
    required String html,
    required bool starred,
    required String fullName,
  }) = _ReadmeDto;

  factory ReadmeDto.fromJson(Map<String, dynamic> json) =>
      _$ReadmeDtoFromJson(json);

  Readme toDomain() => Readme(html: html, starred: starred, fullName: fullName);

  static const lastUsedFieldName = 'lastUsed';

  Map<String, dynamic> toSembast() {
    final json = toJson();
    json.remove('fullName');
    json[lastUsedFieldName] = Timestamp.now();
    return json;
  }

  factory ReadmeDto.fromSembast(
    RecordSnapshot<String, Map<String, dynamic>> snapshot,
  ) {
    final copiedMap = Map<String, dynamic>.from(snapshot.value);
    copiedMap['fullName'] = snapshot.key;
    return ReadmeDto.fromJson(copiedMap);
  }
}
