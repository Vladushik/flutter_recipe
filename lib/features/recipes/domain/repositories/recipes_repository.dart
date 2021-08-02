import 'package:flutter_recipe/features/recipes/domain/entities/datum.dart';

abstract class RecipesRepository {
  Future<Datum> getRecipes(String name);
}
