import 'package:flutter/material.dart';
import 'package:flutter_recipe/features/recipes/domain/entities/datum.dart';

class RecipesItemPage extends StatelessWidget {
  final Hit hit;

  const RecipesItemPage({required this.hit});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            title: Text(hit.recipe.label),
          ),
          SliverAppBar(
            floating: true,
            pinned: true,
            snap: true,
            leading: Container(),
            expandedHeight: 250,
            stretch: true,
            flexibleSpace: FlexibleSpaceBar(
              background: Hero(
                tag: hit.recipe,
                child: Image.network(
                  hit.recipe.image,
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (context, index) {
                return Container(
                  height: 50,
                  alignment: Alignment.center,
                  color: Colors.orange[100 * (index % 9)],
                  child: Text(hit.recipe.ingredientLines[index]),
                );
              },
              childCount: hit.recipe.ingredientLines.length,
            ),
          ),
        ],
      ),
    );
  }
}
