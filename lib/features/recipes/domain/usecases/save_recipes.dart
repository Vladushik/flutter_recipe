import 'package:flutter_recipe/core/usecases/usecase.dart';
import 'package:flutter_recipe/features/recipes/domain/entities/datum.dart';
import 'package:flutter_recipe/features/recipes/domain/repositories/recipes_repository.dart';

class SaveRecipes implements UseCase<void, Datum> {
  final RecipesRepository repository;

  SaveRecipes(this.repository);

  @override
  Future<void> call(Datum datum) async {
    await repository.saveRecipes(datum);
  }
}
