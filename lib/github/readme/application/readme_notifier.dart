import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:repostar/core/domain/fresh.dart';
import 'package:repostar/github/core/domain/github_failure.dart';
import 'package:repostar/github/readme/domain/readme.dart';
import 'package:repostar/github/readme/infrastructure/readme_repository.dart';

part 'readme_notifier.freezed.dart';

@freezed
class ReadmeState with _$ReadmeState {
  const ReadmeState._();
  const factory ReadmeState.initial({
    @Default(false) bool isStarSwitched,
  }) = _Initial;
  const factory ReadmeState.loadInProgress({
    @Default(false) bool isStarSwitched,
  }) = _LoadInProgress;
  const factory ReadmeState.loadSuccess(
    Fresh<Readme?> readme, {
    @Default(false) bool isStarSwitched,
  }) = _LoadSuccess;
  const factory ReadmeState.loadFailure(
    GithubFailure failure, {
    @Default(false) bool isStarSwitched,
  }) = _LoadFailure;
}

class ReadmeNotifier extends StateNotifier<ReadmeState> {
  final ReadmeRepository _repository;
  ReadmeNotifier(this._repository) : super(const ReadmeState.initial());

  Future<void> getReadme(String fullName) async {
    state = const ReadmeState.loadInProgress();
    final failureOrRepoDetail = await _repository.getReadme(fullName);
    state = failureOrRepoDetail.fold(
      (l) => ReadmeState.loadFailure(l),
      (r) => ReadmeState.loadSuccess(r),
    );
  }

  Future<void> switchStarredStatus(Readme readme) async {
    state.maybeMap(
      orElse: () {},
      loadSuccess: (successState) async {
        // Optimistic update
        final stateCopy = successState.copyWith();
        final readme = successState.readme.entity;
        if (readme != null) {
          state = successState.copyWith.readme(
            entity: readme.copyWith(starred: !readme.starred),
          );

          final failOrSuccess = await _repository.switchStarredStatus(readme);

          failOrSuccess.fold(
            (l) => state = stateCopy,
            (r) {
              return r == null
                  ? state = stateCopy
                  : state = state.copyWith(isStarSwitched: true);
            },
          );
        }
      },
    );
  }
}
