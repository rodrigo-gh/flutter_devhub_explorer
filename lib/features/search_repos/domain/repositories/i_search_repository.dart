import 'package:dartz/dartz.dart';
import 'package:dev_hub_explorer/core/errors/failures.dart';
import 'package:dev_hub_explorer/features/search_repos/domain/entities/github_repo.dart';

abstract class ISearchRepository {
  Future<Either<Failure, List<GithubRepo>>> searchRepositories(
    String searchText,
  );
}
