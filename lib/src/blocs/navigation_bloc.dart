import 'dart:async';

import 'package:kura/src/utils/codes.dart';
import 'package:kura/src/utils/consts.dart';
import 'package:rxdart/rxdart.dart';
import 'package:url_launcher/url_launcher.dart';

const _tag = 'NavigationBloc';

class NavigationBloc {
  final _currentPage = BehaviorSubject<NavItem>();
  final _choiceFlex = BehaviorSubject<double>();
  final _currentPageController = StreamController<NavItem>();
  final _appInfoController = StreamController<InfoAction>();
  final _flexController = StreamController<Map<int, List<int>>>();

  Stream<NavItem> get currentPage => _currentPage.stream;
  Stream<double> get choiceFlex => _choiceFlex.stream;
  Sink<Map<int, List<int>>> get calculateFlex => _flexController.sink;
  Sink<NavItem> get selectedPage => _currentPage.sink;
  Sink<InfoAction> get handleInfoAction => _appInfoController.sink;

  void close() {
    _currentPage.close();
    _currentPageController.close();
    _appInfoController.close();
    _flexController.close();
    _choiceFlex.close();
  }

  NavigationBloc() {
    _currentPage.add(NavItem.home);
    _appInfoController.stream.listen((action) {
      _handleInfoAction(action);
    });
    _flexController.stream.listen((Map<int, List<int>> choiceData) {
      _calculateFlex(choiceData);
    });
  }
  _calculateFlex(Map<int, List<int>> flexData) {
    final choiceVotes = flexData.keys.toList()[0];
    int totalVotes = 0;
    flexData[choiceVotes].forEach((choice) {
      totalVotes += choice;
    });

  }

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
