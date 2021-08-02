// To parse this JSON data, do
//
//     final datumModel = datumModelFromJson(jsonString);

import 'dart:convert';

import 'package:flutter_recipe/features/recipes/domain/entities/datum.dart';

DatumModel datumModelFromJson(String str) =>
    DatumModel.fromJson(json.decode(str));

String datumModelToJson(DatumModel data) => json.encode(data.toJson());

class DatumModel extends Datum {
  DatumModel({
    required this.q,
    required this.from,
    required this.to,
    required this.more,
    required this.count,
    required this.hits,
  }) : super(hits: hits);

  final String q;
  final int from;
  final int to;
  final bool more;
  final int count;
  final List<HitModel> hits;

  factory DatumModel.fromJson(Map<String, dynamic> json) => DatumModel(
        q: json["q"],
        from: json["from"],
        to: json["to"],
        more: json["more"],
        count: json["count"],
        hits:
            List<HitModel>.from(json["hits"].map((x) => HitModel.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "q": q,
        "from": from,
        "to": to,
        "more": more,
        "count": count,
        "hits": List<dynamic>.from(hits.map((x) => x.toJson())),
      };
}

class HitModel extends Hit {
  HitModel({required this.recipe}) : super(recipe: recipe);

  final RecipeModel recipe;

  factory HitModel.fromJson(Map<String, dynamic> json) => HitModel(
        recipe: RecipeModel.fromJson(json["recipe"]),
      );

  Map<String, dynamic> toJson() => {
        "recipe": recipe.toJson(),
      };
}

class RecipeModel extends Recipe {
  RecipeModel({
    required this.uri,
    required this.label,
    required this.image,
    required this.source,
    required this.url,
    required this.shareAs,
    required this.recipeYield,
    required this.dietLabels,
    required this.healthLabels,
    required this.cautions,
    required this.ingredientLines,
    required this.ingredients,
    required this.calories,
    required this.totalWeight,
    required this.totalTime,
    required this.cuisineType,
    required this.mealType,
    required this.dishType,
    required this.totalNutrients,
    required this.totalDaily,
    required this.digest,
  }) : super(
            label: label,
            image: image,
            ingredientLines: ingredientLines); // calories: calories);

  final String uri;
  final String label;
  final String image;
  final String source;
  final String url;
  final String shareAs;
  final double recipeYield;
  final List<String> dietLabels;
  final List<String> healthLabels;
  final List<String> cautions;
  final List<String> ingredientLines;
  final List<IngredientModel> ingredients;
  final double calories;
  final double totalWeight;
  final double totalTime;
  final List<String> cuisineType;
  final List<String> mealType;
  final List<String> dishType;
  final Map<String, TotalModel> totalNutrients;
  final Map<String, TotalModel> totalDaily;
  final List<DigestModel> digest;

  factory RecipeModel.fromJson(Map<String, dynamic> json) => RecipeModel(
        uri: json["uri"],
        label: json["label"],
        image: json["image"],
        source: json["source"],
        url: json["url"],
        shareAs: json["shareAs"],
        recipeYield: json["yield"],
        dietLabels: List<String>.from(json["dietLabels"].map((x) => x)),
        healthLabels: List<String>.from(json["healthLabels"].map((x) => x)),
        cautions: List<String>.from(json["cautions"].map((x) => x)),
        ingredientLines:
            List<String>.from(json["ingredientLines"].map((x) => x)),
        ingredients: List<IngredientModel>.from(
            json["ingredients"].map((x) => IngredientModel.fromJson(x))),
        calories: json["calories"].toDouble(),
        totalWeight: json["totalWeight"],
        totalTime: json["totalTime"],
        cuisineType: List<String>.from(json["cuisineType"].map((x) => x)),
        mealType: List<String>.from(json["mealType"].map((x) => x)),
        dishType: List<String>.from(json["dishType"].map((x) => x)),
        totalNutrients: Map.from(json["totalNutrients"]).map(
            (k, v) => MapEntry<String, TotalModel>(k, TotalModel.fromJson(v))),
        totalDaily: Map.from(json["totalDaily"]).map(
            (k, v) => MapEntry<String, TotalModel>(k, TotalModel.fromJson(v))),
        digest: List<DigestModel>.from(
            json["digest"].map((x) => DigestModel.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "uri": uri,
        "label": label,
        "image": image,
        "source": source,
        "url": url,
        "shareAs": shareAs,
        "yield": recipeYield,
        "dietLabels": List<dynamic>.from(dietLabels.map((x) => x)),
        "healthLabels": List<dynamic>.from(healthLabels.map((x) => x)),
        "cautions": List<dynamic>.from(cautions.map((x) => x)),
        "ingredientLines": List<dynamic>.from(ingredientLines.map((x) => x)),
        "ingredients": List<dynamic>.from(ingredients.map((x) => x.toJson())),
        "calories": calories,
        "totalWeight": totalWeight,
        "totalTime": totalTime,
        "cuisineType": cuisineType == null
            ? null
            : List<dynamic>.from(cuisineType.map((x) => x)),
        "mealType": mealType == null
            ? null
            : List<dynamic>.from(mealType.map((x) => x)),
        "dishType": dishType == null
            ? null
            : List<dynamic>.from(dishType.map((x) => x)),
        "totalNutrients": Map.from(totalNutrients)
            .map((k, v) => MapEntry<String, dynamic>(k, v.toJson())),
        "totalDaily": Map.from(totalDaily)
            .map((k, v) => MapEntry<String, dynamic>(k, v.toJson())),
        "digest": List<dynamic>.from(digest.map((x) => x.toJson())),
      };
}

class DigestModel {
  DigestModel({
    required this.label,
    required this.tag,
    required this.schemaOrgTag,
    required this.total,
    required this.hasRdi,
    required this.daily,
    required this.unit,
    required this.sub,
  });

  final String label;
  final String tag;
  final String schemaOrgTag;
  final double total;
  final bool hasRdi;
  final double daily;
  final String unit;
  final List<DigestModel>? sub;

  factory DigestModel.fromJson(Map<String, dynamic> json) => DigestModel(
        label: json["label"],
        tag: json["tag"],
        schemaOrgTag:
            json["schemaOrgTag"] == null ? null : json["schemaOrgTag"],
        total: json["total"].toDouble(),
        hasRdi: json["hasRDI"],
        daily: json["daily"].toDouble(),
        unit: json["unit"],
        sub: json["sub"] == null
            ? null
            : List<DigestModel>.from(
                json["sub"].map((x) => DigestModel.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "label": label,
        "tag": tag,
        "schemaOrgTag": schemaOrgTag == null ? null : schemaOrgTag,
        "total": total,
        "hasRDI": hasRdi,
        "daily": daily,
        "unit": unit,
        "sub": sub == null
            ? null
            : List<dynamic>.from(sub!.map((x) => x.toJson())),
      };
}

class IngredientModel {
  IngredientModel({
    required this.text,
    required this.weight,
    required this.foodCategory,
    required this.foodId,
    required this.image,
  });

  final String text;
  final double weight;
  final String foodCategory;
  final String foodId;
  final String image;

  factory IngredientModel.fromJson(Map<String, dynamic> json) =>
      IngredientModel(
        text: json["text"],
        weight: json["weight"].toDouble(),
        foodCategory: json["foodCategory"],
        foodId: json["foodId"],
        image: json["image"] == null ? null : json["image"],
      );

  Map<String, dynamic> toJson() => {
        "text": text,
        "weight": weight,
        "foodCategory": foodCategory,
        "foodId": foodId,
        "image": image == null ? null : image,
      };
}

class TotalModel {
  TotalModel({
    required this.label,
    required this.quantity,
    required this.unit,
  });

  final String label;
  final double quantity;
  final String unit;

  factory TotalModel.fromJson(Map<String, dynamic> json) => TotalModel(
        label: json["label"],
        quantity: json["quantity"].toDouble(),
        unit: json["unit"],
      );

  Map<String, dynamic> toJson() => {
        "label": label,
        "quantity": quantity,
        "unit": unit,
      };
}
