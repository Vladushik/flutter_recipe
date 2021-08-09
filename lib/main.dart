import 'package:easy_localization/easy_localization.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_recipe/features/auth/presentation/pages/login_page.dart';
import 'package:flutter_recipe/features/auth/presentation/pages/welcome_page.dart';

import 'package:flutter_recipe/features/recipes/presentation/pages/recipes_page.dart';
import 'features/recipes/presentation/bloc/recipes_bloc.dart';
import 'injection_container.dart' as di;
import 'injection_container.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  await Firebase.initializeApp();
  SystemChrome.setEnabledSystemUIOverlays(
    [SystemUiOverlay.bottom, SystemUiOverlay.top],
  );

  await di.init();
  runApp(
    EasyLocalization(
      supportedLocales: [Locale('en', 'US'), Locale('ru', 'RU')],
      path: 'assets/translations',
      fallbackLocale: Locale('en', 'US'),
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      localizationsDelegates: context.localizationDelegates,
      supportedLocales: context.supportedLocales,
      locale: context.locale,
      home: // BlocProvider<RecipesBloc>(
          //create: (_) => sl<RecipesBloc>(),
          //child:
          WelcomePage(),
      // ),
    );
  }
}
