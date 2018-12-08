import 'package:kura/src/utils/consts.dart';
import 'package:meta/meta.dart';

class Question {
  String id, question, createdBy;
  int createdAt;

  List<int> votes;
  List<String> tags, choices;

  Question(
      {this.id,
      @required this.question,
      this.createdAt,
      this.votes,
      @required this.choices,
      this.createdBy,
      this.tags}): assert(question != null), assert(choices != null);

  Question.fromSnapshot(var document)
      : this.id = document[FIELD_ID],
        this.question = document[FIELD_QUESTION],
        this.createdBy = document[FIELD_CREATED_BY],
        this.createdAt = document[FIELD_CREATED_AT],
        this.votes = document[FIELD_VOTES],
        this.choices = document[FIELD_CHOICES],
        this.tags = document[FIELD_TAGS];
}
