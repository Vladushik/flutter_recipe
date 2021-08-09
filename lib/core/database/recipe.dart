import 'package:flutter_recipe/features/recipes/domain/entities/datum.dart';

class RecipeItem {
  final String label;
  final String image;
  final List<String> ingredientLines;
  final double calories;

  RecipeItem({
    required this.label,
    required this.image,
    required this.ingredientLines,
    required this.calories,
  });

  static RecipeItem fromDB(Map<String, dynamic> json) => RecipeItem(
        label: json['label'],
        image: json["image"],
        ingredientLines:
            List<String>.from(json["ingredientLines"].map((dynamic x) => x)),
        calories: json["calories"],
      );

  Map<String, dynamic> toDB() => <String, dynamic>{
        'label': label,
        'image': image,
        'ingredientLines':
            List<dynamic>.from(ingredientLines.map<dynamic>((dynamic x) => x)),
        'calories': calories,
      };

  // Recipe toEntity() => Recipe(label: label, image: image, ingredientLines: ingredientLines, calories: calories);
}
