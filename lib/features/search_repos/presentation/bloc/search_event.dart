import 'package:equatable/equatable.dart';

abstract class SearchEvent extends Equatable{
  @override
  List<Object> get props => [];
}

class GetReposEvent extends SearchEvent {
  final String text;
  GetReposEvent(this.text);

  @override
  List<Object> get props => [text];
}