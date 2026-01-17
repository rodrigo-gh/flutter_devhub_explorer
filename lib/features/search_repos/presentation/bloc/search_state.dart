import 'package:dev_hub_explorer/features/search_repos/domain/entities/github_repo.dart';
import 'package:equatable/equatable.dart';

abstract class SearchState extends Equatable {
  @override
  List<Object> get props => [];
}

class SearchEmpty extends SearchState {} // Estado incial

class SearchLoading extends SearchState {} // Spinner rodando

class SearchLoaded extends SearchState { //Lista carregada
  final List<GithubRepo> repos;
  SearchLoaded(this.repos);
  @override
  List<Object> get props => [repos];
}

class SearchError extends SearchState { // Deu problema
  final String message;
  SearchError(this.message);
  @override
  List<Object> get props => [message];
}
