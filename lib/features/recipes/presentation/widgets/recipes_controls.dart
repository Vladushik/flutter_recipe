import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_recipe/features/recipes/presentation/bloc/recipes_bloc.dart';
import 'package:flutter_recipe/features/recipes/presentation/bloc/recipes_event.dart';
import 'package:easy_localization/easy_localization.dart';

class RecipesControls extends StatefulWidget {
  const RecipesControls({
    Key? key,
  }) : super(key: key);

  @override
  _RecipesControlsState createState() => _RecipesControlsState();
}

class _RecipesControlsState extends State<RecipesControls> {
  final controller = TextEditingController();

  bool isSearchAllowed = true;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        TextField(
          focusNode: FocusNode(descendantsAreFocusable: false),
          controller: controller,
          decoration: InputDecoration(
            border: OutlineInputBorder(),
            hintText: 'input_a_name'.tr(),
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
}
