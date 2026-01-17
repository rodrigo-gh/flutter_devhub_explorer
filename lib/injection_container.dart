import 'package:dev_hub_explorer/features/search_repos/data/datasources/i_search_datasource.dart';
import 'package:dev_hub_explorer/features/search_repos/data/datasources/search_datasource.dart';
import 'package:dev_hub_explorer/features/search_repos/data/repositories/search_repository_impl.dart';
import 'package:dev_hub_explorer/features/search_repos/domain/repositories/i_search_repository.dart';
import 'package:dev_hub_explorer/features/search_repos/domain/usecases/search_by_text.dart';
import 'package:dev_hub_explorer/features/search_repos/presentation/bloc/serach_bloc.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

final sl = GetIt.instance; //Service Locator

Future<void> init() async {
  //! Features - Search Repos
  // Bloc
  sl.registerFactory(() => SearchBloc(searchByText: sl()));

  // Use cases
  sl.registerLazySingleton(() => SearchByText(sl()));

  // Repository
  sl.registerLazySingleton<ISearchRepository>(() => SearchRepositoryImpl(sl()));

  // Data sourcers
  sl.registerLazySingleton<ISearchDatasource>(() => SearchDatasourceImpl(sl()));

  //! External
  sl.registerLazySingleton(() => Dio());
}
