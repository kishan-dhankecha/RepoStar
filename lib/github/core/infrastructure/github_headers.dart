import 'package:dio/dio.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'github_headers.freezed.dart';
part 'github_headers.g.dart';

@freezed
class GithubHeaders with _$GithubHeaders {
  const GithubHeaders._();
  const factory GithubHeaders({
    String? eTag,
    PaginationLink? link,
  }) = _GithubHeaders;

  factory GithubHeaders.parse(Response response) {
    PaginationLink? paginationLink;
    final linkFromHeader = response.headers.map['Link']?[0];
    if (linkFromHeader != null) {
      paginationLink = PaginationLink.parse(
        linkFromHeader.split(','),
        requestUrl: '${response.requestOptions.uri}',
      );
    }
    return GithubHeaders(
      eTag: response.headers.map['ETag']?[0],
      link: paginationLink,
    );
  }

  factory GithubHeaders.fromJson(Map<String, dynamic> json) =>
      _$GithubHeadersFromJson(json);
}

@freezed
class PaginationLink with _$PaginationLink {
  const PaginationLink._();
  const factory PaginationLink({
    required int maxPage,
  }) = _PaginationLink;

  factory PaginationLink.parse(
    List<String> values, {
    required String requestUrl,
  }) {
    return PaginationLink(
      maxPage: _extractPageNumber(
        url: values.firstWhere(
          (e) => e.contains('rel="last"'),
          orElse: () => requestUrl,
        ),
      ),
    );
  }

  static int _extractPageNumber({required String url}) {
    final uriString = RegExp(
      r'[(http(s)?):\/\/(www\.)?a-zA-Z0-9@:%._\+~#=]{2,256}\.[a-z]{2,6}\b([-a-zA-Z0-9@:%_\+~#?//=]*)',
    ).stringMatch(url);
    return int.parse(Uri.parse(uriString!).queryParameters['page']!);
  }

  factory PaginationLink.fromJson(Map<String, dynamic> json) =>
      _$PaginationLinkFromJson(json);
}
