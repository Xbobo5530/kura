import 'package:kura/src/utils/consts.dart';

class Question {
  String id, question, createdBy;
  int createdAt, type ;
  List<int> votes, choices;

  Question({this.id, this.question, this.createdAt,this.votes,
  this.type, this.createdBy});

  Question.fromSnapshot(var document):
  this.id = document[FIELD_ID],
  this.question = document[FIELD_QUESTION],
  this.createdBy = document[FIELD_CREATED_BY],
  this.createdAt = document[FIELD_CREATED_AT],
  this.votes = document[FIELD_VOTES],
  this.choices = document[FIELD_CHOICES],
  this.type = document[FIELD_TYPE];
}