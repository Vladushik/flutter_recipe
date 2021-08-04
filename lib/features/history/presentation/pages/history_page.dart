import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_recipe/features/history/presentation/bloc/history_bloc.dart';
import 'package:flutter_recipe/features/history/presentation/widgets/history.dart';
import 'package:flutter_recipe/injection_container.dart';

class HistoryPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider<HistoryBloc>(
      create: (_) => sl<HistoryBloc>(),
      child: Scaffold(
        appBar: AppBar(title: Text('History')),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Expanded(child: History()),
          ],
        ),
      ),
    );
  }
}
