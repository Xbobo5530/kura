import 'package:flutter/material.dart';
import 'package:kura/src/blocs/bloc_provider.dart';
import 'package:kura/src/blocs/navigation_bloc.dart';
import 'package:kura/src/pages/home.dart';
import 'package:kura/src/utils/color.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
          navigationBloc: NavigationBloc(),
          child: MaterialApp(
        theme: ThemeData(
          // primarySwatch: Colors.blue,
          primaryColor: COLOR_PRIMARY,
          primaryColorDark: COLOR_PRIMARY_DARK,
          primaryColorLight: COLOR_PRIMARY_LIGHT,
          secondaryHeaderColor: COLOR_SECONDARY,
          accentColor: COLOR_PRIMARY_LIGHT,
          dividerColor: COLOR_PRIMARY

        ),
        home: MyHomePage(),
      ),
    );
  }
}
