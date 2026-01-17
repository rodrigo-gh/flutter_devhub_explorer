import 'package:dartz/dartz.dart';
import 'package:dev_hub_explorer/core/errors/exceptions.dart';
import 'package:dev_hub_explorer/core/errors/failures.dart';
import 'package:dev_hub_explorer/features/search_repos/data/datasources/i_search_datasource.dart';
import 'package:dev_hub_explorer/features/search_repos/domain/entities/github_repo.dart';
import 'package:dev_hub_explorer/features/search_repos/domain/repositories/i_search_repository.dart';

class SearchRepositoryImpl implements ISearchRepository {
  final ISearchDatasource datasource;

  SearchRepositoryImpl(this.datasource);

  @override
  Future<Either<Failure, List<GithubRepo>>> searchRepositories(
    String searchText,
  ) async {
    try {
      final result = await datasource.getSearch(searchText);
      return Right(result);
    } on ServerException {
      return Left(ServerFailure('Falha no servidor'));
    } catch (e) {
      return Left(ServerFailure('Falha na conexão'));
    }
  }
}
