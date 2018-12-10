import 'package:flutter/material.dart';
import 'package:kura/src/mock_data/mock_data.dart';
import 'package:kura/src/mock_data/mock_tags.dart';
import 'package:kura/src/models/question.dart';
import 'package:kura/src/utils/color.dart';
import 'package:kura/src/views/question_item.dart';

class HomeView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final _searchSection = Container();
    final _questionsSection = Center(
      child: ListView(
        children: allQuestions
            .map((Question question) => QuestionItemView(question: question))
            .toList(),
      ),
    );

    final _tagsSection = Container(
      color: COLOR_PRIMARY,
      height: 48,
      // width: MediaQuery.of(context).size.width,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: mockTags
            .map((tag) => Padding(
                    padding: const EdgeInsets.only(right: 8),
                    child: ActionChip(
                      label: Text(tag),
                      onPressed: () {},
                    ))
                // TagItemView(tag: tag)

                )
            .toList(),
      ),
    );
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
