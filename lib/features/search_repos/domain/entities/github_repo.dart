import 'package:equatable/equatable.dart';

class GithubRepo extends Equatable {
  final String name;
  final String description;
  final String ownerAvatar;
  final int stars;

  const GithubRepo({
    required this.name,
    required this.description,
    required this.ownerAvatar,
    required this.stars,
  });

  @override
  List<Object?> get props => [name, description, ownerAvatar, stars];
}
