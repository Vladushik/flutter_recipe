import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_recipe/features/history/presentation/bloc/history_bloc.dart';
import 'package:flutter_recipe/features/history/presentation/bloc/history_state.dart';
import 'package:flutter_recipe/features/recipe_item/presentation/pages/history_item_page.dart';

class History extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HistoryBloc, HistoryState>(
      builder: (context, state) {
        if (state is HistoryEmptyState) {
          return Center(child: Text('No data'));
        }
        if (state is HistoryLoadingState) {
          return Center(child: CircularProgressIndicator());
        }
        if (state is HistoryLoadedState) {
          return ListView.builder(
            itemCount: state.recipes.length,
            itemBuilder: (context, index) {
              return InkWell(
                child: Card(
                  child: ListTile(
                    title: Text('${state.recipes[index].label}'),
                    subtitle: Text('${state.recipes[index].calories}'),
                    leading: Hero(
                      tag: state.recipes[index],
                      child: Image.network(
                        '${state.recipes[index].image}',
                        errorBuilder: (context, object, trace) {
                          return Image.asset('assets/images/splash_image.jpg');
                        },
                      ),
                    ),
                  ),
                ),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) =>
                            HistoryItemPage(recipeItem: state.recipes[index])),
                  );
                },
              );
            },
          );
        }
        if (state is HistoryErrorState) {
          return Center(
            child: Text('No', style: TextStyle(fontSize: 20.0)),
          );
        }
        return Container();
      },
    );
  }
}
