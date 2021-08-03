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
}
