import 'package:flutter/material.dart';
import 'package:flutter_recipe/features/recipes/domain/entities/datum.dart';


class RecipesDisplay extends StatelessWidget {
  final Datum datum;

  const RecipesDisplay({
    Key? key,
    required this.datum,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: MediaQuery.of(context).size.height / 1.5,
          child: ListView.builder(
            itemCount: datum.hits.length,
            itemBuilder: (context, index) {
              return ListTile(
                title: Text(datum.hits[index].recipe.label),
               // subtitle: Text(datum.similar.results[index].type),
              );
            },
          ),
        ),
      ],
    );
  }




}
