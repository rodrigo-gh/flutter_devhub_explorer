import 'package:dartz/dartz.dart';
import 'package:dev_hub_explorer/features/search_repos/domain/entities/github_repo.dart';
import 'package:dev_hub_explorer/features/search_repos/domain/repositories/i_search_repository.dart';
import 'package:dev_hub_explorer/features/search_repos/domain/usecases/search_by_text.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockSearchRepository extends Mock implements ISearchRepository {}

void main() {
  late SearchByText usecase;
  late MockSearchRepository mockRepository;

  setUp(() {
    mockRepository = MockSearchRepository();
    usecase = SearchByText(mockRepository);
  });

  final testRepositories = <GithubRepo>[
    const GithubRepo(
      name: "Test Name",
      description: "description",
      ownerAvatar: "ownerAvatar.png",
      stars: 10,
    ),
  ];

  const testSearchText = "Test";

  test("Deve retornar uma lista de GithubRepo", () async {
    when(
      () => mockRepository.searchRepositories(any()),
    ).thenAnswer((_) async => Right(testRepositories));

    //ACT
    final result = await usecase(testSearchText);

    //ASSERT
    expect(result, Right(testRepositories));

    verify(() => mockRepository.searchRepositories(testSearchText)).called(1);

    verifyNoMoreInteractions(mockRepository);
  });
}
