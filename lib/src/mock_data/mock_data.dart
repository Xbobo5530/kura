import 'package:kura/src/models/question.dart';
import 'package:kura/src/utils/consts.dart';

final List<Question> allQuestions =[
  Question(question: 'Unakula breakfast kilasiku?', type: Q_TYPE_YES_NO, votes: [23,66]),
  Question(question: 'Unapendelea movie za aina gani kai ya hizi?', type: Q_TYPE_MULTIPLE_CHOICE, votes: [10,5, 22]),
  Question(question: 'Utasherekea Christmas?', type: Q_TYPE_YES_NO, votes: [23,66]),
  Question(question: 'Unakipato cha sh ngapi kwa mwezi?', type: Q_TYPE_MULTIPLE_CHOICE, votes: [102,353, 45]),
  Question(question: 'Unapenda nyama ya mbuzi?', type: Q_TYPE_STAR, votes: [43,56, 41, 66, 75]),
  // Question(question: 'Unakula breakfast kilasiku?', type: Q_TYPE_YES_NO, votes: [23,66]),
  // Question(question: 'Unakula breakfast kilasiku?', type: Q_TYPE_YES_NO, votes: [23,66]),

];