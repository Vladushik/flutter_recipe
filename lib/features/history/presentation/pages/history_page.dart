import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter_recipe/features/history/presentation/bloc/history_bloc.dart';
import 'package:flutter_recipe/features/history/presentation/widgets/history.dart';
import 'package:flutter_recipe/injection_container.dart';

class HistoryPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider<HistoryBloc>(
      create: (_) => sl<HistoryBloc>(),
      child: Scaffold(
        appBar: AppBar(
          title: Text('history').tr(),
          actions: <Widget>[
            PopupMenuButton<int>(
              onSelected: (item) => onSelected(context, item),
              itemBuilder: (context) => [
                PopupMenuItem(value: 0, child: Text('Cal+')),
                PopupMenuItem(value: 1, child: Text('Cal-')),
              ],
            ),
          ],
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Expanded(
              child: History(),
            ),
          ],
        ),
      ),
    );
  }
}

void onSelected(BuildContext context, int item) {
  switch (item) {
    case 0:
      // Navigator.push(
      //   context,
      //   MaterialPageRoute(builder: (context) => HistoryPage()),
      // );
      break;
    case 1:
      // Navigator.push(
      //   context,
      //   MaterialPageRoute(builder: (context) => HistoryPage()),
      // );
      break;
  }
}
