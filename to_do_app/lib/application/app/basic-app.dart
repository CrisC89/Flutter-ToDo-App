import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

import '../core/router.dart';
import '../pages/home/bloc/navigation_todo_cubit.dart';

class BasicApp extends StatelessWidget {
  const BasicApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => NavigationToDoCubit(),
      child: MaterialApp.router(
        debugShowCheckedModeBanner: false,
        title: 'To Do App',
        localizationsDelegates: const [
          ...GlobalMaterialLocalizations.delegates,
          GlobalWidgetsLocalizations.delegate
        ],
        themeMode: ThemeMode.system,
        theme: ThemeData.from(
            useMaterial3: true,
            colorScheme: ColorScheme.fromSeed(
                seedColor: Colors.deepOrange,
                brightness: Brightness.light)),
        darkTheme: ThemeData.from(
            useMaterial3: true,
            colorScheme: ColorScheme.fromSeed(
                seedColor: Colors.deepOrange)),
        routerConfig: routes,
      ),
    );
  }


}
