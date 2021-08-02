import 'dart:convert';

import 'package:flutter_recipe/core/error/exceptions.dart';
import 'package:flutter_recipe/features/recipes/data/models/datum_model.dart';
import 'package:http/http.dart' as http;

abstract class RecipesRemoteDataSource {
  Future<DatumModel> getRecipes(String name);
}

class RecipesRemoteDataSourceImpl implements RecipesRemoteDataSource {
  final http.Client client;

  RecipesRemoteDataSourceImpl({required this.client});

  @override
  Future<DatumModel> getRecipes(String name) {
    const APP_ID = '8a656bb0';
    const APP_KEY = 'c1eabfef7f90d260dc55ee79e9320acb';
    return _getRecipesFromUrl(
        'https://api.edamam.com/search?q=${name}&app_id=${APP_ID}&app_key=${APP_KEY}');
  }

  Future<DatumModel> _getRecipesFromUrl(String url) async {
    final http.Response response = await client.get(
      url,
      headers: {
        'Content-Type': 'application/json',
      },
    );

    if (response.statusCode == 200) {
      return DatumModel.fromJson(json.decode(response.body));
    } else {
      throw ServerException();
    }
  }
}

//8a656bb0
// c1eabfef7f90d260dc55ee79e9320acb
