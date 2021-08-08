import 'package:flutter/services.dart';
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

  Future<void> getAppVersion() async {
    // String _appVersion = 'Unknown app version.';
    // String appVersion;
    // try {
    //   final String result =
    //       await MethodChannel('samples.flutter.dev/app_version')
    //           .invokeMethod('getAppVersion');
    //   appVersion = 'App version $result';
    // } on PlatformException catch (e) {
    //   appVersion = "Failed to get app version: '${e.message}'.";
    // }
    // _appVersion = appVersion;
    //   return (_appVersion);
  }
}
