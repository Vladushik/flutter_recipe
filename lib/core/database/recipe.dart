// class DatumItem {
//   DatumItem({required this.hits});
//
//   final List<HitItem> hits;
//   DatumItem copy({
//     List<HitItem>? hits,
//   }) =>
//       DatumItem(
//         hits: hits ?? this.hits,
//       );
//
//   static DatumItem fromDB(Map<String, Object?> json) => DatumItem(
//     hits: json['hits'] as List<HitItem>,
//   );
//
//   Map<String, dynamic> toDB() => {
//     "hits": hits,
//   };
// }
//
// class HitItem {
//   HitItem({required this.recipe});
//
//   final RecipeItem recipe;
//
//   HitItem copy({
//     RecipeItem? recipe,
//   }) =>
//       HitItem(
//         recipe: recipe ?? this.recipe,
//       );
//
//
//   static HitItem fromDB(Map<String, Object?> json) => HitItem(
//     recipe: json['recipe'] as RecipeItem,
//   );
//
//   Map<String, dynamic> toDB() => {
//     "recipe": recipe,
//   };
// }

class RecipeItem {
  final String label;
  // final String image;
  // final List<String> ingredientLines;
  // final double calories;

  RecipeItem({
    required this.label,
    //  required this.image,
    //  required this.ingredientLines,
    //  required this.calories,
  });

  RecipeItem copy({
    String? label,
    //  String? image,
    //  List<String>? ingredientLines,
    //   double? calories,
  }) =>
      RecipeItem(
        label: label ?? this.label,
        //    image: image ?? this.image,
        //    ingredientLines: ingredientLines ?? this.ingredientLines,
        //     calories: calories ?? this.calories,
      );

  static RecipeItem fromDB(Map<String, Object?> json) => RecipeItem(
        label: json['label'] as String,
        //    image: json["image"] as String,
        //    ingredientLines: json["ingredientLines"] as List<String>,
        //    calories: json["calories"] as double,
      );

  Map<String, dynamic> toDB() => {
        "label": label,
        //   "image": image,
        //   "ingredientLines": List<dynamic>.from(ingredientLines),
        //    "calories": calories,
      };
}
