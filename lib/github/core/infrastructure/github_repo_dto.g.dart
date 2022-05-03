// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'github_repo_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_GithubRepoDTO _$$_GithubRepoDTOFromJson(Map<String, dynamic> json) =>
    _$_GithubRepoDTO(
      owner: UserDTO.fromJson(json['owner'] as Map<String, dynamic>),
      name: json['name'] as String,
      description: _descriptionFromJson(json['description']),
      starGazersCount: json['stargazers_count'] as int,
    );

Map<String, dynamic> _$$_GithubRepoDTOToJson(_$_GithubRepoDTO instance) =>
    <String, dynamic>{
      'owner': instance.owner,
      'name': instance.name,
      'description': instance.description,
      'stargazers_count': instance.starGazersCount,
    };
