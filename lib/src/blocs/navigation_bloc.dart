import 'dart:async';

import 'package:kura/src/models/question.dart';
import 'package:kura/src/utils/codes.dart';
import 'package:kura/src/utils/consts.dart';
import 'package:kura/src/utils/strings.dart';
import 'package:rxdart/rxdart.dart';
import 'package:url_launcher/url_launcher.dart';

const _tag = 'NavigationBloc';

class NavigationBloc {
  final _currentPage = BehaviorSubject<NavItem>();
  final _currentPageTitle = BehaviorSubject<String>();
  final _votesPercentage = BehaviorSubject<String>();
  final _choiceFlex = BehaviorSubject<Map<String, int>>();
  final _currentPageController = StreamController<NavItem>();
  final _appInfoController = StreamController<InfoAction>();
  final _flexController = StreamController<Map<String, Question>>();

  Stream<NavItem> get currentPage => _currentPage.stream;
  Stream<String> get currentPageTitle => _currentPageTitle.stream;
  Stream<String> get votesPercentage => _votesPercentage.stream;
  Stream<Map<String, int>> get choiceFlex => _choiceFlex.stream;
  Sink<Map<String, Question>> get calculateFlex => _flexController.sink;
  Sink<NavItem> get selectedPage => _currentPage.sink;
  Sink<InfoAction> get handleInfoAction => _appInfoController.sink;

  void close() {
    _currentPage.close();
    _currentPageController.close();
    _appInfoController.close();
    _flexController.close();
    _choiceFlex.close();
    _currentPageTitle.close();
    _votesPercentage.close();
  }

  NavigationBloc() {
    _currentPage.add(NavItem.home);
    _currentPageTitle.add(homeText);
    _appInfoController.stream.listen((action) {
      _handleInfoAction(action);
    });
    _flexController.stream.listen((choiceMap) {
      _calculateFlex(choiceMap);
    });
    _handlePageTitle();
  }

  void _handlePageTitle() {
    _currentPage.stream.listen((NavItem currentPage) {
      switch (currentPage) {
        case NavItem.profile:
          _currentPageTitle.add(profileText);
          break;
        case NavItem.home:
          _currentPageTitle.add(homeText);
          break;
        case NavItem.addQuestion:
          _currentPageTitle.add(addQuestionText);
          break;
        case NavItem.bookmarks:
          _currentPageTitle.add(bookmarksText);
          break;
        case NavItem.myQuestions:
          _currentPageTitle.add(myQuestionText);
          break;
        case NavItem.recommendations:
          _currentPageTitle.add(recomendationsText);
          break;
        case NavItem.info:
          _currentPageTitle.add(appInfoText);
          break;
        case NavItem.help:
          _currentPageTitle.add(helpText);
          break;
        default:
          _currentPageTitle.add(homeText);
      }
    });
  }

 
  _calculateFlex(Map<String, Question> choiceMap) {
    final choice = choiceMap.keys.toList()[0];
    final question = choiceMap[0];
    final votes = question.votes;
    final choiceVotes = votes[question.choices.indexOf(choice)];
    int totalVotes  = 0;
    votes.forEach((choiceVote){
      totalVotes += choiceVote;
    });
    final remainingFlex = totalVotes - choiceVotes;
    _choiceFlex.add({FLEX_CHOICE: choiceVotes, FLEX_REMAINING: remainingFlex});




  }

  // _getChoiceFlex(Question question, String choice) {
  //     final int qnPos = question.choices.indexOf(choice);
  //     return question.votes[qnPos];
  //   }

  //   _getTotalFlex(Question question) {
  //     int totalVotes = 0;
  //     question.votes.forEach((choiceVote) {
  //       totalVotes += choiceVote;
  //     });
  //     return totalVotes;
  //   }


//  _getRemainingFlex(String choice) {
//       return _getTotalFlex() - _getChoiceFlex(choice);
//     }


  _handleInfoAction(InfoAction action) {
    switch (action) {
      case InfoAction.more:
        _launch(URL_MORE);
        break;
      case InfoAction.call:
        _launch(URL_CALL);
        break;
      case InfoAction.email:
        _launch(URL_EMAIL);
        break;
    }
  }

  _launch(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }
}
