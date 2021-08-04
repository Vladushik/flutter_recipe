import 'package:flutter_recipe/core/database/recipe.dart';

abstract class HistoryRepository {
  Future<List<RecipeItem>> readRecipes();
}
