class Datum {
  Datum(
      {
      //   required  this.q,
      //   required  this.from,
      //   required  this.to,
      //   required  this.more,
      //   required  this.count,
      required this.hits});

  // final String q;
  // final int from;
  // final int to;
  // final bool more;
//  final int count;
  final List<Hit> hits;
}

class Hit {
  Hit({required this.recipe});

  final Recipe recipe;
}

class Recipe {
  Recipe({
    // required  this.uri,
    required this.label,
    required this.image,
    // required  this.source,
    // required  this.url,
    // required  this.shareAs,
    // required  this.recipeYield,
    // required  this.dietLabels,
    // required   this.healthLabels,
    // required  this.cautions,
    required this.ingredientLines,
    // required  this.ingredients,
    //           required this.calories,
    // required   this.totalWeight,
    // required   this.totalTime,
    // required   this.cuisineType,
    // required   this.mealType,
    // required   this.dishType,
    // required  this.totalNutrients,
    // required   this.totalDaily,
    // required   this.digest,
  });

  // final String uri;
  final String label;
  final String image;
  // final String source;
  // final String url;
  // final String shareAs;
  // final int recipeYield;
  // final List<String> dietLabels;
  // final List<String> healthLabels;
  // final List<String> cautions;
  final List<String> ingredientLines;
  // final List<Ingredient> ingredients;
  //          final double calories;
  // final double totalWeight;
  // final int totalTime;
  // final List<String> cuisineType;
  // final List<String> mealType;
  // final List<String> dishType;
  // final Map<String, Total> totalNutrients;
  // final Map<String, Total> totalDaily;
  // final List<Digest> digest;
}

// class Digest {
//   Digest({
//     required   this.label,
//     required   this.tag,
//     required   this.schemaOrgTag,
//     required  this.total,
//     required  this.hasRdi,
//     required  this.daily,
//     required   this.unit,
//     required   this.sub,
//   });
//
//   final String label;
//   final String tag;
//   final String schemaOrgTag;
//   final double total;
//   final bool hasRdi;
//   final double daily;
//   final String unit;
//   final List<Digest> sub;
// }
//
// class Ingredient {
//   Ingredient({
//     required   this.text,
//     required  this.weight,
//     required  this.foodCategory,
//     required  this.foodId,
//     required  this.image,
//   });
//
//   final String text;
//   final double weight;
//   final String foodCategory;
//   final String foodId;
//   final String image;
// }
//
// class Total {
//   Total({
//     required   this.label,
//     required   this.quantity,
//     required   this.unit,
//   });
//
//   final String label;
//   final double quantity;
//   final String unit;
// }
