import 'package:flutter_recipe/core/database/recipe.dart';
import 'package:flutter_recipe/core/usecases/usecase.dart';
import 'package:flutter_recipe/features/history/domain/repositories/history_repository.dart';

class ReadRecipes implements HistoryUseCase<RecipeItem> {
  final HistoryRepository repository;

  ReadRecipes(this.repository);

  @override
  Future<List<RecipeItem>> readRecipes() async {
    return await repository.readRecipes();
  }
}
