import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_recipe/features/history/presentation/bloc/history_bloc.dart';
import 'package:flutter_recipe/features/history/presentation/bloc/history_state.dart';

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
            itemBuilder: (context, index) => Container(
              child: Card(
                color: Colors.grey[200],
                child: Container(
                  constraints: BoxConstraints(minHeight: 70),
                  padding: EdgeInsets.all(8),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('${state.recipes[index].label}'),
                      SizedBox(height: 5),
                      //Text('${state.recipes[index].type}'),
                    ],
                  ),
                ),
              ),
            ),
          );
        }

        if (state is HistoryErrorState) {
          return Center(
            child: Text('Error', style: TextStyle(fontSize: 20.0)),
          );
        }
        return Container();
      },
    );
  }
}

// DropdownButton<String>(
// value: dropdownValue,
// iconSize: 24,
// elevation: 16,
// style: TextStyle(color: Colors.deepPurple),
// underline: Container(
// height: 2,
// color: Colors.deepPurpleAccent,
// ),
// onChanged: (String? newValue) {
// setState(() {
// dropdownValue = newValue!;
// });
// },
// items: <String>['Cal+', 'Cal-']
//     .map<DropdownMenuItem<String>>((String value) {
// return DropdownMenuItem<String>(
// value: value,
// child: Text(value),
// );
// }).toList(),
// ),
