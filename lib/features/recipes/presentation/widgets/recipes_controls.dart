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

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        TextField(
          controller: controller,
          keyboardType: TextInputType.number,
          decoration: InputDecoration(
            border: OutlineInputBorder(),
            hintText: 'Input a name',
          ),
          onChanged: (value) {
            inputStr = value;
          },
          onSubmitted: (_) {
            getData();
          },
        ),
        SizedBox(height: 10),
        Row(
          children: <Widget>[
            Expanded(
              flex: 3,
              child: RaisedButton(
                child: Text('Search'),
                color: Theme.of(context).accentColor,
                textTheme: ButtonTextTheme.primary,
                onPressed: getData,
              ),
            ),
          ],
        )
      ],
    );
  }

  void getData() async {
    controller.clear();
    BlocProvider.of<RecipesBloc>(context).add(GetRecipesData(inputStr!));
    FocusScope.of(context).requestFocus(FocusNode());
  }
}
