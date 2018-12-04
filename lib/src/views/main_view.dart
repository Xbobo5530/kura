import 'package:flutter/material.dart';
import 'package:kura/src/mock_data/mock_data.dart';

class MainView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: allQuestions.map((question)=> ListTile(title: 
      Text(question.question),)).toList()
      
    );
  }
}