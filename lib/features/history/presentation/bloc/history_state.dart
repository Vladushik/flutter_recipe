import 'package:flutter_recipe/core/database/recipe.dart';

abstract class HistoryState {}

class HistoryEmptyState extends HistoryState {}

class HistoryLoadingState extends HistoryState {}

class HistoryLoadedState extends HistoryState {
  List<RecipeItem> recipes;
  HistoryLoadedState({required this.recipes});
}

class HistoryErrorState extends HistoryState {}
