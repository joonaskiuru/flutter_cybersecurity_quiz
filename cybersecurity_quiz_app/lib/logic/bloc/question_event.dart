import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';

@immutable
sealed class QuestionEvent extends Equatable {
  const QuestionEvent();

  @override
  List<Object> get props => [];
}

class AnswerQuestion extends QuestionEvent {
  final int answerIndex;
  final int correctAnswerIndex;
  const AnswerQuestion(this.answerIndex, this.correctAnswerIndex);
}
