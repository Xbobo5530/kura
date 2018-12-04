import 'package:flutter/material.dart';
import 'package:kura/src/utils/consts.dart';
import 'package:kura/src/views/main_view.dart';

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final _profileImage = CircleAvatar(
      backgroundColor: Colors.black12,
      child: Text('ML'),
    );
    final _allQuestions = IconButton(
      icon: Icon(Icons.view_day),
      onPressed: () {},
    );
    final _yesNoQuestions = IconButton(
      icon: Icon(Icons.assignment_turned_in),
      onPressed: () {},
    );
    final _starQuestions = IconButton(
      icon: Icon(Icons.stars),
      onPressed: () {},
    );
    final _multipleChoiceQuestions = IconButton(
      icon: Icon(Icons.assignment),
      onPressed: (){},
    );

    final _newQuestion = IconButton(
      icon: Icon(Icons.add_circle),
      onPressed: (){},
    );
    final _drawer = Material(
      color: COLOR_DRAWER,
      elevation: 4.0,
      child:Padding(
      padding: const EdgeInsets.all( 8),
      child: Column(
      children: <Widget>[
        _profileImage,
        _allQuestions,
        _yesNoQuestions,
        _starQuestions,
        _multipleChoiceQuestions,
        Spacer(),
        _newQuestion,
      ],
    )));
    return Scaffold(
      backgroundColor: COLOR_BACKGROUND,
      
      body: SafeArea(
              child: Row(
          children: <Widget>[
            _drawer,
            Expanded(
              child: MainView(),
            )
          ],
        ),
      ),
    );
  }
}
