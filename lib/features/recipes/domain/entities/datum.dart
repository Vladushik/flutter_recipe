class Datum {
  Datum({required this.hits});

  final List<Hit> hits;
}

class Hit {
  Hit({required this.recipe});

  final Recipe recipe;
}

class Recipe {
  Recipe({
    required this.label,
    required this.image,
    required this.ingredientLines,
    required this.calories,
  });

  final String label;
  final String image;
  final List<String> ingredientLines;
  final double calories;

  Map<String, dynamic> toDB() => {
        "label": label,
        "image": image,
        "ingredientLines": List<dynamic>.from(ingredientLines.map((x) => x)),
        "calories": calories,
      };

  factory Recipe.fromDB(Map<String, dynamic> json) => Recipe(
        label: json["label"],
        image: json["image"],
        ingredientLines:
            List<String>.from(json["ingredientLines"].map((x) => x)),
        calories: json["calories"].toDouble(),
      );
}
