import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

@immutable
sealed class QuizEvent extends Equatable {
  const QuizEvent();

  @override
  List<Object> get props => [];
}