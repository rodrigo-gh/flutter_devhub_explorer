import 'package:dev_hub_explorer/features/search_repos/presentation/bloc/search_event.dart';
import 'package:dev_hub_explorer/features/search_repos/presentation/bloc/search_state.dart';
import 'package:dev_hub_explorer/features/search_repos/presentation/bloc/serach_bloc.dart';
import 'package:dev_hub_explorer/injection_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SearchPage extends StatelessWidget {
  const SearchPage({super.key});

  @override
  Widget build(BuildContext context) {
    // BlocProvider injeta o BloC na árvore de widgtes para essa tela
    return BlocProvider(
      create: (_) => sl<SearchBloc>(),
      child: Scaffold(
        appBar: AppBar(title: Text("DevHub Explorer")),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              const _SearchInput(),
              const SizedBox(height: 20),
              Expanded(child: const _Content()),
            ],
          ),
        ),
      ),
    );
  }
}

class _SearchInput extends StatelessWidget {
  const _SearchInput();

  @override
  Widget build(BuildContext context) {
    return TextField(
      decoration: const InputDecoration(
        labelText: "Buscar repositório",
        border: OutlineInputBorder(),
        suffixIcon: Icon(Icons.search),
      ),
      // Dispara o evento quando o usuário dá Enter no teclado
      onSubmitted: (value) {
        if (value.isNotEmpty) {
          // UI mandando evento para o BloC
          context.read<SearchBloc>().add(GetReposEvent(value));
        }
      },
    );
  }
}

// Widget que reage aos estados
class _Content extends StatelessWidget {
  const _Content();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SearchBloc, SearchState>(
      builder: (context, state) {
        if (state is SearchLoading) {
          return const Center(child: CircularProgressIndicator());
        } else if (state is SearchError) {
          return Center(child: Text(state.message));
        } else if (state is SearchLoaded) {
          final list = state.repos;

          if (list.isEmpty) {
            return const Center(child: Text("Nenhum repositório encontrado"));
          }

          return ListView.builder(
            itemCount: list.length,
            itemBuilder: (context, index) {
              final repo = list[index];
              return ListTile(
                leading: CircleAvatar(
                  backgroundImage: NetworkImage(repo.ownerAvatar),
                ),
                title: Text(repo.name),
                subtitle: Text(repo.description),
                trailing: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const Icon(Icons.star, color: Colors.amber, size: 20),
                    const SizedBox(width: 4),
                    Text(repo.stars.toString()),
                  ],
                ),
              );
            },
          );
        }
        return const Center(child: Text("Digite algo para buscar no GitHub"));
      },
    );
  }
}
