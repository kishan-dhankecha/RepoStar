// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'github_headers.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_GithubHeaders _$$_GithubHeadersFromJson(Map<String, dynamic> json) =>
    _$_GithubHeaders(
      eTag: json['eTag'] as String?,
      link: json['link'] == null
          ? null
          : PaginationLink.fromJson(json['link'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$_GithubHeadersToJson(_$_GithubHeaders instance) =>
    <String, dynamic>{
      'eTag': instance.eTag,
      'link': instance.link?.toJson(),
    };

_$_PaginationLink _$$_PaginationLinkFromJson(Map<String, dynamic> json) =>
    _$_PaginationLink(
      maxPage: json['maxPage'] as int,
    );

Map<String, dynamic> _$$_PaginationLinkToJson(_$_PaginationLink instance) =>
    <String, dynamic>{
      'maxPage': instance.maxPage,
    };
