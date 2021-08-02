import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_recipe/features/recipes/domain/entities/datum.dart';
import 'package:flutter_recipe/features/recipes/domain/usecases/get_recipes.dart';
import 'package:flutter_recipe/features/recipes/presentation/bloc/recipes_event.dart';
import 'package:flutter_recipe/features/recipes/presentation/bloc/recipes_state.dart';

const String SERVER_FAILURE_MESSAGE = 'Server Failure';
const String CACHE_FAILURE_MESSAGE = 'Cache Failure';
const String INVALID_INPUT_FAILURE_MESSAGE =
    'Invalid Input - The number must be a positive integer or zero.';

class RecipesBloc extends Bloc<RecipesEvent, RecipesState> {
  final GetRecipes getRecipes;

  RecipesBloc({
    required GetRecipes concrete,
  })   : assert(concrete != null),
        getRecipes = concrete,
        super(Empty());

  @override
  RecipesState get initialState => Empty();

  @override
  Stream<RecipesState> mapEventToState(RecipesEvent event) async* {
    if (event is GetRecipesData) {
      final inputEither = event.nameString;

      yield Loading();

      final failureOrSimilar = await getRecipes(Params(name: inputEither));
      yield* _eitherLoadedOrErrorState(failureOrSimilar);

      yield Loaded(datum: failureOrSimilar);
    }
  }

  Stream<RecipesState> _eitherLoadedOrErrorState(
    Datum datum,
  ) async* {
    yield Loaded(datum: datum);
  }

  // String _mapFailureToMessage(Failure failure) {
  //   switch (failure.runtimeType) {
  //     case ServerFailure:
  //       return SERVER_FAILURE_MESSAGE;
  //     case CacheFailure:
  //       return CACHE_FAILURE_MESSAGE;
  //     default:
  //       return 'Unexpected Error';
  //   }
  // }
}
