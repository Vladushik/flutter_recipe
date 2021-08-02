import 'package:equatable/equatable.dart';
import 'package:flutter_recipe/core/usecases/usecase.dart';
import 'package:flutter_recipe/features/recipes/domain/entities/datum.dart';
import 'package:flutter_recipe/features/recipes/domain/repositories/recipes_repository.dart';

class GetRecipes implements UseCase<Datum, Params> {
  final RecipesRepository repository;

  GetRecipes(this.repository);

  @override
  Future<Datum> call(Params params) async {
    return await repository.getRecipes(params.name);
  }
}

class Params extends Equatable {
  final String name;

  Params({required this.name});

  @override
  List<Object?> get props => [name];
}
