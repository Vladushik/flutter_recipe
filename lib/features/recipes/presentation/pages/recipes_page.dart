import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_recipe/features/history/presentation/pages/history_page.dart';
import 'package:flutter_recipe/features/recipes/domain/entities/datum.dart';
import 'package:flutter_recipe/features/recipes/presentation/bloc/recipes_bloc.dart';
import 'package:flutter_recipe/features/recipes/presentation/bloc/recipes_event.dart';
import 'package:flutter_recipe/features/recipes/presentation/bloc/recipes_state.dart';
import 'package:flutter_recipe/features/recipes/presentation/widgets/app_version.dart';
import 'package:flutter_recipe/features/recipes/presentation/widgets/loading_widget.dart';
import 'package:flutter_recipe/features/recipes/presentation/widgets/message_display.dart';
import 'package:flutter_recipe/features/recipes/presentation/widgets/recipes_controls.dart';
import 'package:flutter_recipe/features/recipes/presentation/widgets/recipes_display.dart';
import 'package:easy_localization/easy_localization.dart';

class RecipesPage extends StatelessWidget {
  Datum datum = Datum(hits: []);

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: Connectivity().onConnectivityChanged,
      builder:
          (BuildContext context, AsyncSnapshot<ConnectivityResult> snapshot) {
        if (snapshot != null &&
            snapshot.hasData &&
            snapshot.data != ConnectivityResult.none) {
          return Scaffold(
            appBar: AppBar(
              title: Text('recipes').tr(),
              actions: <Widget>[
                PopupMenuButton<int>(
                  onSelected: (item) => onSelected(context, item),
                  itemBuilder: (context) => [
                    PopupMenuItem(value: 0, child: Text('history').tr()),
                    PopupMenuItem(value: 1, child: Text('about').tr()),
                  ],
                ),
              ],
            ),
            body: SingleChildScrollView(
              child: buildBody(context),
            ),
            floatingActionButton: FloatingActionButton(
              onPressed: () {
                BlocProvider.of<RecipesBloc>(context)
                    .add(SaveRecipesData(list: datum));
                final snackBar = SnackBar(content: Text('data_saved').tr());
                ScaffoldMessenger.of(context).showSnackBar(snackBar);
              },
              child: Icon(Icons.save),
            ),
          );
        } else {
          return RecipesPageNoInternet();
        }
      },
    );
  }

  Widget buildBody(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(10),
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
                datum = state.datum;
                return RecipesDisplay(datum: state.datum);
              } else if (state is Error) {
                return MessageDisplay(message: state.message);
              }
              return MessageDisplay(message: 'Error');
            },
          ),
        ],
      ),
    );
  }
}

Future<String> getAppVersion() async {
  String _appVersion = 'Unknown app version.';
  String appVersion;
  try {
    final String result = await MethodChannel('samples.flutter.dev/app_version')
        .invokeMethod('getAppVersion');
    appVersion = 'App version $result';
  } on PlatformException catch (e) {
    appVersion = "Failed to get app version: '${e.message}'.";
  }
  _appVersion = appVersion;

  return (_appVersion);
}

void onSelected(BuildContext context, int item) {
  switch (item) {
    case 0:
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => HistoryPage()),
      );
      break;
    case 1:
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => AppVersionPage()),
      );

      // showDialog<String>(
      //   context: context,
      //   builder: (BuildContext context) => AlertDialog(
      //     title: Text('App Version'),
      //     content: Text('1.0.0'),
      //     actions: <Widget>[
      //       TextButton(
      //         onPressed: () => Navigator.pop(context, 'OK'),
      //         child: Text('OK'),
      //       ),
      //     ],
      //   ),
      // );
      break;
  }
}

class RecipesPageNoInternet extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: Text('no_internet').tr()),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          final snackBar = SnackBar(content: Text('no_internet').tr());
          ScaffoldMessenger.of(context).showSnackBar(snackBar);
        },
        backgroundColor: Colors.grey,
        child: Icon(Icons.save),
      ),
    );
  }
}
