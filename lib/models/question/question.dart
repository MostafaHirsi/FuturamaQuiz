import 'package:equatable/equatable.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:json_annotation/json_annotation.dart';

part 'question.freezed.dart';
part 'question.g.dart';

@freezed
class Question with _$Question {
  const factory Question(
      {required String id,
      required String question,
      required String possibleAnswers,
      required String correctAnswer}) = _Question;

  factory Question.fromJson(Map<String, dynamic> json) =>
      _$QuestionFromJson(json);
}
