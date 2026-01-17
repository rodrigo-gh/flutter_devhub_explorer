import 'package:dev_hub_explorer/features/search_repos/domain/usecases/search_by_text.dart';
import 'package:dev_hub_explorer/features/search_repos/presentation/bloc/search_event.dart';
import 'package:dev_hub_explorer/features/search_repos/presentation/bloc/search_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SearchBloc extends Bloc<SearchEvent, SearchState> {
  final SearchByText searchByText;

  SearchBloc({required this.searchByText}) : super(SearchEmpty()) {
    on<GetReposEvent>((event, emit) async {
      emit(SearchLoading());

      final result = await searchByText(event.text);

      String mapFailureToMessage(failure) {
        // Função para mapear erros para strings amigaveis
        return 'Erro ao buscar dados';
      }

      result.fold(
        (failure) => emit(SearchError(mapFailureToMessage(failure))),
        (repos) => emit(SearchLoaded(repos)),
      );
    });
  }
}
