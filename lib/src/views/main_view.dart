import 'package:flutter/material.dart';
import 'package:kura/src/blocs/bloc_provider.dart';
import 'package:kura/src/utils/codes.dart';
import 'package:kura/src/views/add_question_view.dart';
import 'package:kura/src/views/bookmark_view.dart';
import 'package:kura/src/views/help_view.dart';
import 'package:kura/src/views/home_view.dart';
import 'package:kura/src/views/info_view.dart';
import 'package:kura/src/views/my_questions_view.dart';
import 'package:kura/src/views/recommendations_view.dart';

class MainView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final bloc = BlocProvider.of(context);
    return StreamBuilder<NavItem>(
      // initialData: NavItem.home,
      stream: bloc.currentPage,
      builder: (context, snapshot) {
        switch (snapshot.data) {
          case NavItem.home:
            return HomeView();
            break;
          case NavItem.addQuestion:
            return AddQuestionView();
            break;
          case NavItem.bookmarks:
            return BookmarkView();
            break;
          case NavItem.myQuestions:
            return MyQuestionsView();
            break;
          case NavItem.help:
            return HelpView();
            break;
          case NavItem.recommendations:
            return RecommendationsView();
            break;
          case NavItem.info:
            return InfoView();
            break;
          default:
            return HomeView();
        }
      },
    );
  }
}
