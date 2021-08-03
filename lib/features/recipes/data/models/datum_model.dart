import 'dart:convert';

import 'package:flutter_recipe/features/recipes/domain/entities/datum.dart';

DatumModel datumModelFromJson(String str) =>
    DatumModel.fromJson(json.decode(str));

String datumModelToJson(DatumModel data) => json.encode(data.toJson());

class DatumModel extends Datum {
  DatumModel({required this.hits}) : super(hits: hits);

  final List<HitModel> hits;

  factory DatumModel.fromJson(Map<String, dynamic> json) => DatumModel(
        hits: List<HitModel>.from(
          json["hits"].map((x) => HitModel.fromJson(x)),
        ),
      );

  Map<String, dynamic> toJson() =>
      {"hits": List<dynamic>.from(hits.map((x) => x.toJson()))};
}

class HitModel extends Hit {
  HitModel({required this.recipe}) : super(recipe: recipe);

  final RecipeModel recipe;

  factory HitModel.fromJson(Map<String, dynamic> json) => HitModel(
        recipe: RecipeModel.fromJson(json["recipe"]),
      );

  Map<String, dynamic> toJson() => {"recipe": recipe.toJson()};
}

class RecipeModel extends Recipe {
  RecipeModel({
    required this.label,
    required this.image,
    required this.ingredientLines,
    required this.calories,
  }) : super(
            label: label,
            image: image,
            ingredientLines: ingredientLines,
            calories: calories);

  final String label;
  final String image;
  final List<String> ingredientLines;

  final double calories;

  factory RecipeModel.fromJson(Map<String, dynamic> json) => RecipeModel(
        label: json["label"],
        image: json["image"],
        ingredientLines:
            List<String>.from(json["ingredientLines"].map((x) => x)),
        calories: json["calories"].toDouble(),
      );

  Map<String, dynamic> toJson() => {
        "label": label,
        "image": image,
        "ingredientLines": List<dynamic>.from(ingredientLines.map((x) => x)),
        "calories": calories,
      };
}
