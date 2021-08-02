import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

@immutable
abstract class RecipesEvent extends Equatable {
  RecipesEvent([List props = const <dynamic>[]]);

  @override
  List<Object> get props => [props];
}

class GetRecipesData extends RecipesEvent {
  final String nameString;

  GetRecipesData(this.nameString) : super([nameString]);

  @override
  List<Object> get props => [nameString];
}
