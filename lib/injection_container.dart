import 'package:flutter_recipe/core/datasources/recipes_remote_data_source.dart';
import 'package:flutter_recipe/features/history/data/repositories/history_repository_impl.dart';
import 'package:flutter_recipe/features/history/domain/repositories/history_repository.dart';
import 'package:flutter_recipe/features/history/domain/usecases/read_recipes.dart';
import 'package:flutter_recipe/features/history/presentation/bloc/history_bloc.dart';
import 'package:flutter_recipe/features/recipes/data/repositories/recipes_repository_impl.dart';
import 'package:flutter_recipe/features/recipes/domain/repositories/recipes_repository.dart';

import 'package:flutter_recipe/features/recipes/domain/usecases/get_recipes.dart';
import 'package:flutter_recipe/features/recipes/presentation/bloc/recipes_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:http/http.dart' as http;

import 'features/recipes/domain/usecases/save_recipes.dart';

final sl = GetIt.instance;

Future<void> init() async {
  sl.registerFactory(() => RecipesBloc(
        getRecipes: sl(),
        saveRecipes: sl(),
      ));

  // Use case
  sl.registerLazySingleton(() => GetRecipes(sl()));
  sl.registerLazySingleton(() => SaveRecipes(sl()));

  // Repo
  sl.registerLazySingleton<RecipesRepository>(
    () => RecipesRepositoryImpl(
      remoteDataSource: sl(),
      //localDataSource: sl(),
      //networkInfo: sl(),
    ),
  );
  // Data sources
  sl.registerLazySingleton<RecipesRemoteDataSource>(
    () => RecipesRemoteDataSourceImpl(client: sl()),
  );
  //
  // sl.registerLazySingleton<RecipesLocalDataSource>(
  //     () => RecipesLocalDataSourceImpl(),
  // );
  // Core
  // sl.registerLazySingleton(() => InputConverter());
  // sl.registerLazySingleton<NetworkInfo>(() => NetworkInfoImpl(sl()));
  //

  sl.registerLazySingleton(() => http.Client());
  //sl.registerLazySingleton(() => DataConnectionChecker());

  sl.registerFactory(() => HistoryBloc(readRecipes: sl()));
  // Use case
  sl.registerLazySingleton(() => ReadRecipes(sl()));
  // Repo
  sl.registerLazySingleton<HistoryRepository>(
    () => HistoryRepositoryImpl(remoteDataSource: sl()),
  );
}
