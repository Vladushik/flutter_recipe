import 'package:flutter_recipe/core/datasources/recipes_remote_data_source.dart';
import 'package:flutter_recipe/core/error/exceptions.dart';
import 'package:flutter_recipe/core/error/failures.dart';
import 'package:flutter_recipe/features/recipes/domain/entities/datum.dart';
import 'package:flutter_recipe/features/recipes/domain/repositories/recipes_repository.dart';

class RecipesRepositoryImpl implements RecipesRepository {
  final RecipesRemoteDataSource remoteDataSource;
//  final SimilarLocalDataSource localDataSource;
//  final NetworkInfo networkInfo;

  RecipesRepositoryImpl({
    required this.remoteDataSource,
    // required this.localDataSource,
    //  required this.networkInfo,
  });

  @override
  Future<Datum> getRecipes(String name) async {
    try {
      final recipe = await remoteDataSource.getRecipes(name);
      return recipe;
    } on ServerException {
      throw ServerFailure();
    }

    //   if (await networkInfo.isConnected) {
    //     try {
    //       final DatumModel remoteSimilar =
    //       await remoteDataSource.getSimilar(name);
    //       localDataSource.saveToDatabase(remoteSimilar);
    //       return remoteSimilar;
    //     } on ServerException {
    //       throw ServerFailure();
    //     }
    //   } else {
    //     throw CacheFailure();
    //   }
  }
}
