import 'package:flutter/material.dart';
import 'package:flutter_recipe/core/database/recipe.dart';

class HistoryItemPage extends StatelessWidget {
  final RecipeItem recipeItem;

  const HistoryItemPage({required this.recipeItem});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            title: Text(recipeItem.label),
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
                tag: recipeItem,
                child: Image.network(
                  recipeItem.image,
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
                  child: Text(recipeItem.ingredientLines[index]),
                );
              },
              childCount: recipeItem.ingredientLines.length,
            ),
          ),
        ],
      ),
    );
  }
}
