import 'package:dev_hub_explorer/features/search_repos/data/models/github_repo_model.dart';

abstract class ISearchDatasource {
  Future<List<GitHubRepoModel>> getSearch(String searchText);
}
