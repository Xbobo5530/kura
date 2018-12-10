import 'package:flutter/material.dart';
import 'package:kura/src/models/question.dart';
import 'package:kura/src/utils/color.dart';

class QuestionItemView extends StatefulWidget {
  final Question question;

  const QuestionItemView({Key key, this.question}) : super(key: key);
  @override
  _QuestionItemViewState createState() => _QuestionItemViewState();
}

class _QuestionItemViewState extends State<QuestionItemView> {
  bool isDisposed = false;
  int choiceFlex;

  void initState() {
    super.initState();
    choiceFlex = 0;
  }

  @override
  Widget build(BuildContext context) {
    // final bloc = BlocProvider.of(context);
    _getChoiceFlex(String choice) {
      final int qnPos = widget.question.choices.indexOf(choice);
      //return

      setState(() {
        choiceFlex = widget.question.votes[qnPos];
      });

      return widget.question.votes[qnPos];

      
      
    }

    _getTotalFlex() {
      int totalVotes = 0;
      widget.question.votes.forEach((choiceVote) {
        totalVotes += choiceVote;
      });
      return totalVotes;
    }

    _getRemainingFlex(String choice) {
      return _getTotalFlex() - _getChoiceFlex(choice);
    }

    _getPercentage(String choice) {
      return 
      _getChoiceFlex(choice) / _getTotalFlex() * 100;
    }

    _buildChoiceTile(String choice) => Stack(children: <Widget>[
          Container(
            // color: Colors.black12,
            height: 28,
            child: Row(
              children: <Widget>[
                Expanded(
                    flex: choiceFlex, //_getChoiceFlex(choice),
                    child: AnimatedContainer(
                      duration: Duration(milliseconds: 500),
                      decoration: BoxDecoration(
                          color: COLOR_PRIMARY,
                          borderRadius: BorderRadius.only(
                              topRight: Radius.circular(20),
                              bottomRight: Radius.circular(20))),
                    )),
                Expanded(
                    flex: _getRemainingFlex(choice),
                    child: Container(
                        // color: Colors.black12,
                        ))
              ],
            ),
          ),
          Container(
            height: 28,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Text(
                  choice,
                  style: TextStyle(
                      color: COLOR_TEXT,
                      fontSize: 18,
                      fontWeight: FontWeight.w300),
                ),
                Spacer(),
                Text(
                  '${_getPercentage(choice).toInt()}%',
                  style:
                      TextStyle(fontWeight: FontWeight.w300, color: COLOR_TEXT),
                )
              ],
            ),
          )
        ]);

    return Container(
        padding: const EdgeInsets.symmetric(vertical: 4),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(
                bottom: 8.0,
                left: 8,
              ),
              child: Text(
                widget.question.question,
                softWrap: true,
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
              ),
            ),
            Container(
              color: COLOR_SECONDARY_LIGHT, //Colors.black26,
              child: Column(
                  children: widget.question.choices
                      .map((choice) => _buildChoiceTile(choice))
                      .toList()),
            ),
            Divider()
          ],
        ));
  }
}

// class QuestionItemView extends StatelessWidget {
//   final Question question;

//   const QuestionItemView({Key key, this.question}) : super(key: key);
//   // @override
//   // Widget build(BuildContext context) {
//   //   // final bloc = BlocProvider.of(context);
//   //   _getChoiceFlex(String choice) {
//   //     final int qnPos = question.choices.indexOf(choice);
//   //     return question.votes[qnPos];
//   //   }

//   //   _getTotalFlex() {
//   //     int totalVotes = 0;
//   //     question.votes.forEach((choiceVote) {
//   //       totalVotes += choiceVote;
//   //     });
//   //     return totalVotes;
//   //   }

//   //   _getRemainingFlex(String choice) {
//   //     return _getTotalFlex() - _getChoiceFlex(choice);
//   //   }

//   //   _getPercentage(String choice) {
//   //     return _getChoiceFlex(choice) / _getTotalFlex() * 100;
//   //   }

//   //   _buildChoiceTile(String choice) => Stack(children: <Widget>[
//   //         Container(
//   //           // color: Colors.black12,
//   //           height: 28,
//   //           child: Row(
//   //             children: <Widget>[
//   //               Expanded(
//   //                   flex: _getChoiceFlex(choice),
//   //                   child: AnimatedContainer(
//   //                     duration: Duration(milliseconds: 500),
//   //                     decoration: BoxDecoration(
//   //                         color: COLOR_PRIMARY,
//   //                         borderRadius: BorderRadius.only(
//   //                             topRight: Radius.circular(20),
//   //                             bottomRight: Radius.circular(20))),
//   //                   )),
//   //               Expanded(
//   //                   flex: _getRemainingFlex(choice),
//   //                   child: Container(
//   //                       // color: Colors.black12,
//   //                       ))
//   //             ],
//   //           ),
//   //         ),
//   //         Container(
//   //           height: 28,
//   //           child: Row(
//   //             crossAxisAlignment: CrossAxisAlignment.center,
//   //             children: <Widget>[
//   //               Text(
//   //                 choice,
//   //                 style: TextStyle(
//   //                     color: COLOR_TEXT,
//   //                     fontSize: 18,
//   //                     fontWeight: FontWeight.w300),
//   //               ),
//   //               Spacer(),
//   //               Text(
//   //                 '${_getPercentage(choice).toInt()}%',
//   //                 style:
//   //                     TextStyle(fontWeight: FontWeight.w300, color: COLOR_TEXT),
//   //               )
//   //             ],
//   //           ),
//   //         )
//   //       ]);

//   //   return Container(
//   //       padding: const EdgeInsets.symmetric(vertical: 4),
//   //       child: Column(
//   //         crossAxisAlignment: CrossAxisAlignment.start,
//   //         mainAxisAlignment: MainAxisAlignment.center,
//   //         children: <Widget>[
//   //           Padding(
//   //             padding: const EdgeInsets.only(
//   //               bottom: 8.0,
//   //               left: 8,
//   //             ),
//   //             child: Text(
//   //               question.question,
//   //               softWrap: true,
//   //               style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
//   //             ),
//   //           ),
//   //           Container(
//   //             color: COLOR_SECONDARY_LIGHT, //Colors.black26,
//   //             child: Column(
//   //                 children: question.choices
//   //                     .map((choice) => _buildChoiceTile(choice))
//   //                     .toList()),
//   //           ),
//   //           Divider()
//   //         ],
//   //       ));
//   // }
// }
