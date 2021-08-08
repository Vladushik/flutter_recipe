import 'dart:convert';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_recipe/core/database/recipe.dart';
import 'package:flutter_recipe/core/error/exceptions.dart';
import 'package:flutter_recipe/features/recipes/data/models/datum_model.dart';
import 'package:flutter_recipe/features/recipes/domain/entities/datum.dart';
import 'package:http/http.dart' as http;

abstract class RecipesRemoteDataSource {
  Future<DatumModel> getRecipes(String name);
  Future<void> saveRecipes(Datum datum);
  Future<List<RecipeItem>> readRecipes();
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
    final urlka = Uri.parse(url);
    final response = await client.get(urlka);

    if (response.statusCode == 200) {
      return DatumModel.fromJson(json.decode(response.body));
    } else {
      throw ServerException();
    }
  }

  Future<void> saveRecipes(Datum datum) async {
    await Firebase.initializeApp();

    await deleteAllDocuments();

    CollectionReference recipe =
        FirebaseFirestore.instance.collection('Recipes');

    datum.hits.forEach((element) {
      recipe.add(element.recipe.toDB());
    });

    return;
  }

  Future<void> deleteAllDocuments() async {
    final db = await FirebaseFirestore.instance.collection('Recipes').get();
    db.docs.forEach((element) {
      element.reference.delete();
    });
    return;
  }

  @override
  Future<List<RecipeItem>> readRecipes() async {
    await Firebase.initializeApp();
    final db = await FirebaseFirestore.instance.collection('Recipes').get();

    final result = await db.docs;
    final temp = [];

    result.forEach((element) {
      temp.add(element.data());
    });

    return temp.map((e) => RecipeItem.fromDB(e)).toList();

    // db.docs.forEach((element) {
    //  return element.reference;
    // });
  }
}
