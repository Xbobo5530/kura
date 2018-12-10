import 'package:kura/src/models/question.dart';

final List<Question> allQuestions = [
  Question(
      question: 'Unatumia mtandao gani wa sim?',
      votes: [23, 66],
      choices: ['vodacom', 'tigo']),
  Question(
    question: 'Unapendelea movie za aina gani kai ya hizi?',
    votes: [10, 5, 22],
    choices: [
      'american movies',
      'African movie',
      'Indian movies',
    ],
  ),
  Question(
      question: 'Chagua aina ya sim unayotumia kati ya hizi',
      votes: [23, 66, 55, 86, 69],
      choices: ['Samsung', 'Apple iPhone', 'One Plus', 'Nokia', 'Huawei']),
  Question(
      question: 'Unakipato cha sh ngapi kwa mwezi?',
      votes: [102, 353, 45],
      choices: ['<100,000', '<500,000', '>1,000,000']),
  Question(
      question: 'Unapenda nyama ya aina gani?',
      votes: [43, 56, 41, 66, 75],
      choices: ['mbuzi', 'kuku', 'ng\'ombe', 'kondoo', 'sungura']),
  Question(
      question: 'Unakula breakfast muda gani kilasiku?',
      votes: [94, 75],
      choices: ['Kabla ya saa tatu', 'Baada ya saa tatu']),
  Question(
      question: 'Je unajihusisha ma biashara ya ukulima?',
      votes: [43, 54],
      choices: ['ndio', 'hapana']),
];
