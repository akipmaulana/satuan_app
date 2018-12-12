import 'package:flutter/material.dart';
import 'package:satuan_app/src/ui/pages/home_page.dart';
import 'blocs/bloc_provider.dart';
import 'blocs/application_bloc.dart';

Future<void> main() async {
  debugPrintRebuildDirtyWidgets = true;
  return runApp(
      BlocProvider<ApplicationBloc>(
        bloc: ApplicationBloc(),
        child: BlocProvider<ApplicationBloc>(
          bloc: ApplicationBloc(),
          child: MyApp(),
        ),
      )
  );
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: BlocProvider<ApplicationBloc>(
          child: HomePage(),
          bloc: ApplicationBloc()
      )
    );
  }
}
