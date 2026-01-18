import 'package:dev_hub_explorer/features/search_repos/domain/entities/github_repo.dart';

class GitHubRepoModel extends GithubRepo {
  const GitHubRepoModel({
    required super.name,
    required super.description,
    required super.ownerAvatar,
    required super.stars,
  });

  factory GitHubRepoModel.fromJson(Map<String, dynamic> json) {
    return GitHubRepoModel(
      name: json['name'] ?? '',
      description: json['description'] ?? 'Sem descrição',
      ownerAvatar: json['owner']['avatar_url'],
      stars: json['stargazers_count'],
    );
  }

  // Método opcional, útil para enviar dados POST ou salvar em cache
  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'description': description,
      'ownerAvatar': ownerAvatar,
      'stargazers_count': stars,
    };
  }
}
