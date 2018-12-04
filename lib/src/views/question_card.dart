import 'package:flutter/material.dart';
import 'package:kura/src/models/question.dart';

class QuestionCardView extends StatelessWidget {
  final Question question;

  const QuestionCardView({Key key, this.question}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height/2,
      width: MediaQuery.of(context).size.width/1.3,
      child:Card(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Expanded(child: Center(child: Text(question.question))),
              ButtonBar(
                alignment: MainAxisAlignment.center,
                children: <Widget>[
                  IconButton(
                    iconSize: 80,
                    color: Colors.red,
                    icon: Icon(Icons.cancel),
                    onPressed: () {},
                  ),
                  IconButton(
                    iconSize: 80,
                    color: Colors.green,
                    icon: Icon(Icons.check_circle),
                    onPressed: () {},
                  )
                ],
              )
            ],
          ),
        ));
  }
}