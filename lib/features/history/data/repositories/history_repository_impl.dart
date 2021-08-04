import 'package:flutter_recipe/core/database/recipe.dart';
import 'package:flutter_recipe/core/datasources/recipes_remote_data_source.dart';
import 'package:flutter_recipe/features/history/domain/repositories/history_repository.dart';

class HistoryRepositoryImpl implements HistoryRepository {
  final RecipesRemoteDataSource remoteDataSource;

  HistoryRepositoryImpl({required this.remoteDataSource});

  @override
  Future<List<RecipeItem>> readRecipes() {
    return remoteDataSource.readRecipes();
  }

/*
  @override
  Future<Either<Failure, Datum>> getSimilar(String name) async {
    if (await networkInfo.isConnected) {
      try {
        final DatumModel remoteSimilar =
        await remoteDataSource.getSimilar(name);
        localDataSource.saveToDatabase(remoteSimilar);
        return Right(remoteSimilar);
      } on ServerException {
        return Left(ServerFailure());
      }
    } else {
      return Left(CacheFailure());
    }
  }
  */

}
