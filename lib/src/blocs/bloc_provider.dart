import 'package:flutter/material.dart';
import 'package:kura/src/blocs/navigation_bloc.dart';

class BlocProvider extends InheritedWidget {
  BlocProvider(
    {
    Key key,
    this.child,
    this.navigationBloc, 
  }) : super(key: key, child: child);

  final Widget child;
  final NavigationBloc navigationBloc;

  static NavigationBloc of(BuildContext context) {
    return (context.inheritFromWidgetOfExactType(BlocProvider) as BlocProvider).navigationBloc;
  }
  

  @override
  bool updateShouldNotify(BlocProvider oldWidget) {
    return true;
  }
}
