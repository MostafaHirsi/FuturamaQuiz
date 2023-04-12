import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
part 'question.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake, includeIfNull: false)
class Question extends Equatable {
  final String id;
  final String question;
  final List<String> possibleAnswers;
  final String correctAnswer;

  const Question(
      this.id, this.question, this.possibleAnswers, this.correctAnswer);
  factory Question.fromJson(Map<String, dynamic> json) =>
      _$QuestionFromJson(json);

  @override
  List<Object?> get props => [id, question, possibleAnswers, correctAnswer];
}
