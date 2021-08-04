abstract class UseCase<Type, Params> {
  Future<Type> call(Params params);
}

abstract class SaveRecipesUseCase<Type> {
  Future<void> saveRecipes(Type type);
}

abstract class HistoryUseCase<RecipeItem> {
  Future<List<RecipeItem>> readRecipes();
}
