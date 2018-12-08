import 'package:flutter/material.dart';
import 'package:kura/src/blocs/bloc_provider.dart';
import 'package:kura/src/models/question.dart';

class QuestionCardView extends StatelessWidget {
  final Question question;

  const QuestionCardView({Key key, this.question}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    // final bloc = BlocProvider.of(context);
    _getChoiceFlex(String choice) {
      final int qnPos = question.choices.indexOf(choice);
      return question.votes[qnPos];
    }

    _getRemainingFlex(String choice) {
      int totalVotes = 0;
      question.votes.forEach((choiceVote) {
        totalVotes += choiceVote;
      });
      return totalVotes - _getChoiceFlex(choice);
    }

    _buildChoiceTile(String choice) => Container(
          child: Row(
            children: <Widget>[
              Expanded(
                  flex: _getChoiceFlex(choice),
                  child: Container(
                    color: Colors.green,
                  )),
              Expanded(
                  flex: _getRemainingFlex(choice),
                  child: Container(
                    color: Colors.blue,
                  ))
            ],
          ),
        );

    return Container(
        height: MediaQuery.of(context).size.height / 2,
        width: MediaQuery.of(context).size.width / 1.3,
        child: Card(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Expanded(child: Center(child: Text(question.question))),
              Column(
                  children: question.choices
                      .map((choice) => _buildChoiceTile(choice))
                      .toList())
            ],
          ),
        ));
  }
}
