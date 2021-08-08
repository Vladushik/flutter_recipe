import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_recipe/core/database/recipe.dart';
import 'package:flutter_recipe/features/history/domain/usecases/read_recipes.dart';
import 'package:flutter_recipe/features/history/presentation/bloc/history_event.dart';
import 'package:flutter_recipe/features/history/presentation/bloc/history_state.dart';

class HistoryBloc extends Bloc<HistoryEvent, HistoryState> {
  final ReadRecipes readRecipes;

  HistoryBloc({required this.readRecipes}) : super(HistoryEmptyState()) {
    add(HistoryReadAllRecipesEvent());
  }

  @override
  Stream<HistoryState> mapEventToState(HistoryEvent event) async* {
    if (event is HistoryReadAllRecipesEvent) {
      yield HistoryLoadingState();
      try {
        final List<RecipeItem> _loadedRecipeList =
            await readRecipes.readRecipes();
        yield HistoryLoadedState(recipes: _loadedRecipeList);
      } catch (_) {
        yield HistoryErrorState();
      }
    }
  }
}
