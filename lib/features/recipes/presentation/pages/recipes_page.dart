import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:flutter_recipe/features/recipe_item/presentation/pages/recipe_item_page.dart';
import 'package:flutter_recipe/features/recipes/presentation/bloc/recipes_bloc.dart';
import 'package:flutter_recipe/features/recipes/presentation/bloc/recipes_state.dart';
import 'package:flutter_recipe/features/recipes/presentation/widgets/loading_widget.dart';
import 'package:flutter_recipe/features/recipes/presentation/widgets/message_display.dart';
import 'package:flutter_recipe/features/recipes/presentation/widgets/recipes_controls.dart';
import 'package:flutter_recipe/features/recipes/presentation/widgets/recipes_display.dart';
import 'package:flutter_recipe/injection_container.dart';

class RecipesPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Recipes'),
        actions: <Widget>[
          PopupMenuButton<int>(
            onSelected: (item) => onSelected(context, item),
            itemBuilder: (context) => [
              PopupMenuItem(value: 0, child: Text('History')),
              PopupMenuItem(value: 1, child: Text('About')),
            ],
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: buildBody(context),
      ),
    );
  }

  BlocProvider<RecipesBloc> buildBody(BuildContext context) {
    return BlocProvider(
      create: (_) => sl<RecipesBloc>(),
      child: Center(
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
            children: <Widget>[
              RecipesControls(),
              SizedBox(height: 10),
              BlocBuilder<RecipesBloc, RecipesState>(
                builder: (context, state) {
                  if (state is Empty) {
                    return MessageDisplay(message: 'Empty');
                  } else if (state is Loading) {
                    return LoadingWidget();
                  } else if (state is Loaded) {
                    return RecipesDisplay(datum: state.datum);
                  } else if (state is Error) {
                    return MessageDisplay(message: state.message);
                  }
                  return MessageDisplay(message: 'Error');
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

void onSelected(BuildContext context, int item) {
  switch (item) {
    case 0:
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => RecipesItemPage()),
      );
      break;
    case 1:
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => RecipesItemPage()),
      );
      break;
  }
}
