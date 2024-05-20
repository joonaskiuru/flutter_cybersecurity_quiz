import 'package:cybersecurity_quiz_app/logic/bloc/quiz_bloc.dart';
import 'package:cybersecurity_quiz_app/logic/bloc/quiz_event.dart';
import 'package:cybersecurity_quiz_app/logic/bloc/quiz_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class QuizList extends StatefulWidget {
  @override
  State<QuizList> createState() => _QuizList();
}

class _QuizList extends State<QuizList> {
  final _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_onScroll);
    context.read<QuizBloc>().add(LoadQuizzes());
  }

  @override
  void dispose() {
    _scrollController
      ..removeListener(_onScroll)
      ..dispose();
    super.dispose();
  }

  // This method reacts to scrolling.
  void _onScroll() {
    if (_isBottom) context.read<QuizBloc>().add(LoadQuizzes());
  }

  // Check if user has scrolled all the way to the bottom.
  bool get _isBottom {
    if (!_scrollController.hasClients) return false;
    final maxScroll = _scrollController.position.maxScrollExtent;
    final currentScroll = _scrollController.offset;
    return currentScroll >= (maxScroll * 0.9);
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<QuizBloc, QuizState>(
      builder: (context, state) {
        if (state is QuizLoading) {
          return const Center(
            child: Text("Is Loading..."),
          );
        }
        return ListView.builder(
          // itemCount:
          itemBuilder: (context, index) {
            return index >= state.quizzes.length
                ? const Center(child: CircularProgressIndicator())
                : ListTile(
                    title: Text(state.quizzes[index].category),
                  );
          },
          itemCount: state.hasReachedMax
              ? state.quizzes.length
              : state.quizzes.length + 1,
          controller: _scrollController,
        );
      },
    );
  }
}
