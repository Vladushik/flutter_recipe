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
  RecipesRemoteDataSourceImpl({required this.client});

  final http.Client client;

  @override
  Future<DatumModel> getRecipes(String name) {
    const String APP_ID = '8a656bb0';
    const String APP_KEY = 'c1eabfef7f90d260dc55ee79e9320acb';
    return _getRecipesFromUrl(
        'https://api.edamam.com/search?q=$name&app_id=$APP_ID&app_key=$APP_KEY');
  }

  Future<DatumModel> _getRecipesFromUrl(String url) async {
    final Uri uri = Uri.parse(url);
    final http.Response response = await client.get(uri);

    if (response.statusCode == 200) {
      return DatumModel.fromJson(json.decode(response.body));
    } else {
      throw ServerException();
    }
  }

  @override
  Future<void> saveRecipes(Datum datum) async {
    await Firebase.initializeApp();

    await deleteAllDocuments();

    final CollectionReference<Map<String, dynamic>> recipe =
        FirebaseFirestore.instance.collection('Recipes');

    datum.hits.forEach((Hit element) {
      recipe.add(element.recipe.toDB());
    });

    return;
  }

  Future<void> deleteAllDocuments() async {
    final QuerySnapshot<Map<String, dynamic>> db =
        await FirebaseFirestore.instance.collection('Recipes').get();
    db.docs.forEach((QueryDocumentSnapshot<Map<String, dynamic>> element) {
      element.reference.delete();
    });
    return;
  }

  @override
  Future<List<RecipeItem>> readRecipes() async {
    await Firebase.initializeApp();
    final QuerySnapshot<Map<String, dynamic>> db =
        await FirebaseFirestore.instance.collection('Recipes').get();

    final List<QueryDocumentSnapshot<Map<String, dynamic>>> result = db.docs;
    final List<Map<String, dynamic>> temp = <Map<String, dynamic>>[];

    result.forEach((QueryDocumentSnapshot<Map<String, dynamic>> element) {
      temp.add(element.data());
    });

    return temp.map((Map<String, dynamic> e) => RecipeItem.fromDB(e)).toList();

    // db.docs.forEach((element) {
    //  return element.reference;
    // });
  }
}
