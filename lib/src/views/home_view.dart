import 'package:flutter/material.dart';
import 'package:kura/src/mock_data/mock_data.dart';
import 'package:kura/src/mock_data/mock_tags.dart';
import 'package:kura/src/views/question_card.dart';
import 'package:kura/src/views/tag_item.dart';

class HomeView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final _searchSection = Container(
      
    );
    final _questionsSection = Center(
      child: Stack(
        children: allQuestions
            .map((question) => QuestionCardView(question: question))
            .toList(),
      ),
    );

    final _tagsSection = Padding(
        padding: const EdgeInsets.all(8),
        child: Container(
          width: MediaQuery.of(context).size.width,
          height: 28,
          child: ListView(
            scrollDirection: Axis.horizontal,
            children: mockTags.map((tag) => TagItemView(tag: tag)).toList(),
          ),
        ));
    return Column(
      children: <Widget>[
        _searchSection,
        Expanded(
          child: _questionsSection,
        ),
        _tagsSection
      ],
    );
  }
}