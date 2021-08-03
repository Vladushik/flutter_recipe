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
        SizedBox(height: 10),
        Row(
          children: <Widget>[
            Expanded(
              flex: 2,
              child: RaisedButton(
                child: Text('Save'),
                color: Theme.of(context).accentColor,
                textTheme: ButtonTextTheme.primary,
                onPressed: getData,
              ),
            ),
            SizedBox(width: 10),
            Expanded(
              flex: 5,
              child: RaisedButton(
                child: Text('Search'),
                color: Theme.of(context).accentColor,
                textTheme: ButtonTextTheme.primary,
                onPressed: getData,
              ),
            ),
            SizedBox(width: 10),
            DropdownButton<String>(
              value: dropdownValue,
              iconSize: 24,
              elevation: 16,
              style: TextStyle(color: Colors.deepPurple),
              underline: Container(
                height: 2,
                color: Colors.deepPurpleAccent,
              ),
              onChanged: (String? newValue) {
                setState(() {
                  dropdownValue = newValue!;
                });
              },
              items: <String>['Cal+', 'Cal-']
                  .map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
            ),
          ],
        )
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

  void saveData() async {
    controller.clear();
    BlocProvider.of<RecipesBloc>(context).add(GetRecipesData(inputStr!));
    FocusScope.of(context).requestFocus(FocusNode());
  }
}

//TODO: 1. Calories Sort
//TODO: 2. Click on item
//TODO: 3. Save button
