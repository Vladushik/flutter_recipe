import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_recipe/features/recipes/domain/entities/datum.dart';

import 'package:flutter_recipe/features/recipes/domain/usecases/get_recipes.dart';
import 'package:flutter_recipe/features/recipes/domain/usecases/save_recipes.dart';
import 'package:flutter_recipe/features/recipes/presentation/bloc/recipes_event.dart';
import 'package:flutter_recipe/features/recipes/presentation/bloc/recipes_state.dart';

class RecipesBloc extends Bloc<RecipesEvent, RecipesState> {
  final GetRecipes getRecipes;
  final SaveRecipes saveRecipes;

  RecipesBloc({
    required this.getRecipes,
    required this.saveRecipes,
  }) : super(Empty());

  @override
  Stream<RecipesState> mapEventToState(RecipesEvent event) async* {
    if (event is GetRecipesData) {
      final input = event.nameString;

      yield Loading();

      final failureOrSimilar = await getRecipes(Params(name: input));
      yield* _eitherLoadedOrErrorState(failureOrSimilar);

      yield Loaded(datum: failureOrSimilar);
    } else if (event is SaveRecipesData) {
      await saveRecipes(event.list);
    }
  }

  Stream<RecipesState> _eitherLoadedOrErrorState(
    Datum datum,
  ) async* {
    yield Loaded(datum: datum);
  }
}
