import 'package:flutter_recipe/core/datasources/recipes_remote_data_source.dart';
import 'package:flutter_recipe/core/error/exceptions.dart';
import 'package:flutter_recipe/core/error/failures.dart';
import 'package:flutter_recipe/features/recipes/domain/entities/datum.dart';
import 'package:flutter_recipe/features/recipes/domain/repositories/recipes_repository.dart';

class RecipesRepositoryImpl implements RecipesRepository {
  final RecipesRemoteDataSource remoteDataSource;

  RecipesRepositoryImpl({required this.remoteDataSource});

  @override
  Future<Datum> getRecipes(String name) async {
    try {
      final recipe = await remoteDataSource.getRecipes(name);
      return recipe;
    } on ServerException {
      throw ServerFailure();
    }
  }

  @override
  Future<void> saveRecipes(Datum datum) async {
   await remoteDataSource.saveRecipes(datum);
  }
}
