import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_recipe/features/recipes/presentation/bloc/recipes_bloc.dart';
import 'package:flutter_recipe/features/recipes/presentation/bloc/recipes_event.dart';

class RecipesControls extends StatefulWidget {
  const RecipesControls({
    Key? key,
  }) : super(key: key);

  @override
  _RecipesControlsState createState() => _RecipesControlsState();
}

class _RecipesControlsState extends State<RecipesControls> {
  final controller = TextEditingController();
  String? inputStr;
  bool isSearchAllowed = true;
  String dropdownValue = 'Cal+';
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        TextField(
          focusNode: FocusNode(descendantsAreFocusable: false),
          controller: controller,
          decoration: InputDecoration(
            border: OutlineInputBorder(),
            hintText: 'Input a name',
          ),
          onChanged: (value) {
            if (isSearchAllowed) {
              isSearchAllowed = false;
              BlocProvider.of<RecipesBloc>(context).add(GetRecipesData(value));
              Future<void>.delayed(const Duration(milliseconds: 500),
                  () => isSearchAllowed = true);
            }
          },
        ),
      ],
    );
  }

  void getData() async {
    Future.delayed(const Duration(milliseconds: 500), () {
      BlocProvider.of<RecipesBloc>(context).add(GetRecipesData(inputStr!));
    });

    // Future.delayed(Duration(milliseconds: 500));
    //controller.clear();
    // BlocProvider.of<RecipesBloc>(context).add(GetRecipesData(inputStr!));
    // FocusScope.of(context).requestFocus(FocusNode());
  }

  void saveData() async {}
}

//TODO: 1. Calories Sort
