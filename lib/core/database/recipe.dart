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

  RecipeItem copy({
    String? label,
    String? image,
    List<String>? ingredientLines,
    double? calories,
  }) =>
      RecipeItem(
        label: label ?? this.label,
        image: image ?? this.image,
        ingredientLines: ingredientLines ?? this.ingredientLines,
        calories: calories ?? this.calories,
      );

  static RecipeItem fromDB(Map<String, Object?> json) => RecipeItem(
        label: json['label'] as String,
        image: json["image"] as String,
        ingredientLines: json["ingredientLines"] as List<String>,
        calories: json["calories"] as double,
      );

  Map<String, dynamic> toDB() => {
        "label": label,
        "image": image,
        "ingredientLines": List<dynamic>.from(ingredientLines),
        "calories": calories,
      };
}
