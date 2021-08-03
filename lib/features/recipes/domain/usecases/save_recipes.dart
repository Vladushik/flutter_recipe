import 'package:flutter_recipe/core/usecases/usecase.dart';
import 'package:flutter_recipe/features/recipes/domain/entities/datum.dart';
import 'package:flutter_recipe/features/recipes/domain/repositories/recipes_repository.dart';
import 'package:flutter_recipe/features/recipes/domain/usecases/get_recipes.dart';

class SaveRecipes implements UseCase<void, List<Datum>> {
  final RecipesRepository repository;

  SaveRecipes(this.repository);

  @override
  Future<void> call(List<Datum> datum) async {
    await repository.saveRecipes(datum);
  }



}
