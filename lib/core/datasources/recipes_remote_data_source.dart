import 'dart:convert';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_recipe/core/error/exceptions.dart';
import 'package:flutter_recipe/features/recipes/data/models/datum_model.dart';
import 'package:flutter_recipe/features/recipes/domain/entities/datum.dart';
import 'package:http/http.dart' as http;

abstract class RecipesRemoteDataSource {
  Future<DatumModel> getRecipes(String name);
  Future<void> saveRecipes(List<Datum> datum);
}

class RecipesRemoteDataSourceImpl implements RecipesRemoteDataSource {
  final http.Client client;

  RecipesRemoteDataSourceImpl({required this.client});

  @override
  Future<DatumModel> getRecipes(String name) {
    const APP_ID = '8a656bb0';
    const APP_KEY = 'c1eabfef7f90d260dc55ee79e9320acb';
    return _getRecipesFromUrl(
        'https://api.edamam.com/search?q=$name&app_id=$APP_ID&app_key=$APP_KEY');
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

  // Future<List<Recipe>> readAllRecipes() async {}

  Future<void> saveRecipes(List<Datum> datum) async {
    print('hello from SAVE to DB');
    // CollectionReference recipe =
    //    FirebaseFirestore.instance.collection('Recipes');
    // recipe.add({'label': 'label123'});
    // return;
  }
}

// Future<void> saveToDatabase(Datum datum) async {
//   _clearDatabase();
//   for (var item in datum.similar.results) {
//     var author = Author(name: item.name, type: item.type);
//     await _insertAuthorToDatabase(author);
//   }
// }
//
// Future<Author> _insertAuthorToDatabase(Author author) async {
//   final Database db = await AuthorsDatabase.instance.database;
//   final int id = await db.insert(tableAuthors, author.toJson());
//   return author.copy(id: id);
// }
