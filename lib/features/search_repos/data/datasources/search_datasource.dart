import 'package:dev_hub_explorer/core/errors/exceptions.dart';
import 'package:dev_hub_explorer/features/search_repos/data/datasources/i_search_datasource.dart';
import 'package:dev_hub_explorer/features/search_repos/data/models/github_repo_model.dart';
import 'package:dio/dio.dart';

class SearchDatasourceImpl implements ISearchDatasource {
  final Dio dio;

  SearchDatasourceImpl(this.dio);

  @override
  Future<List<GitHubRepoModel>> getSearch(String searchText) async {
    final query = searchText.replaceAll(' ', '%20');
    final response = await dio.get(
      'https://api.github.com/search/repositories?q=$query',
    );
    if (response.statusCode == 200) {
      final list = (response.data['items'] as List)
          .map((e) => GitHubRepoModel.fromJson(e))
          .toList();
      return list;
    } else {
      throw ServerException();
    }
  }
}
