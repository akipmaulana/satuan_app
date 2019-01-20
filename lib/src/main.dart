import 'package:flutter/material.dart';
import 'package:satuan_app/src/ui/pages/home_page.dart';
import 'blocs/bloc_provider.dart';
import 'blocs/application_bloc.dart';
import 'blocs/menu_bloc.dart';

Future<void> main() async {
  debugPrintRebuildDirtyWidgets = true;
  return runApp(
    BlocProvider<ApplicationBloc>(
      bloc: ApplicationBloc(),
      child: BlocProvider<ApplicationBloc>(
        bloc: ApplicationBloc(),
        child: MyApp(),
      ),
    ),
  );
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Converter',
      theme: ThemeData(
        fontFamily: 'Open Sans',
        primarySwatch: Colors.blue,
      ),
      home: BlocProvider<MenuBloc>(
        child: HomePage(),
        bloc: MenuBloc(),
      ),
    );
  }
}
