import 'package:equatable/equatable.dart';
import 'package:flutter_recipe/features/recipes/domain/entities/datum.dart';
import 'package:meta/meta.dart';

@immutable
abstract class RecipesState extends Equatable {
  RecipesState([List props = const <dynamic>[]]);

  @override
  List<Object> get props => [props];
}

class Empty extends RecipesState {}

class Loading extends RecipesState {}

class Loaded extends RecipesState {
  final Datum datum;

  Loaded({required this.datum});
  @override
  List<Object> get props => [datum];
}

class Error extends RecipesState {
  final String message;

  Error({required this.message});

  @override
  List<Object> get props => [message];
}
