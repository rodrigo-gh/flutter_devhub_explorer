import 'package:dartz/dartz.dart';
import 'package:dev_hub_explorer/core/errors/failures.dart';
import 'package:dev_hub_explorer/features/search_repos/domain/entities/github_repo.dart';
import 'package:dev_hub_explorer/features/search_repos/domain/repositories/i_search_repository.dart';

class SearchByText {
  final ISearchRepository repository;

  SearchByText(this.repository);

  Future<Either<Failure, List<GithubRepo>>> call(String searchText) async {
    return await repository.searchRepositories(searchText);
  }
}
