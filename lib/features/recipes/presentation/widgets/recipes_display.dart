import 'package:flutter/material.dart';
import 'package:flutter_recipe/features/recipe_item/presentation/pages/recipe_item_page.dart';
import 'package:flutter_recipe/features/recipes/domain/entities/datum.dart';

class RecipesDisplay extends StatelessWidget {
  final Datum datum;

  RecipesDisplay({required this.datum});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: MediaQuery.of(context).size.height / 1.4,
          child: ListView.builder(
            itemCount: datum.hits.length,
            itemBuilder: (context, index) {
              return InkWell(
                child: Card(
                  child: ListTile(
                    leading: Image.network(
                      datum.hits[index].recipe.image,
                      errorBuilder: (context, object, trace) {
                        return Hero(
                          tag: datum.hits[index],
                          child: Image.asset('assets/images/splash_image.jpg'),
                        );
                      },
                    ),
                    title: Text(datum.hits[index].recipe.label),
                    subtitle: Text(
                      datum.hits[index].recipe.calories.toString(),
                    ),
                  ),
                ),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) =>
                          RecipesItemPage(hit: datum.hits[index]),
                    ),
                  );
                },
              );
            },
          ),
        ),
      ],
    );
  }
}
